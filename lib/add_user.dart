import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String username;
  final int phoneNumber;
  final String email;
  final String password;
  final String password_Confirm;

  User(this.password_Confirm,
      {required this.username,
      required this.phoneNumber,
      required this.email,
      required this.password});

  Map<String, dynamic> toMap() {
    return {
      'Username': username,
      'phoneNumber': phoneNumber,
      'email': email,
      'Password': password,
    };
  }
}

class UserRepository {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<Object> addUser(User user) async {
    try {
      return await userCollection.add(user.toMap());
    } catch (e) {
      return {'status': 'ERROR', 'message': e.toString()};
    }
  }

  Future<void> deleteUser(String id) async {
    try {
      return await userCollection.doc(id).delete();
    } catch (e) {
      return;
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
