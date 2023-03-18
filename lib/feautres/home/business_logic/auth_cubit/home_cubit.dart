
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:youtube_apis/feautres/home/data/course_model.dart';

import '../../../../core/cashe_helper.dart';
import '../../../../core/network/web_services.dart';
import '../../../notification/data/notifiactionModel.dart';
import '../../../registeration/data/user_cache_model.dart';
import '../../data/enrolled_model.dart';
import '../../presenation/favourite.dart';
import '../../presenation/home.dart';
import '../../presenation/profile_screen.dart';
import '../../presenation/search.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  //COURSES ( course_id , courseName, map of chapter title and isChapterSeen)
  int currentIndex = 0;
  void changeIndex(int index) {
    emit(HomeLoadingState());
    currentIndex = index;
    emit(HomeSuccessState());
  }
  List listOfScreens = [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];
 List listOfRoutes = [
    '/home',
    '/search',
    '/favorite',
    '/profile',
  ];
 // static UserCacheModel? getUser() {
  //     final jsonString = sharedPreferences.getString(AppStrings.userCacheModel);
  //     if (jsonString == null) {
  //       return null;
  //     }
  //     final jsonMap = json.decode(jsonString);
  //     return UserCacheModel.fromJson(jsonMap);
  //   }
  //make function that call above function and save it in user variable
  UserCacheModel? user;
  Future<void> getUser() async {
    user = await CacheHelper.getUser();
    print('user is ${user!.toJson()}');
    emit(getCachedUser());
  }
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
// - Field: lowercaseTitle (string)
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
// Collection: Enrollments
// Document: enrollmentID
//
// - Field: userID (string)
// - Field: courseID (string)
// - Field: teacherID (string)
// - Field: progress (number)
// - Field: isCompleted (boolean)
//
// Collection: Categories
// Document: categoryID
//
// - Field: name (string)
// - Field: image (string)
  //get uid of specific course using title of course .use 1 read from firebase
  //then in collecteion of devide token make doc is uid of specific course
  //it contain 1 field is array of device token of all users who enroll in this course




  void addTeacherAndCourseAndachaptersAndLessons() {
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
    // - Field: lowercaseTitle (string)
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
////////////////////////////////////////////////////////////////////
  ////fill all data and add it to firebase
        TeacherModel teacherModel = TeacherModel(
      name: '1',
      email: '1',
      photoUrl: '1',
      bio: '1',
      courses: ['1', '2'],
    );
    FirebaseFirestore.instance.collection('teachers')
        .add(teacherModel.toJson())
        .then((value) {
      print('teacher added successfully');
      emit(addTeacherSuccessState());
    }).catchError((error) {
      print('Failed to add teacher:\n\n\n $error');
      emit(addTeacherErrorState());
    });
    CourseModel courseModel = CourseModel(
      title: 'Math',
      lowercaseTitle: 'math',
      description: '1',
      price: 1,
      image: '1',
      category: '1',
      duration: 1,
    );
    //note that course model is subcollection of teacher model
    FirebaseFirestore.instance.collection('teachers').doc('nedk0SAZnF1BloZk54Gm')
        .collection('courses')
        .add(courseModel.toJson())
        .then((value) {
      print('course added successfully');
      emit(addCourseSuccessState());
    }).catchError((error) {
      print('Failed to add course:\n\n\n $error');
      emit(addCourseErrorState());
    });
    // ChapterModel chapterModel = ChapterModel(
    //   title: '1',
    //   lessons: [],
    // );
    // //note that chapter model is subcollection of course model
    // FirebaseFirestore.instance.collection('teachers').doc('1').collection('courses').doc('1').collection('chapters')
    //     .add(chapterModel.toJson())
    //     .then((value) {
    //   print('chapter added successfully');
    //   emit(addChapterSuccessState());
    // }).catchError((error) {
    //   print('Failed to add chapter:\n\n\n $error');
    //   emit(addChapterErrorState());
    // });
    // LessonModel lessonModel = LessonModel(
    //   title: '1',
    //   duration: 1,
    //   videoUrl: '1',
    //   quiz: [],
    // );
    // //note that lesson model is subcollection of chapter model
    // FirebaseFirestore.instance.collection('teachers').doc('1').collection('courses').doc('1').collection('chapters').doc('1').collection('lessons')
    //     .add(lessonModel.toJson())
    //     .then((value) {
    //   print('lesson added successfully');
    //   emit(addLessonSuccessState());
    // }).catchError((error) {
    //   print('Failed to add lesson:\n\n\n $error');
    //   emit(addLessonErrorState());
    // });
    // LessonTitleModel lessonTitleModel = LessonTitleModel(
    //   courseID: '1',
    //   lessonID: '1',
    //   title: '1',
    // );
    // //note that lesson title model is subcollection of course model
    // FirebaseFirestore.instance.collection('teachers').doc('1').collection('courses').doc('1').collection('lessonTitles')
    //     .add(lessonTitleModel.toJson())
    //     .then((value) {
    //   print('lesson title added successfully');
    //   emit(addLessonTitleSuccessState());
    // }).catchError((error) {
    //   print('Failed to add lesson title:\n\n\n $error');
    //   emit(addLessonTitleErrorState());
    // });
  }
  //const courseRef = db.collection("Courses").where("titleLowercase", "==", title.toLowerCase()).limit(1);
  //search course by LowerCAsedTitle and return list of courses
  Future<List<CourseModel>> searchCourse(String title) async {
    List<CourseModel> courses = [];
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('teachers')
          .get();
      print('querySnapshot');
      print(querySnapshot.docs.length);
      for (QueryDocumentSnapshot teacherDoc in querySnapshot.docs) {
        QuerySnapshot courseQuerySnapshot = await FirebaseFirestore.instance
            .collection('teachers')
            .doc(teacherDoc.id)
            .collection('courses')
            .where('lowercaseTitle',
          isGreaterThanOrEqualTo: title.toLowerCase(),
          isLessThanOrEqualTo: title.toLowerCase() + '\uf8ff',
        )
            .get();
        print('courseQuerySnapshot');
        print(courseQuerySnapshot.docs.length);
        courseQuerySnapshot.docs.forEach((courseDoc) {
          print('courseDoc');
          print(courseDoc.data());
          courses.add(CourseModel.fromJson(courseDoc.data()));
        });
      }
      print('courses\n\n');
      print(courses[0].title);
      return courses;
    } catch (e) {
      print(e);
      return courses;
    }
  }


  List<String> courseName = [];
    void getCourseName() {
      //get courses using hash
      //get course name from firebase and add it to courseName list print it and use catch error
      FirebaseFirestore.instance.collection('courses').get().then((value) {
        value.docs.forEach((element) {
          courseName.add(element['courseName']);
        });
        print(courseName);
      }).catchError((error) {
        print('Failed to get course name:\n\n\n $error');
      });
    }

    //enrolled (student_id, course_code, quarter, enrolled_at,token) get token from CacheHelper

      //fill EnrolledModel enrolledModel with data and add it to firebase emit success or error state
       enrollCourse(
          studentId, courseCode,
          ) {
        // try {
        //   String? token = await CacheHelper.getString('token');
        //   print('token mn enrolllllll');
        //   print(token);
        //   EnrolledModel enrolledModel = EnrolledModel(
        //     student_id: studentId,
        //     course_code: courseCode,
        //     enrolled_at: Timestamp.now(),
        //     token: token??'',
        //   );
        //   await FirebaseFirestore.instance.collection('enrolled')
        //       .add(enrolledModel.toJson());
        //   print('enrolled successfully');
        //   emit(enrollCourseSuccessState());
        // } catch (error) {
        //   print('Failed to enroll course:\n\n\n $error');
        //   emit(enrollCourseErrorState());
        // }
        //use then and catch error instead of try catch
        Future<String?> token = CacheHelper.getString('token').then((value) {
          print('token mn enrolllllll');
          print(value);
          EnrolledModel enrolledModel = EnrolledModel(
            student_id: studentId,
            course_code: courseCode,
            enrolled_at: Timestamp.now(),
            token: value??'',
          );
          FirebaseFirestore.instance.collection('enrolled')
              .add(enrolledModel.toJson())
              .then((value) {
            print('enrolled successfully');
            emit(enrollCourseSuccessState());
          }).catchError((error) {
            print('Failed to enroll course:\n\n\n $error');
            emit(enrollCourseErrorState());
          });
        });

      }

  void sendNotification( messageText, courseCode ,
  {studentId}

      ) {
    //print('student id \n\n\n\n');
      print(FirebaseAuth.instance.currentUser!.uid);
    //fill NotificationModel notificationModel with data and add it to firebase emit success or error state
    NotificationModel notificationModel = NotificationModel(
      student_id: FirebaseAuth.instance.currentUser!.uid,
      course_code: courseCode,
      notification: '$messageText',
      isRead: false,
     //The argument type 'Timestamp' can't be assigned to the parameter type 'DateTime?'.
     dateTime: DateTime.now(),
     timestamp: Timestamp.now(),
     // date: Timestamp.now(),

    );
    FirebaseFirestore.instance.collection('users').doc(
     studentId?? FirebaseAuth.instance.currentUser!.uid
    )
    .collection('notification').add(notificationModel.toJson())
        .then((value) {
      print('notification sent successfully');

      setNotificationId(FirebaseAuth.instance.currentUser!.uid);
   //   emit(sendNotificationSuccessState());
    }).catchError((error) {
      print('Failed to send notification:\n\n\n $error');
  //    emit(sendNotificationErrorState());
    });
  }
  //todo:send notifications
  //Collection: Users
  // Document: userID
  // - Field: phone (string)
  // - Field: name (string)
  // - Field: email (string)
  // - Field: token (string)
  // - Field: enrolledCourses (array)
  // - Field: viewedLessons (array)
  // - Field: uId (string)
  // - Field: boughtCourses (array)
  // - Field: deviceToken (array)
  //
  // Subcollection: Notifications
  // Document: notificationID
  // - Field: student_id (string)
  // - Field: course_code (string)
  // - Field: notification (string)
  // - Field: isRead (boolean)
  // - Field: unreadCount (number)
  // - Field: timestamp (timestamp)
  // - Field: dateTime (datetime)





  void sendNotificationToAllStudent(messageText, courseCode) {
    List<String> studentId = [];
    List<String> studentToken = [];
    FirebaseFirestore.instance.collection('enrolled').where('course_code',isEqualTo: courseCode).get().then((value) {
      value.docs.forEach((element) {
        sendFCMNotification(token: element['token'],messageText: messageText);
        sendNotification(
            messageText,
             courseCode,
            studentId: element['student_id']
        );

       // studentId.add(element['student_id']);
       // studentToken.add(element['token']);
      });
      print(studentId);
      print(studentToken);

    }).catchError((error) {
      print('Failed to get student id and token:\n\n\n $error');
    });
  }


  //get notification for student from firebase and notification where isRead is false and add it to unReadNotificationList list print it and use catch error use pagination to get notification and loadMoreNotifications and resetNotificationList
  List<NotificationModel> notificationList = [];
  List<NotificationModel> unReadNotificationList = [];
  void getNotification(student_id) {
    //get from list of notification from firebase and add it to notificationList list print it and use catch error
    FirebaseFirestore.instance.collection('users').doc(student_id)
        .collection('notification').orderBy('timestamp',descending: true).limit(6).get().then((value) {
      value.docs.forEach((element) {
        notificationList.add(NotificationModel.fromJson(element.data()));
        if (element['isRead'] == false) {
          unReadNotificationList.add(NotificationModel.fromJson(element.data()));
        }
      });
      print(notificationList);
      print(unReadNotificationList);
    }).catchError((error) {
      print('Failed to get notification:\n\n\n $error');
    });
  }
  void nextNotifications()
  {
    FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('notification').orderBy('timestamp',descending: true).limit(6).startAfter([notificationList[notificationList.length-1].timestamp]).get().then((value) {
      value.docs.forEach((element) {
        notificationList.add(NotificationModel.fromJson(element.data()));
        if (element['isRead'] == false) {
          unReadNotificationList.add(NotificationModel.fromJson(element.data()));
        }
      });
      print(notificationList);
      print(unReadNotificationList);
    }).catchError((error) {
      print('Failed to get notification:\n\n\n $error');
    });
  }
  void previousNotifications()
  {
    FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('notification').orderBy('timestamp',descending: true).limit(6).endBefore([notificationList[0].timestamp]).get().then((value) {
      value.docs.forEach((element) {
        notificationList.add(NotificationModel.fromJson(element.data()));
        if (element['isRead'] == false) {
          unReadNotificationList.add(NotificationModel.fromJson(element.data()));
        }
      });
      print(notificationList);
      print(unReadNotificationList);
    }).catchError((error) {
      print('Failed to get notification:\n\n\n $error');
    });
  }
  void resetNotificationList()
  {
    notificationList = [];
    unReadNotificationList = [];
  }
//for every notificatin set notificationId equal to document id
  void setNotificationId(student_id) {
    FirebaseFirestore.instance.collection('users').doc(student_id)
        .collection('notification').get().then((value) {
      value.docs.forEach((element) {
        FirebaseFirestore.instance.collection('users').doc(student_id)
            .collection('notification').doc(element.id).update({
          'notificationId': element.id,
        });
      });
    }).catchError((error) {
      print('Failed to set notification id:\n\n\n $error');
    });
  }
  //get number of unread notification for student from firebase and print it
  int unreadNotification = 0;
  void getUnreadNotification(student_id) {
    //get from list of notification from firebase and add it to notificationList list print it and use catch error
    FirebaseFirestore.instance.collection('users').doc(student_id)
        .collection('notification').get().then((value) {
      value.docs.forEach((element) {
        if (element['isRead'] == false) {
          unreadNotification++;
        }
      });
      print(unreadNotification);
    }).catchError((error) {
      print('Failed to get unread notification:\n\n\n $error');
    });
  }
  //set notification to read
  void setNotificationToRead(student_id, notificationId) {
    FirebaseFirestore.instance.collection('users').doc(student_id)
        .collection('notification').doc(notificationId).update({
      'isRead': true,
    }).then((value) {
      print('notification set to read successfully');
    }).catchError((error) {
      print('Failed to set notification to read:\n\n\n $error');
    });
  }
  //send fcm notification to student then sendNotification()
  Future<void> sendFCMNotification({
    required String? token,
     String? senderName ='A plus',
    String? messageText,
    String? messageImage,
  }) async {
    DioHelper.postData(
        data: {
          "to": "$token",
          "notification": {
            "title": "$senderName",
            "body":
            "${messageText != null ? messageText : messageImage != null ? 'Photo' : 'ERROR 404'}",
            "sound": "default"
          },
          "android": {
            "Priority": "HIGH",
          },
          "data": {
            "type": "order",
            "id": "87",
            "click_action": "FLUTTER_NOTIFICATION_CLICK"
          }
        }
    );
    emit(SendMessageSuccessState());
  }


  //get fcmtoken for student from firebase and print it
  firebaseMessagingGetTokenForEachDevice()
  {
    FirebaseMessaging.instance.getToken().then((value) {
      print('FCM Token: $value');
    }).catchError((error) {
      print('Failed to get FCM Token:\n\n\n $error');
    });
  }
  //get fcmtoken for student from firebase and print it
  Future firebaseMessagingGetToken() async {
    try {
      String? value = await FirebaseMessaging.instance.getToken();
      print('FCM Token:\n\n\n $value \n\n\n\n');

      //save token in cache for current user
      await CacheHelper.setString(key: 'token', value: value ?? '');

      //save token in firebase for current user
      await FirebaseFirestore.instance.collection('users').doc(
          FirebaseAuth.instance.currentUser!.uid
      ).update({
        'token': value,
      });
      print(' token dh mn firebase:\n\n\n');
      print(FirebaseAuth.instance.currentUser!.refreshToken);
      print('token saved successfully');
    } catch (error) {
      print('Failed to get or save FCM token:\n\n\n $error');
    }
  }







}
