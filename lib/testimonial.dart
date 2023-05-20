import 'package:cloud_firestore/cloud_firestore.dart';

class Testimonial {
  final String eventTitle;
  final bool created;
  final double duration;
  final String address;
  final String description;
  final String time;

  Testimonial({
    required this.eventTitle,
    required this.created,
    required this.duration,
    required this.address,
    required this.description,
    required this.time,
  });
  Map<String, dynamic> toMap() {
    return {
      'eventTitle': eventTitle,
      'created': created,
      'duration': duration,
      'address': address,
      'description': description,
      'time': time,
    };
  }
}

class SubmitTestimonial {
  final CollectionReference testimonialCollection =
      FirebaseFirestore.instance.collection('testimonials');

  Future<Object> addTestimonial(Testimonial testimonial) async {
    try {
      return await testimonialCollection.add(testimonial.toMap());
    } catch (e) {
      return {'status': 'ERROR', 'message': e.toString()};
    }
  }

  deleteTestimonial(String docID) async {
    try {
      return await testimonialCollection.doc(docID).delete();
    } catch (e) {
      rethrow;
    }
  }
}
