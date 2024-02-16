import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/components/big_text.dart';
import 'package:flutter_app_for_worker/components/medium_text.dart';
import 'package:flutter_app_for_worker/models/order/order.dart';
import 'package:flutter_app_for_worker/utils/app_colors.dart';

class OrdersInKitchen extends StatelessWidget {
  final Order order;
  const OrdersInKitchen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    //double _screenHeight = MediaQuery.of(context).size.height;
    return Container(
      //constraints: BoxConstraints(maxHeight: _screenHeight * 0.8),
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(12)),
      child: Stack(children: [
        Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(children: [
                        BigText(
                          text: order.id.toString(),
                          bold: true,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const BigText(text: "Time"),
                      ]),
                    ],
                  ),
                  BigText(text: "Order Status"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [BigText(text: "Стол № --"), BigText(text: "Таймер")],
              ),
              BigText(text: "Note ?"),
              Column(
                children: [
                  Text("fdgdg"),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: new BoxConstraints(
                    minHeight: 35.0,
                    maxHeight: 110.0,
                    maxWidth: 400,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return DataTable(
                        decoration: BoxDecoration(color: Colors.white70),
                        columns: [
                          DataColumn(label: BigText(text: 'Состав', bold: true,)),
                        ],
                        rows: [
                          DataRow(
                            cells: [
                              DataCell(Text('Cell 1')),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('Cell 3')),
                            ],
                          ),
                        ],
                      );
                      // Container(
                      //   decoration: const BoxDecoration(color: Colors.white),
                      //   child: const Row(children: [
                      //     Icon(
                      //       Icons.fireplace,
                      //       color: Colors.black,
                      //     ),
                      //     BigText(
                      //       text: "Название блюда",
                      //       color: Colors.black,
                      //     ),
                      //     Icon(
                      //       Icons.pause,
                      //       color: Colors.black,
                      //     ),
                      //     Icon(
                      //       Icons.done,
                      //       color: Colors.black,
                      //     )
                      //   ]),
                      // );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
            ]),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                  color: AppColors.lightGreenColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12))),
              child: const Padding(
                padding: EdgeInsets.only(left: 4, right: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.notifications_none,
                              color: AppColors.liteMainColor,
                            ),
                            MediumText(
                              text: "СТОЛ",
                              color: AppColors.liteMainColor,
                            )
                          ],
                        ),
                      ],
                    ),
                    BigText(
                      text: '0:52',
                      color: AppColors.liteMainColor,
                    ),
                  ],
                ),
              ),
            ))
      ]),
    );
  }
}
