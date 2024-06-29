
import 'package:doc_manager/data/repositories/repositories.authentication/authentication_repository.dart';
import 'package:doc_manager/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TRoutesMiddleware extends GetMiddleware {

  @override
  RouteSettings? redirect(String? route) {
    return AuthenticationRepository.instance.isAuthenticated ? null : const RouteSettings(name: TRoutes.login) ;
  }
}
