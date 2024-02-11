import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/components/big_text.dart';
import 'package:flutter_app_for_worker/components/button_add_item.dart';
import 'package:flutter_app_for_worker/locator_get.dart';
import 'package:flutter_app_for_worker/models/item/item.dart';
import 'package:flutter_app_for_worker/utils/app_colors.dart';
import 'package:flutter_app_for_worker/utils/constants.dart';
import 'package:flutter_svg/svg.dart';

class DishTestWidget extends StatelessWidget {
  final Item model;

  const DishTestWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    var sizeConstants = locator.get<Constants>();

    String formattedPrice;
    if (model.price == model.price.toInt()) {
      formattedPrice = model.price.toInt().toString();
    } else {
      formattedPrice = model.price.toStringAsFixed(2);
    }
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12, top: 8),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Column(children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  model.image != null
                      ? CachedNetworkImage(
                          imageUrl: model.image!,
                          height: _screenHeight * 0.15,
                          width: _screenWidth * 0.44,
                          fit: BoxFit.cover,
                          imageBuilder: (context, imageProvider) => Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          placeholder: (context, url) => Container(
                            alignment: Alignment.center,
                            //можно добавить pre loader image
                            child: SvgPicture.asset(
                              "lib/assets/images/dish_holder_image.svg",
                              height: _screenHeight * 0.19,
                              width: _screenWidth * 0.40,
                            ),

                            //const CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                              SvgPicture.asset(
                            "lib/assets/images/dish_holder_image.svg",
                            height: _screenHeight * 0.19,
                            width: _screenWidth * 0.40,
                          ),
                        )
                      : SvgPicture.asset(
                          "lib/assets/images/dish_holder_image.svg",
                          height: _screenHeight * 0.19,
                          width: _screenWidth * 0.40,
                        ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        BigText(text: formattedPrice, bold: true),
                        Icon(
                          Icons.currency_ruble,
                          size: sizeConstants.getFont10(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: SizedBox(
                      width: sizeConstants.getWidth20() * 7,
                      child: BigText(
                        text: model.title,
                        maxLines: 2,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: BigText(
                      text: model.weight == 0 || model.weight == null
                          ? "${model.volume} мл"
                          : "${model.weight} г",
                      maxLines: 2,
                      color: Colors.black54,
                    ),
                  ),
                ],
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 12, right: 12, top: 4),
            child: ButtonAddItem(
                color: AppColors.lightGreenColor, text: 'Добавить', ),
          )
        ]),
      ),
    );
  }
}
