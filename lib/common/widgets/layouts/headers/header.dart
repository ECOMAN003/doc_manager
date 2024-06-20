import 'package:doc_manager/common/widgets/images/t_rounded_image.dart';
import 'package:doc_manager/utils/constants/colors.dart';
import 'package:doc_manager/utils/constants/enums.dart';
import 'package:doc_manager/utils/constants/image_strings.dart';
import 'package:doc_manager/utils/constants/sizes.dart';
import 'package:doc_manager/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

///Header for entire application (responsive for different screen sizes)
class THeader extends StatelessWidget implements PreferredSizeWidget {
  const THeader({super.key, this.scaffoldKey});

  //GlobalKey to aceess Scaffold State
  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: TColors.white,
        border: Border(
          bottom: BorderSide(color: TColors.grey, width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.md, vertical: TSizes.sm),
      child: AppBar(
        ///Mobile Menu
        leading: !TDeviceUtils.isDesktopScreen(context)
            ? IconButton(onPressed: () => scaffoldKey?.currentState?.openDrawer(), icon: const Icon(Iconsax.menu))
            : null,

            ///Searh Field
        title: TDeviceUtils.isDesktopScreen(context)
            ? SizedBox(
                width: 400,
                child: TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.search_normal),
                      hintText: 'Search Documents...'),
                ),
              )
            : null,

        ///actions
        actions: [
          //search icon on mobile
          if (!TDeviceUtils.isDesktopScreen(context))
            IconButton(
                icon: const Icon(Iconsax.search_normal), onPressed: () {}),

          //Notification icon
          IconButton(icon: const Icon(Iconsax.notification), onPressed: () {}),
          const SizedBox(width: TSizes.spaceBtwItems / 2),

          //User Data
           Row(
            children: [
              //image
              const TRoundedImage(
                  width: 40,
                  padding: 2,
                  height: 40,
                  imageType: ImageType.asset,
                  image: TImages.user
              ),
              const SizedBox(width: TSizes.sm,),

              //Name and Email
              if(!TDeviceUtils.isMobileScreen(context))
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('John Doe', style: Theme.of(context).textTheme.titleLarge),
                  Text('nXW9w@example.com', style: Theme.of(context).textTheme.labelMedium),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(TDeviceUtils.getAppBarHeight() + 15);
}
