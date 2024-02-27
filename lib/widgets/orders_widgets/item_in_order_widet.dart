import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/components/big_text.dart';
import 'package:flutter_app_for_worker/models/order/order.dart';
import 'package:flutter_app_for_worker/utils/app_colors.dart';

class ItemInOrderWidget extends StatelessWidget {
  final Order order;
  //За место order нужно передать Item
  final bool? waiter;
  const ItemInOrderWidget({
    super.key,
    required this.order,
    this.waiter = false,
  });

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(4)),
      child: Stack(
        children: [
          waiter == true
              ? Positioned(
                  bottom: 0,
                  top: 0,
                  child: Container(width: 4, color: Colors.green))
              : const SizedBox.shrink(),
          Padding(
            padding:
                const EdgeInsets.only(left: 8, top: 4, bottom: 4, right: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // waiter == true ?
                        // Container(
                        //   width: 4,
                        //   height: 10,
                        //   color: AppColors.lightGreenColor,
                        // ):const SizedBox.shrink(),
                        waiter == false
                            ? const Icon(
                                color: AppColors.lightGreenColor,
                                Icons.free_breakfast,
                                size: 24,
                              )
                            : const SizedBox.shrink(),
                        waiter == false
                            ? const SizedBox(
                                width: 4,
                              )
                            : const SizedBox.shrink(),
                        //это будет количесво юлюда
                        BigText(
                          text: "${order.id}",
                          bold: true,
                          maxLines: 2,
                          color: order.id > 1 ? Colors.red : Colors.black,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: waiter == false
                                ? _screenWidth * 0.16
                                : _screenWidth * 0.55,
                          ),
                          child: const BigText(
                            text:
                                "dffffffffffffffffffffffffffffffffffgdffffffg12312414567575675757",
                            bold: true,
                            maxLines: 2,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Будет стоимость позиции
                        waiter == true
                            ? const BigText(
                                text: "1000 Р",
                                color: Colors.black54,
                              )
                            : const SizedBox.shrink(),
                        const SizedBox(
                          width: 4,
                        ),
                        GestureDetector(
                            child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: BigText(
                            bold: true,
                            text: waiter == false ? "Начать" : "ГОТОВ",
                            color: Colors.green,
                          ),
                        )),
                        waiter == false
                            ? const SizedBox(
                                width: 4,
                              )
                            : const SizedBox.shrink(),
                        // waiter == false
                        //     ? const Icon(
                        //         color: Colors.black,
                        //         Icons.done,
                        //         size: 24,
                        //       )
                        //     : const SizedBox.shrink(),
                      ],
                    ),
                  ],
                ),
                //будет note у item
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 4),
                  child: Container(
                    color: Colors.grey[300],
                    child: const FittedBox(
                      fit: BoxFit.scaleDown,
                      child: BigText(
                        text: "Готовить позже, убрать ананас", italics: true,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
