import 'package:doc_manager/common/widgets/layouts/headers/header.dart';
import 'package:doc_manager/common/widgets/layouts/sidebars/sidebar.dart';
import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  MobileLayout({super.key, this.body});

  final Widget? body;

    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const TSidebar(),
      appBar: THeader(scaffoldKey: scaffoldKey),
      body: body ?? const SizedBox(),
      );
  }
}
