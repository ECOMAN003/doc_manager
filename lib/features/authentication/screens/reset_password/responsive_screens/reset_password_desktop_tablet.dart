import 'package:doc_manager/common/widgets/layouts/templates/login_template.dart';
import 'package:doc_manager/routes/routes.dart';
import 'package:doc_manager/utils/constants/image_strings.dart';
import 'package:doc_manager/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreenDesktopTablet extends StatelessWidget {
  const ResetPasswordScreenDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    final email = Get.parameters['email'] ?? '';
    return TLoginTemplate(
      child: Column(
        children: [
          ///Header
          IconButton(onPressed: () => Get.offAllNamed(TRoutes.login), icon: const Icon(CupertinoIcons.clear)),
          const SizedBox(height: TSizes.spaceBtwItems),

          ///Image
          const Image(image: AssetImage(TImages.deliveredEmailIllustration), width: 300, height: 300,),
          const SizedBox(height: TSizes.spaceBtwItems),

          ///Title & Subtitle
          
        ],
      ),
    );
  }
}
