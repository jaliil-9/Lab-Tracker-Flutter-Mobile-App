import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  String firstname;
  String lastname;
  final String email;

  UserModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
  });

  // Helper Function to get the full name
  String get fullName => '$firstname $lastname';

  // Static function to split full name to first and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

  // Static function to create and empty user model
  static UserModel empty() => UserModel(
        id: '',
        firstname: '',
        lastname: '',
        email: '',
      );

  // Convert model to Json structure for storing data ins Firebase
  Map<String, dynamic> toJson() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
    };
  }

  // Factory Method to create a UserModel from a Firebase document snapshot
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstname: data['firstname'] ?? '',
        lastname: data['lastname'] ?? '',
        email: data['email'] ?? '',
      );
    }
    return empty();
  }
}
