import 'package:doc_manager/common/widgets/containers/rounded_container.dart';
import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, this.body});

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(child: Drawer()),
          Expanded(
            child: Column(
              children: [
                //HEADER
                TRoundedContainer(
                  width: double.infinity,
                  height: 75,
                  backgroundColor: Colors.yellow.withOpacity(0.2),
                ),

                //BODY
                body ?? const SizedBox(),
              ],
            ))
        ],
      ),
    );
  }
}
