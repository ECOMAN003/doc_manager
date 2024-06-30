import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_manager/data/repositories/authentication/authentication_repository.dart';
import 'package:doc_manager/data/repositories/user/user_model.dart';
import 'package:doc_manager/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:doc_manager/utils/exceptions/format_exceptions.dart';
import 'package:doc_manager/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  ///Function to save user data to Firestore
  Future<void> createUser(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  ///Function to fetch details based on your user ID.
  Future<UserModel> fetchAdminDetails() async {
    try {
      final docSnapshot = await _db
          .collection('Users')
          .doc(AuthenticationRepository.instance.authUser!.uid)
          .get();
        return UserModel.fromSnapshot(docSnapshot);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
