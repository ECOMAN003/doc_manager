import 'package:doc_manager/data/repositories/authentication/authentication_repository.dart';
import 'package:doc_manager/data/repositories/user/user_model.dart';
import 'package:doc_manager/data/repositories/user/user_repository.dart';
import 'package:doc_manager/features/authentication/controllers/user_controller.dart';
import 'package:doc_manager/utils/constants/enums.dart';
import 'package:doc_manager/utils/constants/image_strings.dart';
import 'package:doc_manager/utils/constants/text_strings.dart';
import 'package:doc_manager/utils/helpers/network_manager.dart';
import 'package:doc_manager/utils/popups/full_screen_loader.dart';
import 'package:doc_manager/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

///Controller for handling login functionality
class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final localStorage = GetStorage();

  final email = TextEditingController();
  final password = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  //load login info on next login
  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  ///Handles email and password sign-in process
  Future<void> emailAndPasswordSignIn() async {
    try {
      //sart loading
      TFullScreenLoader.openLoadingDialog(
          'Logging you In...', TImages.docerAnimation);

      //Check internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Save Data If Remember me is SELECTED
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      //Login User using the Email and Password Authentication
      await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //Fetch user details and assign to UserController
      final user = await UserController.instance.fetchUserDetails();

      //Remove Loader
      TFullScreenLoader.stopLoading();

      //If user is not admin, logout and return
      if (user.role != AppRole.admin) {
        await AuthenticationRepository.instance.logout();
        TLoaders.errorSnackBar(title: 'Not Authorized!', message: 'You are not authorized or do not have access');
      }else{
        //Redirect
      AuthenticationRepository.instance.screenRedirect();
      }
      
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  ///Handles registration of admin user
  Future<void> registerAdmin() async {
    try {
      //sart loading
      TFullScreenLoader.openLoadingDialog(
          'Registering Admin Account...', TImages.docerAnimation);

      //Check internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Register User using the Email and Password Authentication
      await AuthenticationRepository.instance.registerWithEmailAndPassword(
          TTexts.adminEmail, TTexts.adminPassword);

      //Create admin record in Firestore
      final userRepository = Get.put(UserRepository());
      await userRepository.createUser(UserModel(
        id: AuthenticationRepository.instance.authUser!.uid,
        firstName: 'Heman',
        lastName: 'Ekom Ekili',
        email: TTexts.adminEmail,
        role: AppRole.admin,
        createdAt: DateTime.now(),
      ));

      //Remove Loader
      TFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
