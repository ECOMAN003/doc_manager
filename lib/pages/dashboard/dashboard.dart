import 'package:doc_manager/common/widgets/layouts/templates/site_layout.dart';
import 'package:doc_manager/pages/dashboard/dashboard_desktop.dart';
import 'package:doc_manager/pages/dashboard/dashboard_mobile.dart';
import 'package:doc_manager/pages/dashboard/dashboard_tablet.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(
      desktop: DashboardDesktopScreen(),
      tablet: DashboardTabletScreen(),
      mobile: DashboardMobileScreen(),
    );
  }
}
