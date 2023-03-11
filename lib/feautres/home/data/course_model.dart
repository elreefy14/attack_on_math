////Collection: Teachers
//     // Document: teacherID
//     //
//     // - Field: name (string)
//     // - Field: email (string)
//     // - Field: photoUrl (string)
//     // - Field: bio (string)
//     // - Field: courses (array)
//     //
//     // Subcollection: Courses
//     // Document: courseID
//     //
//     // - Field: title (string)
//     // - Field: lowercaseTitle (string)
//     // - Field: description (string)
//     // - Field: price (number)
//     // - Field: image (string)
//     // - Field: category (string)
//     // - Field: duration (number)
//     // - Subcollection: Chapters
//     // Document: chapterID
//     //     - Field: title (string)
//     //     - Field: lessons (array)
//     //     Subcollection: Lessons
//     //     Document: lessonID
//     //         - Field: title (string)
//     //         - Field: duration (number)
//     //         - Field: videoUrl (string)
//     //         - Field: quiz (array)
//     //
//     // Subcollection: LessonTitles
//     // Document: lessonTitle
//     //
//     // - Field: courseID (string)
//     // - Field: lessonID (string)
//     // - Field: title (string)
//
//   ////fill all data and add it to firebase
//         TeacherModel teacherModel = TeacherModel(
//       name: '1',
//       email: '1',
//       photoUrl: '1',
//       bio: '1',
//       courses: ['1', '2'],
//     );
//     FirebaseFirestore.instance.collection('teachers')
//         .add(teacherModel.toJson())
//         .then((value) {
//       print('teacher added successfully');
//       emit(addTeacherSuccessState());
//     }).catchError((error) {
//       print('Failed to add teacher:\n\n\n $error');
//       emit(addTeacherErrorState());
//     });
//     CourseModel courseModel = CourseModel(
//       course_id: '1',
//       courseName: '1',
//       chapters: [
//         ChapterModel(title: '1', isChapterSeen: false),
//         ChapterModel(title: '1', isChapterSeen: false)
//       ],
//       courseImage: 'https://cdn.discordapp.com/attachments/1008571129012695100/1068578632596988014/IMG-20230127-WA0011.jpg',
//     );
//     FirebaseFirestore.instance.collection('courses')
//         .add(courseModel.toJson())
//         .then((value) {
//       print('course added successfully');
//       emit(addCourseSuccessState());
//     }).catchError((error) {
//       print('Failed to add course:\n\n\n $error');
//       emit(addCourseErrorState());
//     });
//     ChapterModel chapterModel = ChapterModel(
//       title: '1',
//       isChapterSeen: false,
//       lessons: [
//         LessonModel(
//           title: '1',
//           duration: 1,
//           videoUrl: '1',
//           quiz: [
//             QuizModel(
//               question: '1',
//               answers: ['1', '2'],
//               correctAnswer: '1',
//             )
//           ],
//         )
//       ],
//     );
//     FirebaseFirestore.instance.collection('chapters')
//         .add(chapterModel.toJson())
//         .then((value) {
//       print('chapter added successfully');
//       emit(addChapterSuccessState());
//     }).catchError((error) {
//       print('Failed to add chapter:\n\n\n $error');
//       emit(addChapterErrorState());
//     });
//
//     LessonModel lessonModel = LessonModel(
//       title: '1',
//       duration: 1,
//       videoUrl: '1',
//       quiz: [
//         QuizModel(
//           question: '1',
//           answers: ['1', '2'],
//           correctAnswer: '1',
//         )
//       ],
//     );
//     FirebaseFirestore.instance.collection('lessons')
//         .add(lessonModel.toJson())
//         .then((value) {
//       print('lesson added successfully');
//       emit(addLessonSuccessState());
//     }).catchError((error) {
//       print('Failed to add lesson:\n\n\n $error');
//       emit(addLessonErrorState());
//     });
//     QuizModel quizModel = QuizModel(
//       question: '1',
//       answers: ['1', '2'],
//       correctAnswer: '1',
//     );
//     FirebaseFirestore.instance.collection('quizzes')
//         .add(quizModel.toJson())
//         .then((value) {
//       print('quiz added successfully');
//       emit(addQuizSuccessState());
//     }).catchError((error) {
//       print('Failed to add quiz:\n\n\n $error');
//       emit(addQuizErrorState());
//     });
//     LessonTitleModel lessonTitleModel = LessonTitleModel(
//       courseID: '1',
//       lessonID: '1',
//       title: '1',
//     );
//     FirebaseFirestore.instance.collection('lessonTitles')
//         .add(lessonTitleModel.toJson())
//         .then((value) {
//       print('lessonTitle added successfully');
//       emit(addLessonTitleSuccessState());
//     }).catchError((error) {
//       print('Failed to add lessonTitle:\n\n\n $error');
//       emit(addLessonTitleErrorState());
//     });
//
//make model for each collection and subcollection
 class TeacherModel {
  String? name;
  String? email;
  String? photoUrl;
  String? bio;
  List<String>? courses;
  TeacherModel({
    this.name,
    this.email,
    this.photoUrl,
    this.bio,
    this.courses,
  });
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
      'bio': bio,
      'courses': courses,
    };
  }
}
class CourseModel {
//  CourseModel courseModel = CourseModel(
//
//       title: '1',
//       lowercaseTitle: '1',
//       description: '1',
//       price: 1,
//       image: '1',
//       category: '1',
//       duration: 1,
//     );
String? title;
String? lowercaseTitle;
String? description;
int? price;
String? image;
String? category;
int? duration;
  String? course_id;
  String? courseName;
  List<ChapterModel>? chapters;
  String? courseImage;
  CourseModel({
    this.title,
    this.lowercaseTitle,
    this.description ,
    this.price ,
    this.image ,
    this.category ,
    this.duration ,
    this.course_id,
    this.courseName,
    this.chapters,
    this.courseImage,
  });
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'lowercaseTitle': lowercaseTitle,
      'description': description,
      'price': price,
      'image': image,
      'category': category,
      'duration': duration,
      'course_id': course_id,
      'courseName': courseName,
      'chapters': chapters,
      'courseImage': courseImage,
    };
  }

  static CourseModel fromJson(Object? data) {
    if (data == null) {
      return CourseModel();
    }
    final Map<String, dynamic> map = data as Map<String, dynamic>;
    return CourseModel(
      title: map['title'] as String,
      lowercaseTitle: map['lowercaseTitle'] as String,
      description: map['description'] as String,
      price: map['price'] as int,
      image: map['image'] as String,
      category: map['category'] as String,
      duration: map['duration'] as int,
      course_id: map['course_id'] as String,
      courseName: map['courseName'] as String,
      chapters: map['chapters'] as List<ChapterModel>,
      courseImage: map['courseImage'] as String,
    );
  }
}
class ChapterModel {
  String? title;
  bool? isChapterSeen;
  List<LessonModel>? lessons;
  ChapterModel({
    this.title,
    this.isChapterSeen,
    this.lessons,
  });
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isChapterSeen': isChapterSeen,
      'lessons': lessons,
    };
  }
}
class LessonModel {
  String? title;
  int? duration;
  String? videoUrl;
  List<QuizModel>? quiz;
  LessonModel({
    this.title,
    this.duration,
    this.videoUrl,
    this.quiz,
  });
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'duration': duration,
      'videoUrl': videoUrl,
      'quiz': quiz,
    };
  }
}
class QuizModel {
  String? question;
  List<String>? answers;
  String? correctAnswer;
  QuizModel({
    this.question,
    this.answers,
    this.correctAnswer,
  });
  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'answers': answers,
      'correctAnswer': correctAnswer,
    };
  }
}
class LessonTitleModel {
  String? courseID;
  String? lessonID;
  String? title;
  LessonTitleModel({
    this.courseID,
    this.lessonID,
    this.title,
  });
  Map<String, dynamic> toJson() {
    return {
      'courseID': courseID,
      'lessonID': lessonID,
      'title': title,
    };
  }
}

