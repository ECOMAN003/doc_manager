import 'package:doc_manager/common/widgets/layouts/templates/site_layout.dart';
import 'package:doc_manager/common/widgets/responsive/desktop_layout.dart';
import 'package:doc_manager/common/widgets/responsive/mobile_layout.dart';
import 'package:doc_manager/common/widgets/responsive/tablet_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doc_manager/routes/app_routes.dart';
import 'package:doc_manager/routes/routes.dart';

import 'utils/constants/colors.dart';
import 'utils/constants/text_strings.dart';
import 'utils/device/web_material_scroll.dart';
import 'utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.light,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      home: const Scaffold(
        backgroundColor: TColors.primary,
        body: Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      ),
      getPages: TAppRoutes.pages,
      initialRoute: TRoutes.dashboard,
      unknownRoute: GetPage(
          name: '/page-not-found',
          page: () => const Scaffold(
                body: Center(child: Text('Page Not Found')),
              )),
    );
  }
}

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(
      desktop: DesktopLayout(),
      tablet: TabletLayout(),
      mobile: MobileLayout(),
      
    );
  }
}
