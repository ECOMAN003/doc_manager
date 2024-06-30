import 'package:doc_manager/routes/routes.dart';
import 'package:doc_manager/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:doc_manager/utils/exceptions/firebase_exceptions.dart';
import 'package:doc_manager/utils/exceptions/format_exceptions.dart';
import 'package:doc_manager/utils/exceptions/platform_exceptions.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Firebase Auth Instance
  final _auth = FirebaseAuth.instance;

  //Get Authentication user Data
  User? get authUser => _auth.currentUser;

  //Get IsAuthenticated User
  bool get isAuthenticated => _auth.currentUser != null;

  @override
  void onReady() {
    _auth.setPersistence(Persistence.LOCAL);
  }

//Function to determine the relevant screen and redirect accordingly
  void screenRedirect() async {
    final user = _auth.currentUser;

    //if the user is logged in
    if (user != null) {
      //Navigate to home screen
      Get.offAllNamed(TRoutes.dashboard);
    } else {
      //Navigate to login screen
      Get.offAllNamed(TRoutes.login);
    }
  }

  //Login
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //Register User By Admin

  //Email Verification

  //Forget Password

  //ReAuthenticate User

  //Logout User
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed(TRoutes.login);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //Delete User
}
