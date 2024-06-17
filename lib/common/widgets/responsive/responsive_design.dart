import 'package:doc_manager/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

//widget for displaying different layouts based on the screen size
class TResponsiveDesign extends StatelessWidget {
  const TResponsiveDesign(
      {super.key,
      required this.mobile,
      required this.tablet,
      required this.desktop});

  /// The widget to be displayed on mobile devices
  final Widget mobile;

  /// The widget to be displayed on tablet devices
  final Widget tablet;

  /// The widget to be displayed on desktop devices
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      if (constraints.maxWidth >= TSizes.desktopScreenSize) {
        return desktop;
      } else if (constraints.maxWidth < TSizes.desktopScreenSize &&
          constraints.maxWidth >= TSizes.tabletScreenSize) {
        return tablet;
      } else {
        return mobile;
      }
    });
  }
}
