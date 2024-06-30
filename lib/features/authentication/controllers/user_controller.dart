import 'package:doc_manager/data/repositories/user/user_model.dart';
import 'package:doc_manager/data/repositories/user/user_repository.dart';
import 'package:doc_manager/utils/popups/loaders.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  //Fetches user details from the repository
  Future<UserModel> fetchUserDetails() async {
    try {
      final user = userRepository.fetchAdminDetails();
      return user;
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Something went wrong.', message: e.toString());
          return UserModel.empty();
    }
  }
}
