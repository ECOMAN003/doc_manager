import 'package:doc_manager/common/widgets/images/t_circular_image.dart';
import 'package:doc_manager/common/widgets/layouts/sidebars/menu/menu_item.dart';
import 'package:doc_manager/routes/routes.dart';
import 'package:doc_manager/utils/constants/colors.dart';
import 'package:doc_manager/utils/constants/image_strings.dart';
import 'package:doc_manager/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
class TSidebar extends StatelessWidget {
  const TSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const BeveledRectangleBorder(),
      child: Container(
        decoration: const BoxDecoration(
          color: TColors.white,
          border: Border(
            right: BorderSide(color: TColors.grey, width: 1),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //image
              const TCircularImage(width:100, height: 100, image: TImages.darkAppLogo, backgroundColor: Colors.transparent,),
              const SizedBox(height: TSizes.spaceBtwSections,),
              Padding(
                padding: const EdgeInsets.all(TSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('MENU', style: Theme.of(context).textTheme.bodySmall!.apply(letterSpacingDelta: 1.2),),

                    //Menu Items
                    const TMenuItem(route: TRoutes.dashboard, icon: Iconsax.status, itemName: 'DashBoard',),
                    const TMenuItem(route: TRoutes.archiveFile, icon: Iconsax.archive, itemName: 'Archive',),
                    const TMenuItem(route: TRoutes.signFile, icon: Iconsax.pen_add, itemName: 'DashBoard',),
                    
                  ],
                ),
              )
              //sections
            ],

        ),
      ),
      ),
    );
  }
}

