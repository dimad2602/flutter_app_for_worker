import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/components/big_text.dart';

import '../../components/app_icon.dart';
import '../../locator_get.dart';
import '../../utils/app_colors.dart';
import '../../utils/constants.dart';

class ActiveOrdersPage extends StatelessWidget {
  const ActiveOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeConstants = locator.get<Constants>();
    return Scaffold(backgroundColor: AppColors.mainColor, 
    body: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
              height: sizeConstants.getHeight45(),
              width: double.maxFinite,
              padding: EdgeInsets.only(top: sizeConstants.getHeight10()),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: sizeConstants.getWidth10()),
                    child: AppIcon(
                      icon: Icons.arrow_back_ios_new,
                      iconColor: Colors.black,
                      backgroundColor: AppColors.mainColorAppbar,
                      iconSize24: true,
                      onTap: () {
                        // Get.toNamed(CartPageSql.routeName,
                        //     arguments: ModalRoute.of(context)!.settings.name);
                      },
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Center(
                          child: BigText(
                            text: 'Оформление заказа',
                            appbar: true,
                            bold: true,
                          )),
                    ),
                  ),
                  SizedBox(width: sizeConstants.getWidth20()),
                ],
              ),
            ),
    ],));
  }
}