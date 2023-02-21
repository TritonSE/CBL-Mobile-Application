import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Testimonial {
  final String eventTitle;
  final String time;
  final double duration;
  final String address;
  final String description;

  Testimonial({
    required this.eventTitle,
    required this.time,
    required this.duration,
    required this.address,
    required this.description,
  });
  Map<String, dynamic> toMap() {
    return {
      'eventTitle': eventTitle,
      'Time': time,
      'Duration': duration,
      'Address': address,
      'Description': description,
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
