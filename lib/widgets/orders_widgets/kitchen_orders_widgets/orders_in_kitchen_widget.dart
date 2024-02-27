import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/components/big_text.dart';
import 'package:flutter_app_for_worker/models/item/item.dart';
import 'package:flutter_app_for_worker/models/order/order.dart';
import 'package:flutter_app_for_worker/utils/app_colors.dart';
import 'package:flutter_app_for_worker/widgets/orders_widgets/item_in_order_widet.dart';
import 'package:intl/intl.dart';

class OrdersInKitchen extends StatelessWidget {
  final Order order;
  final List<Item> items; //TODO: Это поле для тестированя потом уберу
  const OrdersInKitchen({super.key, required this.order, required this.items});

  String formatDuration(Duration duration) {
    String hours = (duration.inHours % 24).toString().padLeft(2, '0');
    String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    return '$hours:$minutes';
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;

    DateTime now = DateTime.now();
    DateTime createdAt = DateTime.parse(order.createdAt);
    Duration difference = now.difference(createdAt);

    return Container(
      width: _screenWidth * 0.32,
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(12)),
      child: Stack(children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 8.0, right: 8, top: 4, bottom: 4),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        BigText(
                          text: "№${order.id.toString()}",
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        BigText(
                          text: DateFormat.Hm()
                              .format(DateTime.parse(order.createdAt)),
                        ),
                      ],
                    ),
                    BigText(text: order.status),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BigText(
                      text: "Стол № --",
                      bold: true,
                      appbar: true,
                    ),
                    Row(
                      children: [
                        const Icon(
                          color: AppColors.redColor,
                          Icons.timer_outlined,
                          size: 24,
                        ),
                        BigText(
                          text: formatDuration(difference).toString(),
                          bold: true,
                          color: AppColors.redColor,
                        )
                      ],
                    ),
                  ],
                ),
                const BigText(text: "Note ?"),
                const Column(
                  children: [
                    BigText(text: "Категория"),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 35.0,
                      maxHeight: _screenHeight * 0.55, //55
                      maxWidth: _screenWidth * 0.31,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: items.length,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: ItemInOrderWidget(
                            order: order,
                          ),
                        );

                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       left: 8.0, right: 8, top: 12, bottom: 8),
                        //   child: Container(
                        //     padding: const EdgeInsets.only(
                        //         left: 8, right: 8, top: 8, bottom: 12),
                        //     decoration: BoxDecoration(
                        //         color: Colors.white,
                        //         borderRadius: BorderRadius.circular(4)),
                        //     child: Column(
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       children: [
                        //         Row(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceBetween,
                        //           children: [
                        //             Row(
                        //               crossAxisAlignment:
                        //                   CrossAxisAlignment.start,
                        //               children: [
                        //                 const Icon(
                        //                   color: AppColors.lightGreenColor,
                        //                   Icons.free_breakfast,
                        //                   size: 24,
                        //                 ),
                        //                 const SizedBox(
                        //                   width: 4,
                        //                 ),
                        //                 ConstrainedBox(
                        //                   constraints: BoxConstraints(
                        //                     maxWidth: _screenWidth * 0.16,
                        //                   ),
                        //                   child: BigText(
                        //                     text:
                        //                         "${items.length} + dffffffffffffffffffffffffffffffffffgdffffffg12312414567575675757",
                        //                     bold: true,
                        //                     maxLines: 2,
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //             Row(
                        //               crossAxisAlignment:
                        //                   CrossAxisAlignment.start,
                        //               children: [
                        //                 GestureDetector(
                        //                     child: Container(
                        //                         color: Colors.white,
                        //                         padding:
                        //                             const EdgeInsets.all(4),
                        //                         child: const BigText(
                        //                             bold: true,
                        //                             text: "НАЧАТЬ"))),
                        //                 const SizedBox(
                        //                   width: 4,
                        //                 ),
                        //                 const Icon(
                        //                   color: Colors.black,
                        //                   Icons.done,
                        //                   size: 24,
                        //                 ),
                        //               ],
                        //             ),
                        //           ],
                        //         ),
                        //         Padding(
                        //           padding: const EdgeInsets.only(
                        //               top: 8.0, bottom: 4),
                        //           child: Container(
                        //             color: Colors.grey[300],
                        //             child: const BigText(
                        //               text: "Готовить позже, убрать ананас",
                        //             ),
                        //           ),
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: _screenHeight * 0.1,
                ),
              ]),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(right: 8, bottom: 8, top: 8),
              child: Container(
                decoration: const BoxDecoration(
                    color: AppColors.lightGreenColor,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: const Padding(
                  padding: EdgeInsets.only(left: 4, right: 4),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        BigText(
                          text: "ВЫЗОВ",
                          // bold: true,
                          color: Colors.white,
                        ),
                        BigText(
                          text: "ОФИЦИАНТА",
                          //bold: true,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ))
      ]),
    );
  }
}
