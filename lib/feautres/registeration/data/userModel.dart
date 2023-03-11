import 'package:cloud_firestore/cloud_firestore.dart';
//Collection: Users
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
class UserModel
{
  //Collection: Users
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
String? phone;
String? name ;
String? email ;
String? token ;
List<dynamic>? enrolledCourses ;
List<dynamic>? viewedLessons ;
String? uId;
List<dynamic>? boughtCourses ;
List<dynamic>? deviceToken ;

  UserModel({
    this.phone,
    this.name,
    this.email,
    this.token,
    this.enrolledCourses,
    this.viewedLessons,
    this.uId,
    this.boughtCourses,
    this.deviceToken,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    name = json['name'];
    email = json['email'];
    token = json['token'];
    enrolledCourses = json['enrolledCourses'];
    viewedLessons = json['viewedLessons'];
    uId = json['uId'];
    boughtCourses = json['boughtCourses'];
    deviceToken = json['deviceToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['name'] = this.name;
    data['email'] = this.email;
    data['token'] = this.token;
    data['enrolledCourses'] = this.enrolledCourses;
    data['viewedLessons'] = this.viewedLessons;
    data['uId'] = this.uId;
    data['boughtCourses'] = this.boughtCourses;
    data['deviceToken'] = this.deviceToken;
    return data;
  }

  Map<String, dynamic> toMap() {
return {
      'phone': phone,
      'name': name,
      'email': email,
      'token': token,
      'enrolledCourses': enrolledCourses,
      'viewedLessons': viewedLessons,
      'uId': uId,
      'boughtCourses': boughtCourses,
      'deviceToken': deviceToken,
    };

  }
}



