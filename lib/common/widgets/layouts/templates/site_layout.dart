import 'package:doc_manager/common/widgets/responsive/desktop_layout.dart';
import 'package:doc_manager/common/widgets/responsive/mobile_layout.dart';
import 'package:doc_manager/common/widgets/responsive/responsive_design.dart';
import 'package:doc_manager/common/widgets/responsive/tablet_layout.dart';
import 'package:flutter/material.dart';

//Tempalate for entire site layout, responsive for different screen sizes
class TSiteTemplate extends StatelessWidget {
  const TSiteTemplate({super.key, this.desktop, this.tablet, this.mobile, this.useLayout = true});

  //Widget for Desktop layout
  final Widget? desktop;

  //Widget for Tablet layout
  final Widget? tablet;

  //Widget for Mobile layout
  final Widget? mobile;

  //flag to determine whether to use the layout
  final bool useLayout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TResponsiveDesign(
        desktop: useLayout ? DesktopLayout(body: desktop) : desktop ?? Container(), 
        tablet: useLayout ? TabletLayout(body: tablet ?? desktop) : tablet ?? desktop ?? Container(),
        mobile: useLayout ? MobileLayout(body: mobile ?? desktop) : mobile ?? desktop ?? Container(),
      ),
    );
  }
}
