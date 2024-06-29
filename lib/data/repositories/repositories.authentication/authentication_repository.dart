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


  //Get IsAdmin

  //Login

  //Register

  //Register User By Admin

  //Email Verification

  //Forget Password

  //ReAuthenticate User

  //Logout User

  //Delete User
}
