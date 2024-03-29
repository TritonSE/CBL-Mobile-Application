import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  //class for storing user data for firestore
  final String username;
  final String phoneNumber;
  final String email;

  UserData(
      {required this.username, required this.phoneNumber, required this.email});

  Map<String, dynamic> toMap() {
    return {'username': username, 'phoneNumber': phoneNumber, 'email': email};
  }
}

class UserRepository {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<Object> addUser(UserData user, String userid) async {
    //add document to firebase, currently using email as the document id
    try {
      await userCollection.doc(userid).set(user.toMap());
      return {'status': 'SUCCESS'};
    } catch (e) {
      return {'status': 'ERROR', 'message': e.toString()};
    }
  }

  Future<void> deleteUser(String id) async {
    //delete the user
    try {
      return await userCollection.doc(id).delete();
    } catch (e) {
      rethrow;
    }
  }

  Future<DocumentSnapshot> getUser(String id) async {
    try {
      return await userCollection.doc(id).get();
    } catch (e) {
      rethrow;
    }
  }
}

/**

UserRepository userRepository = UserRepository();
User user = User(name: 'John Doe', Phone Number: 8583165432, email: 'johndoe@example.com');
userRepository.addUser(user);

This code creates an instance of UserRepository and User,
and adds the user to the collection 
by calling the addUser method of the repository.
 */
