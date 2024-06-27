import 'package:doc_manager/common/widgets/layouts/templates/site_layout.dart';
import 'package:doc_manager/features/authentication/screens/login/responsive_screens/login_desktop_tablet.dart';
import 'package:doc_manager/features/authentication/screens/login/responsive_screens/login_mobile.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(
      useLayout: false, 
      desktop: LoginScreenDesktopTablet(),
      mobile: LoginScreenMobile()
    );
  }
}
