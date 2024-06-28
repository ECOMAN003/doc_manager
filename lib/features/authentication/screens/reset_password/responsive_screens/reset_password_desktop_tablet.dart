import 'package:doc_manager/common/widgets/layouts/templates/login_template.dart';
import 'package:doc_manager/features/authentication/screens/reset_password/widgets/reset_password_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreenDesktopTablet extends StatelessWidget {
  const ResetPasswordScreenDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const TLoginTemplate(
      child: ResetPasswordWidget(),
    );
  }
}

