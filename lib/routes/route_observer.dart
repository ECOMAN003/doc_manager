import 'package:doc_manager/common/widgets/layouts/sidebars/sidebar_controller.dart';
import 'package:doc_manager/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteObservers extends GetObserver {
  @override
  void didPop(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    final sidebarController = Get.put(SidebarController());

    if (previousRoute != null) {
      for (var routeName in TRoutes.sidebarMenuItems) {
        if (previousRoute.settings.name == routeName) {
          sidebarController.activeItem.value = routeName;
        }
      }
    }
  }
}
