import 'package:doc_manager/routes/routes.dart';
import 'package:flutter/material.dart';

class TRoutesMiddleware {

  //use when user is not logged in
  @override
  RouteSettings? redirect(String? route) {
    final isAuthenticated = true;
    return isAuthenticated ? null : const RouteSettings(name: TRoutes.login);
  }
}
