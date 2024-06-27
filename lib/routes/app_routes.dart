import 'package:doc_manager/features/authentication/screens/forget_password/forget_password.dart';
import 'package:doc_manager/features/authentication/screens/login/login.dart';
import 'package:doc_manager/features/authentication/screens/reset_password/reset_password.dart';
import 'package:doc_manager/pages/archive_screen.dart';
import 'package:doc_manager/pages/sign_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:doc_manager/routes/routes.dart';
import 'package:doc_manager/app.dart';

class TAppRoutes {
  static final List<GetPage> pages = [
    GetPage(name: TRoutes.dashboard, page: () => const DashBoardScreen()),
    GetPage(name: TRoutes.archiveFile, page: () => const ArchiveScreen()),
    GetPage(name: TRoutes.signFile, page: () => const SignScreen()),
    GetPage(name: TRoutes.login, page: () => const LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(name: TRoutes.resetPassword, page: () => const ResetPasswordScreen()),
  ];
}
