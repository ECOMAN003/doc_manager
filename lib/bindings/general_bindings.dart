import 'package:doc_manager/features/authentication/controllers/user_controller.dart';
import 'package:doc_manager/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NetworkManager(), fenix: true);
    Get.lazyPut(() => UserController(), fenix: true);
  }
}