import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:doc_manager/routes/routes.dart';
import 'package:doc_manager/app.dart';

class TAppRoutes {
  static final List<GetPage> pages = [
    GetPage(name: TRoutes.dashboard, page: () => const DashBoardScreen()),
  ];
}
