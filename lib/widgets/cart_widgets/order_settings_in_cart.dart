import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/components/big_text.dart';

class OrderSettingsInCartWidget extends StatelessWidget {
  final String text;
  final bool container;
  final String? quantityAndPrice;
  final Widget? rightWidget;
  final Widget? leftWidget;
  const OrderSettingsInCartWidget(
      {super.key,
      required this.text,
      this.rightWidget,
      this.leftWidget,
      this.quantityAndPrice,
      this.container = true});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return container
        ? Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 8, top: 4, bottom: 4, right: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          leftWidget ?? const SizedBox.shrink(),
                          leftWidget != null
                              ? const SizedBox(
                                  width: 8,
                                )
                              : const SizedBox.shrink(),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: _screenWidth * 0.6,
                            ),
                            child: BigText(
                              text: text,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //Будет стоимость позиции
                          quantityAndPrice != null
                              ? BigText(
                                  text: quantityAndPrice!,
                                  color: Colors.black,
                                )
                              : const SizedBox.shrink(),
                          const SizedBox(
                            width: 4,
                          ),
                          rightWidget ?? const SizedBox.shrink(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        : Padding(
            padding:
                const EdgeInsets.only(left: 8, top: 4, bottom: 4, right: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        leftWidget ?? const SizedBox.shrink(),
                        leftWidget != null
                            ? const SizedBox(
                                width: 8,
                              )
                            : const SizedBox.shrink(),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: _screenWidth * 0.6,
                          ),
                          child: BigText(
                            text: text,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Будет стоимость позиции
                        quantityAndPrice != null
                            ? BigText(
                                text: quantityAndPrice!,
                                color: Colors.black,
                              )
                            : const SizedBox.shrink(),
                        const SizedBox(
                          width: 4,
                        ),
                        rightWidget ?? const SizedBox.shrink(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
