import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/components/custom_app_bar.dart';

import '../../components/app_icon.dart';
import '../../components/big_text.dart';
import '../../locator_get.dart';
import '../../utils/app_colors.dart';
import '../../utils/constants.dart';
import '../../widgets/profile_widgets/profile_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeConstants = locator.get<Constants>();
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: const CustomAppBar(label: 'Профиль'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(
              thickness: 2,
            ),
            //name
            ProfileWidget(
                appIcon: AppIcon(
                  icon: Icons.drive_file_rename_outline_outlined,
                  backgroundColor: AppColors.alertCheckColor,
                  iconColor: AppColors.redBottonColor,
                  customSize: sizeConstants.getHeight10(),
                  size: sizeConstants.getHeight20(),
                  swadowOff: false,
                ),
                // TODO: ха, ошибка должно быть так. Потом для всех полей сделать подобное
                //BigText(text: userController.userModel.name)
                bigText: const BigText(text: 'Name')),
            SizedBox(
              height: sizeConstants.getHeight10(),
            ),
            // //telephone
            ProfileWidget(
                appIcon: AppIcon(
                  icon: Icons.phone,
                  backgroundColor: AppColors.alertCheckColor,
                  iconColor: Colors.black,
                  customSize: sizeConstants.getHeight10(),
                  size: sizeConstants.getHeight20(),
                  swadowOff: false,
                ),
                bigText: const BigText(text: 'Phone number')),
            SizedBox(
              height: sizeConstants.getHeight10(),
            ),
            // //mail
            ProfileWidget(
                appIcon: AppIcon(
                  icon: Icons.mail_rounded,
                  backgroundColor: AppColors.lightGreenColor,
                  iconColor: AppColors.mainColor,
                  customSize: sizeConstants.getHeight10(),
                  size: sizeConstants.getHeight20(),
                  swadowOff: false,
                ),
                bigText: const BigText(text: 'mail')),
            SizedBox(
              height: sizeConstants.getHeight10(),
            ),
            //address
            GestureDetector(
              onTap: () {
                //Get.toNamed(AddressSearchPage.routeName);
                //Navigator.push(context, AddressSearchPage.route());
              },
              child: ProfileWidget(
                  appIcon: AppIcon(
                    icon: Icons.location_on,
                    backgroundColor: AppColors.lightGreenColor,
                    iconColor: AppColors.redColor,
                    customSize: sizeConstants.getHeight10(),
                    size: sizeConstants.getHeight20(),
                    swadowOff: false,
                  ),
                  bigText: const BigText(text: 'Address1')),
            ),
            SizedBox(
              height: sizeConstants.getHeight10(),
            ),
            GestureDetector(
              onTap: () {
                //Get.toNamed(AddAddressPage.routeName);
              },
              child: ProfileWidget(
                  appIcon: AppIcon(
                    icon: Icons.terrain_sharp,
                    backgroundColor: AppColors.lightGreenColor,
                    iconColor: AppColors.redColor,
                    customSize: sizeConstants.getHeight10(),
                    size: sizeConstants.getHeight20(),
                    swadowOff: false,
                  ),
                  bigText: const BigText(text: 'address')),
            ),
            SizedBox(
              height: sizeConstants.getHeight10(),
            ),
            GestureDetector(
              onTap: () {
                //Get.toNamed(AddressSearchPage.routeName);
                //Navigator.push(context, RestaurantOnMappage.route());
              },
              child: ProfileWidget(
                  appIcon: AppIcon(
                    icon: Icons.location_city,
                    backgroundColor: AppColors.lightGreenColor,
                    iconColor: AppColors.redColor,
                    customSize: sizeConstants.getHeight10(),
                    size: sizeConstants.getHeight20(),
                    swadowOff: false,
                  ),
                  bigText: const BigText(text: 'Address1')),
            ),
            SizedBox(
              height: sizeConstants.getHeight10(),
            ),
            // //Note
            GestureDetector(
              onTap: () {
                //Get.toNamed(PageSheetRestaurant.routeName);
              },
              child: ProfileWidget(
                  appIcon: AppIcon(
                    icon: Icons.speaker_notes_rounded,
                    backgroundColor: AppColors.alertCheckColor,
                    iconColor: AppColors.liteMainColor,
                    customSize: sizeConstants.getHeight10(),
                    size: sizeConstants.getHeight20(),
                    swadowOff: false,
                  ),
                  bigText: const BigText(text: 'Note')),
            ),
          ],
        ),
      ),
    );
  }
}
