import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/components/big_text.dart';
import 'package:flutter_app_for_worker/locator_get.dart';
import 'package:flutter_app_for_worker/models/items/items.dart';
import 'package:flutter_app_for_worker/utils/constants.dart';

class DishCardOLDWidget extends StatelessWidget {
  final Items model;
  //final String testName;
  final String imagePath;
  final String itemCosts;

  const DishCardOLDWidget(
      {Key? key,
      //required this.testName,
      required this.imagePath,
      required this.itemCosts,
      required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    var sizeConstants = locator.get<Constants>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: _screenHeight * 0.5,
        width: _screenWidth * 0.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(sizeConstants.getRadius15()),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    //print(model.toJson());
                    // _itemDetailController.navigateToItemDetail(
                    //     paper:
                    //     model.item!);
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: imagePath,
                      height: _screenHeight * 0.19,
                      width: _screenWidth * 0.50,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        alignment: Alignment.center,
                        //можно добавить pre loader image
                        child: const CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                          Image.asset("assets/images/qr-menu.png"),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: sizeConstants.getWidth10(),
                  vertical: sizeConstants.getHeight10()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: model.item.title,
                          //text: testName,
                          bold: true,
                          overflow: TextOverflow.ellipsis)
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          BigText(text: itemCosts),
                          Icon(
                            Icons.currency_ruble,
                            size: sizeConstants.getWidth15(),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
