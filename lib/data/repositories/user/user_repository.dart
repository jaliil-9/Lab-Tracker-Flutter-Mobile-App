import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../features/personalization/models/user_model.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../authentication/authentication_repository.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to sav euser data in Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw JBFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw JBFirebaseException(e.code).message;
    } on JBFormatException catch (_) {
      throw const JBFormatException();
    } on JBPlatformException catch (e) {
      throw JBPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again";
    }
  }

  // Function to fetch user details based on user ID
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection('Users')
          .doc(AuthenticationRepository.instance.authUser!.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseAuthException catch (e) {
      throw JBFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw JBFirebaseException(e.code).message;
    } on JBFormatException catch (_) {
      throw const JBFormatException();
    } on JBPlatformException catch (e) {
      throw JBPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again";
    }
  }

  // Function to update user data in Firestore
  Future<void> updateUserDetails(UserModel updateUser) async {
    try {
      await _db
          .collection('Users')
          .doc(updateUser.id)
          .update(updateUser.toJson());
    } on FirebaseAuthException catch (e) {
      throw JBFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw JBFirebaseException(e.code).message;
    } on JBFormatException catch (_) {
      throw const JBFormatException();
    } on JBPlatformException catch (e) {
      throw JBPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again";
    }
  }

  // Function to update one field of user data in Firestore
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection('Users')
          .doc(AuthenticationRepository.instance.authUser!.uid)
          .update(json);
    } on FirebaseAuthException catch (e) {
      throw JBFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw JBFirebaseException(e.code).message;
    } on JBFormatException catch (_) {
      throw const JBFormatException();
    } on JBPlatformException catch (e) {
      throw JBPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again";
    }
  }

  // Function to remove user data in Firestore
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection('Users').doc(userId).delete();
    } on FirebaseAuthException catch (e) {
      throw JBFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw JBFirebaseException(e.code).message;
    } on JBFormatException catch (_) {
      throw const JBFormatException();
    } on JBPlatformException catch (e) {
      throw JBPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again";
    }
  }
}
