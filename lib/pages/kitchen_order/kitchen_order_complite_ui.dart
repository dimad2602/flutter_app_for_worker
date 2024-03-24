import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_for_worker/components/big_text.dart';
import 'package:flutter_app_for_worker/components/custom_app_bar.dart';
import 'package:flutter_app_for_worker/models/order/order.dart';
import 'package:flutter_app_for_worker/utils/app_colors.dart';
import 'package:flutter_app_for_worker/widgets/orders_widgets/kitchen_orders_widgets/orders_in_kitchen_widget.dart';

Widget kitchenOrderCompliteUI(BuildContext context, List<Order> orders) {
  double _screenWidth = MediaQuery.of(context).size.width;
  return PopScope(
        onPopInvoked: (didPop) async {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
        },
        child: Scaffold(
          backgroundColor: AppColors.mainColor,
          appBar: const CustomAppBar(
            changeOrientation: true,
            label: 'Цех "Кухня"',
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: SizedBox(
                      width: _screenWidth * 0.32,
                      child: Row(
                        children: [
                          //TextButton(onPressed: onPressed, child: child)
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: AppColors.lightGreenColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      color: Colors.black,
                                      Icons.remove_red_eye_rounded,
                                      size: 24,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    BigText(
                                      text: "Готовые",
                                      bold: true,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: AppColors.lightGreenColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      color: Colors.black,
                                      Icons.import_contacts,
                                      size: 24,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    BigText(
                                      text: "Архив",
                                      bold: true,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50.0, left: 16),
                  child: ListView.builder(
                    controller: ScrollController(), //TODO: А оно точно нужно???
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OrdersInKitchen(
                            order: orders[index],
                          ),
                          const SizedBox(
                            width: 16,
                          )
                        ],
                      );
                    },
                    itemCount: orders.length,
                  ),
                ),
              ),
            ],
          ),
        ));
  }