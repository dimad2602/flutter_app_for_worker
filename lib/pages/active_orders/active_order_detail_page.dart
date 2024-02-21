import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_for_worker/components/big_text.dart';
import 'package:flutter_app_for_worker/components/custom_app_bar.dart';
import 'package:flutter_app_for_worker/models/item/item.dart';
import 'package:flutter_app_for_worker/models/order/order.dart';
import 'package:flutter_app_for_worker/utils/app_colors.dart';
import 'package:flutter_app_for_worker/widgets/orders_widgets/complite_item_in_order_widget.dart';
import 'package:flutter_app_for_worker/widgets/orders_widgets/item_in_order_widet.dart';

final List<Item> items1 = [
  const Item(id: 0, title: 'Блюдо 0', price: 1123),
  const Item(id: 1, title: 'Блюдо 1', price: 23),
  const Item(id: 5, title: 'Блюдо 5', price: 123),
  const Item(id: 2, title: 'Блюдо 2', price: 240),
  const Item(id: 3, title: 'Блюдо 2', price: 240),
  const Item(id: 4, title: 'Блюдо 2', price: 240),
  const Item(id: 6, title: 'Блюдо 2', price: 240),
  const Item(id: 7, title: 'Блюдо 2', price: 240),
  const Item(id: 8, title: 'Блюдо 2', price: 240),
  const Item(id: 9, title: 'Блюдо 2', price: 240),
  const Item(id: 10, title: 'Блюдо 2', price: 240),
];

class ActiveOrderDetailPage extends StatelessWidget {
  final Order order;
  const ActiveOrderDetailPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final systemBarColors = SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.grey[300], //overlayColor,
      statusBarColor: Colors.transparent, //overlayColor,
    );
    SystemChrome.setSystemUIOverlayStyle(systemBarColors);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: CustomAppBar(label: "Стол №${order.id.toString()}"),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: items1.length,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return items1[index].id.isEven
                      ? const Padding(
                          padding: EdgeInsets.only(
                              left: 8.0, right: 8, top: 12, bottom: 8),
                          child: ItemInOrderWidget(
                            order: Order(id: 0, status: ''),
                            waiter: true,
                          ),
                        )
                      : const Padding(
                          padding: EdgeInsets.only(
                              left: 8.0, right: 8, top: 12, bottom: 8),
                          child: CompliteItemInOrderWidget(
                            order: Order(id: 1, status: ''),
                            waiter: true,
                          ),
                        ); //Text("${items.length}");
                },
              ),
            ]),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8, right: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Row(
                      children: [
                        Icon(
                          color: AppColors.alertCheckColor,
                          Icons.message,
                          size: 24,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: BigText(
                            text:
                                "dffffffffffffffffffffffffffffffffffgdffffffg12312414567575675757",
                            color: Colors.black,
                            italics: true,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    color: Colors.grey[300],
                    Icons.close,
                    size: 24,
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      color: Colors.grey[300],
                      Icons.close,
                      size: 24,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.red[200],
                        child: const BigText(
                          text: "Удалить заказ",
                          maxLines: 2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.red[200],
                        child: const BigText(
                          text: "Удалить заказ",
                          maxLines: 2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.red[200],
                        child: const BigText(
                          text: "Удалить заказ",
                          maxLines: 2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.red[200],
                        child: const BigText(
                          text: "Удалить заказ",
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //   child:
            //   Row(
            //     //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Expanded(
            //         child: Container(
            //           color: Colors.red[200],
            //           child: const BigText(
            //             text: "Удалить заказ",
            //             maxLines: 2,
            //           ),
            //         ),
            //       ),
            //       const SizedBox(
            //         width: 4,
            //       ),
            //       Expanded(
            //         child: Container(
            //           alignment: Alignment.center,
            //           color: Colors.red[200],
            //           child: const Center(
            //             child: BigText(
            //               text: "Удалить заказ",
            //               maxLines: 2,
            //             ),
            //           ),
            //         ),
            //       ),
            //       const SizedBox(
            //         width: 4,
            //       ),
            //       Expanded(
            //         child: Container(
            //           alignment: Alignment.center,
            //           color: Colors.red[200],
            //           child: const BigText(
            //             text: "Удалить заказ",
            //             maxLines: 2,
            //           ),
            //         ),
            //       ),
            //       const SizedBox(
            //         width: 4,
            //       ),
            //       Expanded(
            //         child: Container(
            //           color: Colors.red[200],
            //           child: const Center(
            //             child: BigText(
            //               text: "Удалить заказ",
            //               maxLines: 2,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(
              height: 4,
            ),
            Container(
              height: 60,
              color: AppColors.redColor,
              child: const Center(
                child: BigText(text: "ЗАКРЫТЬ ЗАКАЗ", color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
