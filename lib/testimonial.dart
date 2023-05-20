import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:core';

class Testimonial {
  final String eventTitle;
  final String time;
  final String duration;
  final String address;
  final String description;
  final String time;

  Testimonial({
    required this.eventTitle,
    required this.time,
    required this.duration,
    required this.address,
    required this.description,
    required this.time,
  });
  Map<String, dynamic> toMap() {
    return {
      'eventTitle': eventTitle,
      'time': time,
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
