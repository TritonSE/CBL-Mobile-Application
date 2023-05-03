import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer' as developer;

import 'package:call_black_line/user.dart';

class Affirmation {
  final String text;
  final String uid;
  final int created;

  Affirmation({required this.text, required this.uid, required this.created});

  Map<String, dynamic> toMap() {
    return {'text': text, 'uid': uid, 'created': created};
  }
}

class AffirmationWithUsername {
  final String text;
  final String username;
  final int created;

  AffirmationWithUsername(
      {required this.text, this.username = "", required this.created});
}

class AffirmationRepository {
  final CollectionReference affirmations =
      FirebaseFirestore.instance.collection('affirmations');

  Future<Object> addAffirmation(Affirmation affirmation) async {
    try {
      developer.log(affirmation.toMap().toString());
      return await affirmations.add(affirmation.toMap());
    } catch (e) {
      return {'status': 'ERROR', 'message': e.toString()};
    }
  }

  /// Gets a list of all affirmations stored in the backend, and looks up the
  /// Users corresponding to each stored uid to obtain the username of the
  /// affirmation's creator
  Future<List<AffirmationWithUsername>> getAffirmationList() async {
    QuerySnapshot qShot = await affirmations.get();
    UserRepository users = UserRepository();

    List<AffirmationWithUsername> affirmationsWithUsernames = [];
    for (DocumentSnapshot doc in qShot.docs) {
      String uid = doc['uid'];
      String username;
      // Catch the cases where the user id is "" (which is currently the case
      // until login is finished) or the User of the uid is not found.
      try {
        DocumentSnapshot userDoc = await users.getUser(uid);
        username = userDoc.get("username");
      } catch (e) {
        username = "Unknown";
      }
      AffirmationWithUsername affirmation = AffirmationWithUsername(
        text: doc['text'],
        username: username,
        created: doc['created'],
      );
      affirmationsWithUsernames.add(affirmation);
    }
    return affirmationsWithUsernames;
  }
}
