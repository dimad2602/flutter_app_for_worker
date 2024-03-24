import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/components/big_text.dart';
import 'package:flutter_app_for_worker/utils/app_colors.dart';

import '../../models/items/items.dart';

class ItemInOrderWidget extends StatelessWidget {
  final Items items;
  final bool? waiter;
  const ItemInOrderWidget({
    super.key,
    this.waiter = false,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    print(items);
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
                        BigText(
                          text: "${items.amount}",
                          bold: true,
                          maxLines: 2,
                          color: items.amount > 1
                              ? Colors.red
                              : Colors.black, //TODo
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: waiter == false
                                ? _screenWidth * 0.16
                                : _screenWidth * 0.50,
                          ),
                          child: BigText(
                            text: items.item.title,
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
                        waiter == true
                            ? BigText(
                                text: "${items.item.price} Р",
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
                      ],
                    ),
                  ],
                ),
                //TODO: Сейчас здесь размещена общая заметка, а должна быть у конкретного блюда
                items.note == ""
                    ? const SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.only(top: 4.0, bottom: 4),
                        child: Container(
                          color: Colors.grey[300],
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: BigText(
                              text: items.note!,
                              italics: true,
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
