import 'package:doc_manager/routes/routes.dart';
import 'package:doc_manager/utils/device/device_utility.dart';
import 'package:get/get.dart';

class SidebarController extends GetxController {
  final activeItem = TRoutes.dashboard.obs;
  final hoverItem = ''.obs;

  void changeActiveItemTo(String route) => activeItem.value = route;
  void initialize() => activeItem.value = TRoutes.dashboard;

  void changeHoverItem(String route) {
    if (!isActive(route)) hoverItem.value = route;
    print('chnge hover');
  }

  bool isActive(String route) => activeItem.value == route;
  bool isHovering(String route) {
    print('is hovering');
    return hoverItem.value == route;
  }

  void menuItemOnTap(String route) {
    if (!isActive(route)) {
      changeActiveItemTo(route);
      if (TDeviceUtils.isMobileScreen(Get.context!)) Get.back();
      if (TDeviceUtils.isTabletScreen(Get.context!)) Get.back();
      Get.toNamed(route);
    }
  }
}
