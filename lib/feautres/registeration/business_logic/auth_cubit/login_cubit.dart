

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../core/cashe_helper.dart';
import '../../data/userModel.dart';
import '../../data/user_cache_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

//Collection: Teachers
// Document: teacherID
//
// - Field: name (string)
// - Field: email (string)
// - Field: photoUrl (string)
// - Field: bio (string)
// - Field: courses (array)
//
// Subcollection: Courses
// Document: courseID
//
// - Field: title (string)
// - Field: description (string)
// - Field: price (number)
// - Field: image (string)
// - Field: category (string)
// - Field: duration (number)
// - Subcollection: Chapters
// Document: chapterID
//     - Field: title (string)
//     - Field: lessons (array)
//     Subcollection: Lessons
//     Document: lessonID
//         - Field: title (string)
//         - Field: duration (number)
//         - Field: videoUrl (string)
//         - Field: quiz (array)
//
// Subcollection: LessonTitles
// Document: lessonTitle
//
// - Field: courseID (string)
// - Field: lessonID (string)
// - Field: title (string)
//
// Collection: Users
// Document: userID
//
// - Field: phone (string)
// - Field: name (string)
// - Field: email (string)
// - Field: token (string)
// - Field: enrolledCourses (array)
// - Field: viewedLessons (array)
// - Field: uId (string)
// - Field: boughtCourses (array)
// - Field: deviceCount (array)
// - Field: deviceToken (array)
//
// Subcollection: Notifications
// Document: notificationID
//
// - Field: student_id (string)
// - Field: course_code (string)
// - Field: notification (string)
// - Field: isRead (boolean)
// - Field: unreadCount (number)
// - Field: timestamp (timestamp)
// - Field: dateTime (datetime)
//
//
//   Future firebaseMessagingGetToken() async {
//     try {
//       String? value = await FirebaseMessaging.instance.getToken();
//       print('FCM Token:\n\n\n $value \n\n\n\n');
//
//       //save token in cache for current user
//       await CacheHelper.setString(key: 'token', value: value ?? '');
//
//       //save token in firebase for current user
//       await FirebaseFirestore.instance.collection('users').doc(
//           FirebaseAuth.instance.currentUser!.uid
//       ).update({
//         'token': value,
//       });
//       print(' token dh mn firebase:\n\n\n');
//       print(FirebaseAuth.instance.currentUser!.refreshToken);
//       print('token saved successfully');
//     } catch (error) {
//       print('Failed to get or save FCM token:\n\n\n $error');
//     }
//   }
//
//   UserModel? loginModel;
//   void signIn({
//     required String email,
//     required String password,
//   }) {
//     emit(LoginLoadingState());
//     print('email\n\n\n');
//    print(email);
//    print(password);
//     //
//     FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: email,
//         password: password
//     ).then((value) {
//       emit(LoginSuccessState(value.user!.uid));
//     }).catchError((FirebaseAuthException error) {
//      // error?.printStackTrace();
// //transform firbase error to string which user could understand
//       String? errorMessage;
//       switch (error.code) {
//         case "invalid-email":
//           if (kDebugMode) {
//             errorMessage = 'The email address is badly formatted.';
//           }
//           break;
//         case "user-not-found":
//           if (kDebugMode) {
//             errorMessage = 'No user found for that email.';
//           }
//           break;
//         case "wrong-password":
//           if (kDebugMode) {
//             errorMessage = 'Wrong password provided for that user.';
//           }
//           break;
//         default:
//           if (kDebugMode) {
//             errorMessage = 'The error is $error';
//           }
//       }
//       print('error firebase:\n\n\n\n\n\n\n');
//       print(error.code);
//       print('error message:\n\n\n\n\n\n\n');
//       print(errorMessage);
//       emit(LoginErrorState(errorMessage??""));
//     });
//   } make signIn fuction which first get token check if it is not in in deviceToken array then print user is already logged in
//  else if token not in deviceToken array and array length less than 3 save token  in deviceToken array
//  else if token not in deviceToken array and array length equal 3 print user is already logged in on 3 devices
  void signIn({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    print('email\n\n\n');
    print(email);
    print(password);
    //
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((userCredential) {
      var user = userCredential.user!;
      FirebaseMessaging.instance.getToken().then((token) {
        FirebaseFirestore.instance.collection('users')
            .doc(user.uid)
            .update({
          'deviceToken': FieldValue.arrayUnion([token])
        }).then((_) {
          FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .get()
              .then((doc) {
            if (doc.exists) {
              var data = doc.data();
              if (data!['deviceToken'].length < 3) {
                //i want to save user token,uid,email,name,phone in cache for future use
                var userCacheModel = UserCacheModel(
                    token: token??'',
                    uid: user.uid??'',
                    email: user.email??'',
                    name: user.displayName??'',
                    phone: user.phoneNumber??''
                );
               CacheHelper.saveUser(userCacheModel);

                emit(LoginSuccessState(user.uid));
              } else {
                emit(LoginErrorState('User is already logged in on 3 devices.'));
              }
            } else {
              emit(LoginErrorState('User data not found.'));
            }
          });
        });
      });
    }).catchError((error) {
      String? errorMessage;
      switch (error.code) {
        case "invalid-email":
          if (kDebugMode) {
            errorMessage = 'The email address is badly formatted.';
          }
          break;
        case "user-not-found":
          if (kDebugMode) {
            errorMessage = 'No user found for that email.';
          }
          break;
        case "wrong-password":
          if (kDebugMode) {
            errorMessage = 'Wrong password provided for that user.';
          }
          break;
        default:
          if (kDebugMode) {
            errorMessage = 'The error is $error';
          }
      }
      print('error firebase:\n\n\n\n\n\n\n');
      print(error.code);
      print('error message:\n\n\n\n\n\n\n');
      print(errorMessage);
      emit(LoginErrorState(errorMessage ?? ""));
    });
  }
  //todo :de fuction tanya bs na2sha syncronization
  // void signIn({
  //     required String email,
  //     required String password,
  //   }) {
  //     emit(LoginLoadingState());
  //     print('email\n\n\n');
  //     print(email);
  //     print(password);
  //     //
  //     FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: email,
  //         password: password
  //     ).then((userCredential) {
  //       var user = userCredential.user!;
  //       FirebaseFirestore.instance
  //           .collection('users')
  //           .doc(user.uid)
  //           .get()
  //           .then((doc) {
  //         if (doc.exists) {
  //           var data = doc.data();
  //           if (!data!['deviceToken'].contains(
  //               FirebaseMessaging.instance.getToken()) &&
  //               data['deviceToken'].length < 3) {
  //             FirebaseFirestore.instance
  //                 .collection('users')
  //                 .doc(user.uid)
  //                 .update({
  //               'deviceToken':
  //               FieldValue.arrayUnion([FirebaseMessaging.instance.getToken()])
  //             }).then((_) {
  //               print('Token added to deviceToken array.');
  //               emit(LoginSuccessState(user.uid));
  //             });
  //           } else if (!data['deviceToken'].contains(
  //               FirebaseMessaging.instance.getToken()) &&
  //               data['deviceToken'].length == 3) {
  //             emit(LoginErrorState('User is already logged in on 3 devices.'));
  //           } else {
  //             emit(LoginSuccessState(user.uid));
  //           }
  //         } else {
  //           emit(LoginErrorState('User data not found.'));
  //         }
  //       });
  //     }).catchError((error) {
  //       String? errorMessage;
  //       switch (error.code) {
  //         case "invalid-email":
  //           if (kDebugMode) {
  //             errorMessage = 'The email address is badly formatted.';
  //           }
  //           break;
  //         case "user-not-found":
  //           if (kDebugMode) {
  //             errorMessage = 'No user found for that email.';
  //           }
  //           break;
  //         case "wrong-password":
  //           if (kDebugMode) {
  //             errorMessage = 'Wrong password provided for that user.';
  //           }
  //           break;
  //         default:
  //           if (kDebugMode) {
  //             errorMessage = 'The error is $error';
  //           }
  //       }
  //       print('error firebase:\n\n\n\n\n\n\n');
  //       print(error.code);
  //       print('error message:\n\n\n\n\n\n\n');
  //       print(errorMessage);
  //       emit(LoginErrorState(errorMessage ?? ""));
  //     });
  //   } . edit last function to make it like that one FirebaseMessaging.instance.getToken().then((token) {
  //   FirebaseFirestore.instance.collection('users')
  //       .doc(user.user!.uid)
  //       .update({
  //     'deviceToken': FieldValue.arrayUnion([token])
  //   });
  // });



  void signOut() {
      FirebaseAuth.instance.signOut();
    }



    void getGoogleUserCredentials() async {
      emit(LoginGoogleUserLoadingState());
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!
          .authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      FirebaseAuth.instance.signInWithCredential(credential).then((value) {
        isUserExist(
            uId: value.user!.uid,
            name: value.user!.displayName,
            phone: value.user!.phoneNumber,
            email: value.user!.email,
            profilePic: value.user!.photoURL
        );
      });
    }


    void createGoogleUser({
      required String? uId,
      required String? name,
      required String? phone,
      required String? email,
      required String? profilePic
    }) {
      UserModel model = UserModel(
        viewedLessons: [],
        deviceToken: [],
        uId: uId,
        boughtCourses: [],
        enrolledCourses: [],
        name: 'Write your name...',
        phone: phone,
        email: email,

        // uID: uId,
        // name: name,
        // phone: phone ?? '0000-000-0000',
        // email: email,
        // dateTime: FieldValue.serverTimestamp(),
        // coverPic: 'https://media.cdnandroid.com/27/54/bb/52/imagen-cartoon-photo-editor-art-filter-2018-1gal.jpg',
        // profilePic: profilePic ??
        //     'https://static.toiimg.com/thumb/resizemode-4,msid-76729536,width-1200,height-900/76729536.jpg',
        // bio: 'Write you own bio...',
      );
      FirebaseFirestore.instance.collection('users').doc(uId).set(model.toMap())
          .then((value) {
        emit(CreateGoogleUserSuccessState(uId!));
      }).catchError((error) {
        emit(CreateGoogleUserErrorState());
      });
    }

    bool showPassword = false;
    IconData suffixIcon = Icons.visibility_off_outlined;

    void changeSuffixIcon(context) {
      showPassword = !showPassword;
      if (showPassword)
        suffixIcon = Icons.visibility_outlined;
      else
        suffixIcon = Icons.visibility_off_outlined;
      emit(ChangeSuffixIconState());
    }
  }

  bool userExist = false;
  Future <void> isUserExist({
    required String? uId,
    required String? name,
    required String? phone,
    required String? email,
    required String? profilePic

  }) async {
    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        if (element.id == uId)
          userExist = true;
      });
      if (userExist == false) {

    //    createGoogleUser(
    //        uId: uId,
     //       name: name,
    //        phone: phone,
    //        email: email,
   //         profilePic: profilePic
   //     );
      }
   //   else
 //       emit(LoginGoogleUserSuccessState(uId!));
    });
  }


