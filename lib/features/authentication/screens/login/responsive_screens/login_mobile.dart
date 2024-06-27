import 'package:doc_manager/features/authentication/screens/login/widgets/login_form.dart';
import 'package:doc_manager/features/authentication/screens/login/widgets/login_header.dart';
import 'package:doc_manager/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class LoginScreenMobile extends StatelessWidget {
  const LoginScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
        children: [
          //Header
          TLoginHeader(),
          //Form
          TLoginForm()
        ],
      ),
      ),
    );
  }
}
