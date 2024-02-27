import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_for_worker/components/app_icon.dart';
import 'package:flutter_app_for_worker/components/big_text.dart';
import 'package:flutter_app_for_worker/components/custom_app_bar.dart';
import 'package:flutter_app_for_worker/models/item/item.dart';
import 'package:flutter_app_for_worker/models/order/order.dart';
import 'package:flutter_app_for_worker/utils/app_colors.dart';
import 'package:flutter_app_for_worker/widgets/orders_widgets/complite_item_in_order_widget.dart';
import 'package:flutter_app_for_worker/widgets/orders_widgets/item_in_order_widet.dart';
import 'package:intl/intl.dart';

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

class ActiveOrderDetailPage extends StatefulWidget {
  final Order order;

  const ActiveOrderDetailPage({super.key, required this.order});

  @override
  State<ActiveOrderDetailPage> createState() => _ActiveOrderDetailPageState();
}

class _ActiveOrderDetailPageState extends State<ActiveOrderDetailPage> {
  var isNoteClose = false;

  String formatDuration(Duration duration) {
  String hours = (duration.inHours % 24).toString().padLeft(2, '0');
  String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
  return '$hours:$minutes';
}

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime createdAt = DateTime.parse(widget.order.createdAt);
    Duration difference = now.difference(createdAt);

    //final _screenWidth = MediaQuery.of(context).size.width;
    final systemBarColors = SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.grey[300], //overlayColor,
      statusBarColor: Colors.transparent, //overlayColor,
    );
    SystemChrome.setSystemUIOverlayStyle(systemBarColors);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: CustomAppBar(label: "Стол №${widget.order.id.toString()}"),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const BigText(
                          text: "Гость №1",
                          bold: true,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        BigText(
                          text: DateFormat.Hm()
                              .format(DateTime.parse(widget.order.createdAt)),
                        ),
                      ],
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
                    BigText(
                      text: widget.order.status,
                      color: Colors.black54,
                    )
                  ],
                ),
              ),
              const Divider(
                color: Colors.black54,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: items1.length,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return items1[index].id.isEven
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 12.0, right: 12, top: 2, bottom: 2),
                          child: ItemInOrderWidget(
                            order: widget
                                .order, //Order(id: 0, status: '', createdAt: ''),
                            waiter: true,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8, top: 4, bottom: 4),
                          child: CompliteItemInOrderWidget(
                            order: widget
                                .order, // Order(id: 1, status: '', createdAt: ''),
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
              child: isNoteClose == false
                  ? Row(
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
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isNoteClose = !isNoteClose;
                            });
                          },
                          child: Icon(
                            color: Colors.grey[400],
                            Icons.close,
                            size: 24,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Center(
                    child: Container(
                      // Расширяет контейнер на всю доступную ширину
                      color: Colors.red[200],
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: BigText(
                          text: "Удалить заказ",
                          maxLines: 2,
                          size: 16,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      color: Colors.red[200],
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: BigText(
                          text: "На другой столик",
                          maxLines: 2,
                          size: 16,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      color: Colors.red[200],
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: BigText(
                          text: "Разделить заказ",
                          maxLines: 2,
                          size: 16,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: const AppIcon(
                      icon: Icons.plus_one,
                    ),
                  ),
                ),
              ],
            ),
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
