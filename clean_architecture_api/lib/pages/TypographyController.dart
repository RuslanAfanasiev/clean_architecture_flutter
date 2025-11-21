import 'package:get/get.dart';
import 'package:domain/usecases/get_course_detail.dart';
import 'package:clean_architecture_api/home_page_items/typography_page_items/course_item.dart';
import 'package:clean_architecture_api/home_page_items/typography_page_items/instructor_item.dart';
import 'package:clean_architecture_api/home_page_items/typography_page_items/lesson_item.dart';
import 'package:clean_architecture_api/home_page_items/typography_page_items/related_course_item.dart';
import 'package:domain/entities/course_detail.dart';
import 'package:domain/entities/lesson.dart' as domain_lesson;
import 'package:domain/entities/related_course.dart' as domain_related;
import 'package:domain/entities/instructor.dart' as domain_instructor;

class TypographyController extends GetxController {
  final RxList<CourseItem> items = RxList();

  final GetCourseDetail getCourseDetail;

  TypographyController(this.getCourseDetail);

  @override
  void onInit() {
    super.onInit();
    loadCourse();
  }

  Future<void> loadCourse() async {
    final courseDetail = await getCourseDetail();
    items.add(_mapToCourseItem(courseDetail));
  }

  CourseItem _mapToCourseItem(CourseDetail course) {
    return CourseItem(
      id: course.id,
      title: course.title,
      institute: course.institute,
      price: course.price,
      currency: course.currency,
      enrolledStudents: course.enrolledStudents,
      rating: course.rating,
      lectures: course.lectures,
      duration: course.duration,
      certification: course.certification,
      thumbnail: course.thumbnail,
      previewVideo: course.previewVideo,
      description: course.description,
      skills: List<String>.from(course.skills),
      courseDetails: Map<String, String>.from(course.courseDetails),
      instructor: _mapInstructor(course.instructor),
      lessons: course.lessons.map(_mapLesson).toList(),
      relatedCourses: course.relatedCourses.map(_mapRelatedCourse).toList(),
    );
  }

  InstructorItem _mapInstructor(domain_instructor.Instructor instructor) {
    return InstructorItem(
      name: instructor.name,
      title: instructor.title,
      bio: instructor.bio,
      image: instructor.image,
    );
  }

  LessonItem _mapLesson(domain_lesson.Lesson lesson) {
    return LessonItem(
      id: lesson.id,
      title: lesson.title,
      duration: lesson.duration,
      isPreview: lesson.isPreview,
    );
  }

  RelatedCourseItem _mapRelatedCourse(
    domain_related.RelatedCourse course,
  ) {
    return RelatedCourseItem(
      id: course.id,
      title: course.title,
      institute: course.institute,
      price: course.price,
      rating: course.rating,
      image: course.image,
    );
  }
}
