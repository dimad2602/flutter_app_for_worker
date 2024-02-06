import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/domain/blocs/cart/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/big_text.dart';
import '../../locator_get.dart';
import '../../models/item/item.dart';
import '../../utils/app_colors.dart';
import '../../utils/constants.dart';

class ItemsInCartWidget extends StatelessWidget {
  final String itemName;
  //final String imagePath;
  final String itemPrice;
  final String itemWeight;
  final String itemCount;
  final Item item;
  final int index;

  ItemsInCartWidget({
    required this.itemName,
    //required this.imagePath,
    required this.itemWeight,
    required this.itemPrice,
    required this.itemCount,
    required this.item,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var sizeConstants = locator.get<Constants>();
    return Stack(children: [
      Container(
        width: double.maxFinite,
        height: sizeConstants.getHeight45(),
        margin: const EdgeInsets.only(bottom: 15),
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
                  onTap: () {},
                  child: Container(
                    width: sizeConstants.getWidth20() * 4,
                    height: sizeConstants.getHeight45(),
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                                'https://www.karlschnell.de/wp-content/uploads/2019/08/pizza-cheese_03_hd.jpg')),
                        borderRadius:
                            BorderRadius.circular(sizeConstants.getRadius15()),
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: sizeConstants.getWidth10(),
                ),
                Expanded(
                    child: Container(
                  height: sizeConstants.getHeight45(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(
                        text: itemName,
                        color: Colors.black87,
                      ),
                      BigText(
                        text: "$itemWeight г",
                        size: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                top: sizeConstants.getHeight10() / 2,
                                bottom: sizeConstants.getHeight10() / 10,
                                left: sizeConstants.getWidth10() / 5,
                                right: sizeConstants.getWidth10() / 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  sizeConstants.getRadius15()),
                              color: Colors.white,
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: sizeConstants.getHeight10() / 5,
                                horizontal: sizeConstants.getWidth10() / 5,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    Colors.grey.withOpacity(0.2), // Цвет фона
                                borderRadius: BorderRadius.circular(
                                    sizeConstants.getRadius15()),
                              ),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {

                                      context.read<CartBloc>().add(
                                          CartEvent.removeFromCartEvent(
                                             item: item));


                                      //cartController.addItem(item!, -1);
                                      
                                      

                                      // context.read<CartBloc>().add(
                                      //     CartEvent.removeFromCartEvent(
                                      //         item: item));
                                    },
                                    child: Icon(
                                      int.parse(itemCount) == 1
                                          ? Icons.close
                                          : Icons.remove,
                                      color: int.parse(itemCount) == 1
                                          ? AppColors.redColor
                                          : Colors.black45,
                                    ),
                                  ),
                                  SizedBox(
                                    width: sizeConstants.getWidth10() / 2,
                                  ),
                                  BigText(text: itemCount),
                                  SizedBox(
                                    width: sizeConstants.getWidth10() / 2,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      //cartController.addItem(item!, 1);

                                      context.read<CartBloc>().add(
                                          CartEvent.addToCartEvent(
                                             item: item));
                                    },
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.black45,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: sizeConstants.getWidth10(),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.currency_ruble,
                                    size: sizeConstants.getWidth15(),
                                    color: Colors.black),
                                BigText(
                                  text:
                                      "${double.parse(itemPrice) * double.parse(itemCount)}",
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    ]);
  }
}
