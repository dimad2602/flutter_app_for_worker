import 'package:flutter/material.dart';
import '../../components/app_icon.dart';
import '../../components/big_text.dart';
import '../../locator_get.dart';
import '../../utils/constants.dart';

class ProfileWidget extends StatelessWidget {
  final AppIcon appIcon;
  final BigText bigText;
  final Color backgroundColor;
  final double size;

  const ProfileWidget({
    super.key,
    required this.appIcon,
    required this.bigText,
    this.backgroundColor = Colors.white,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    var sizeConstants = locator.get<Constants>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizeConstants.getWidth10() / 2),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: EdgeInsets.only(
          left: sizeConstants.getWidth20() / 2,
          top: sizeConstants.getHeight10() / 2,
          bottom: sizeConstants.getHeight10() / 2,
        ),
        child: Row(
          children: [
            appIcon,
            SizedBox(
              width: sizeConstants.getWidth20() / 2,
            ),
            bigText,
          ],
        ),
      ),
    );
  }
}
