import 'package:doc_manager/common/styles/spacing_styles.dart';
import 'package:doc_manager/utils/constants/colors.dart';
import 'package:doc_manager/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TLoginTemplate extends StatelessWidget {
  const TLoginTemplate({super.key, required this.child});

  //.Widget to be displayed in ogin template
  final Widget child;

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
            child: child,
          ),
        ),
      ),
    );
  }
}
