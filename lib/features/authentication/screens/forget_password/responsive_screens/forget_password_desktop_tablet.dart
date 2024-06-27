import 'package:doc_manager/common/widgets/layouts/templates/login_template.dart';
import 'package:doc_manager/features/authentication/screens/forget_password/widgets/header_form.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreenDesktopTablet extends StatelessWidget {
  const ForgetPasswordScreenDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return TLoginTemplate(
      child: HeaderAndForm(),
    );
  }
}

