import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../locator_get.dart';
import '../utils/app_colors.dart';
import '../utils/constants.dart';
import 'app_icon.dart';
import 'big_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TabBar? tabBar;
  final String label;
  //final bool addRightIcons;
  final AppIcon? rightAppIconFirst;
  //final VoidCallback? onTap;
  final bool changeOrientation;
  const CustomAppBar(
      {super.key,
      this.tabBar,
      required this.label,
      this.changeOrientation = false,
      //this.addRightIcons = false,
      this.rightAppIconFirst});

  @override
  Size get preferredSize {
    var sizeConstants = locator.get<Constants>();
    return Size.fromHeight(sizeConstants.getHeight20() * 1.2);
  }

  @override
  Widget build(BuildContext context) {
    var sizeConstants = locator.get<Constants>();
    return SafeArea(
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        //elevation: 0,
        bottom: tabBar,
        flexibleSpace: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: sizeConstants.getWidth10()),
                  child: AppIcon(
                    icon: Icons.arrow_back_ios_new,
                    iconColor: Colors.black,
                    backgroundColor: AppColors.mainColorAppbar,
                    iconSize24: true,
                    onTap: () {
                      changeOrientation
                          ? {
                              SystemChrome.setPreferredOrientations([
                                DeviceOrientation.portraitDown,
                                DeviceOrientation.portraitUp,
                              ]),
                              Navigator.pop(context)
                            }
                          : Navigator.pop(context);
                    },
                  ),
                ),
                Expanded(
                  child: Center(
                    child: BigText(
                      text: label,
                      appbar: true,
                      bold: true,
                    ),
                  ),
                ),
                SizedBox(width: sizeConstants.getWidth20()),
                Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(right: sizeConstants.getWidth10()),
                      child: rightAppIconFirst
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
