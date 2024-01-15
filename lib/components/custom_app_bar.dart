import 'package:flutter/material.dart';
import '../locator_get.dart';
import '../utils/app_colors.dart';
import '../utils/constants.dart';
import 'app_icon.dart';
import 'big_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TabBar? tabBar;
  final String label;
  const CustomAppBar({super.key, labe, this.tabBar, required this.label});

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
                      Navigator.pop(context);
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final bool tabBar;

//   const CustomAppBar({Key? key, this.tabBar = false}) : super(key: key);

//   @override
//   Size get preferredSize {
//     var sizeConstants = locator.get<Constants>();
//     return Size.fromHeight(sizeConstants.getHeight20() * 1.2);
//   }

//   @override
//   Widget build(BuildContext context) {
//     var sizeConstants = locator.get<Constants>();
//     return AppBar(
//       automaticallyImplyLeading: false,
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       flexibleSpace: Column(
//         children: [
//           Row(
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(left: sizeConstants.getWidth10()),
//                 child: AppIcon(
//                   icon: Icons.arrow_back_ios_new,
//                   iconColor: Colors.black,
//                   backgroundColor: AppColors.mainColorAppbar,
//                   iconSize24: true,
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//               ),
//               const Expanded(
//                 child: Center(
//                   child: BigText(
//                     text: 'Оформление заказа',
//                     appbar: true,
//                     bold: true,
//                   ),
//                 ),
//               ),
//               SizedBox(width: sizeConstants.getWidth20()),
//             ],
//           ),
//           tabBar
//               ? const TabBar(
//                   tabs: [
//                     Tab(
//                       icon: Icon(Icons.cloud_outlined),
//                     ),
//                     Tab(
//                       icon: Icon(Icons.beach_access_sharp),
//                     ),
//                     Tab(
//                       icon: Icon(Icons.brightness_5_sharp),
//                     ),
//                   ],
//                 )
//               : Container(), // Empty container if tabBar is not needed
//         ],
//       ),
//     );
//   }
// }

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final bool tabBar;
//   const CustomAppBar({Key? key, this.tabBar = false}) : super(key: key);

//   @override
//   Size get preferredSize {
//     var sizeConstants = locator.get<Constants>();
//     return Size.fromHeight(sizeConstants.getHeight20()*1.2);
//   }

//   @override
//   Widget build(BuildContext context) {
//     var sizeConstants = locator.get<Constants>();
//     return PreferredSize(
//       preferredSize: preferredSize,
//       child: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         flexibleSpace: Container(
//           padding: EdgeInsets.only(top: sizeConstants.getHeight10() / 2),
//           child: Row(
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(left: sizeConstants.getWidth10()),
//                 child: AppIcon(
//                   icon: Icons.arrow_back_ios_new,
//                   iconColor: Colors.black,
//                   backgroundColor: AppColors.mainColorAppbar,
//                   iconSize24: true,
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//               ),
//               const Expanded(
//                 child: Center(
//                   child: BigText(
//                     text: 'Оформление заказа',
//                     appbar: true,
//                     bold: true,
//                   ),
//                 ),
//               ),
//               SizedBox(width: sizeConstants.getWidth20()),
//             ],
//           ),
//         ),
//         bottom: tabBar? const TabBar(
//             tabs:[
//               Tab(
//                 icon: Icon(Icons.cloud_outlined),
//               ),
//               Tab(
//                 icon: Icon(Icons.beach_access_sharp),
//               ),
//               Tab(
//                 icon: Icon(Icons.brightness_5_sharp),
//               ),
//             ],
//           ) : null,
//       ),
//     );
//   }
// }
