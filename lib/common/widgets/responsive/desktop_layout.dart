import 'package:doc_manager/common/widgets/layouts/headers/header.dart';
import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  DesktopLayout({super.key, this.body});

  final Widget? body;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(
            flex: 1,
            child: Drawer()
            ),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                //HEADER
                const THeader(),
                //BODY
                body ?? const SizedBox(),
              ],
            ))
        ],
      ),
    );
  }
}
