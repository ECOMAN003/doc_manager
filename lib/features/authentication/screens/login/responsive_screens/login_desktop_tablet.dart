
import 'package:doc_manager/common/widgets/layouts/templates/login_template.dart';
import 'package:doc_manager/features/authentication/screens/login/widgets/login_form.dart';
import 'package:doc_manager/features/authentication/screens/login/widgets/login_header.dart';
import 'package:flutter/material.dart';

class LoginScreenDesktopTablet extends StatelessWidget {
  const LoginScreenDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const TLoginTemplate(
      child: Column(
        children: [
          //Header
          TLoginHeader(),
          //Form
          TLoginForm()
        ],
      )
      );
  }
}


