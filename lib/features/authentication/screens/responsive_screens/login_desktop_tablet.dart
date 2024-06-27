import 'package:doc_manager/common/styles/spacing_styles.dart';
import 'package:doc_manager/utils/constants/colors.dart';
import 'package:doc_manager/utils/constants/image_strings.dart';
import 'package:doc_manager/utils/constants/sizes.dart';
import 'package:doc_manager/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class LoginScreenDesktopTablet extends StatelessWidget {
  const LoginScreenDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 550,
        child: SingleChildScrollView(
          child: Container(
            padding: TSpacingStyle.paddingWithAppBarHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
              color: TColors.white,
            ),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                       const Image(width: 100, height:100, image: AssetImage(TImages.darkAppLogo)),
                       const SizedBox(height: TSizes.spaceBtwSections),
                       Text(TTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium),
                       const SizedBox(height: TSizes.sm),
                       Text(TTexts.loginSubTitle, style: Theme.of(context).textTheme.headlineMedium),
                    ],
                    ),

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}