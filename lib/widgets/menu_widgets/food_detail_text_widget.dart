import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/components/big_text.dart';
import 'package:flutter_app_for_worker/models/item/item.dart';

class FoodDetailtextWidget extends StatelessWidget {
  final Item item;

  const FoodDetailtextWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: BigText(
                text: item.title,
                size: 18,
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 8,),
                const Icon(
                  Icons.currency_ruble,
                  size: 16,
                ),
                BigText(text: item.price.toString())
              ],
            ),
          ],
        ),
        Wrap(
          children: List.generate(5, (index) {
            return const Icon(
              Icons.star,
              size: 12,
            );
          }),
        ),
        Row(
          children: [
            BigText(
              text: item.weight == 0 || item.weight == null
                  ? "${item.volume} мл"
                  : "${item.weight} г",
              maxLines: 1,
              color: Colors.black54,
            ),
          ],
        ),
      ],
    );
  }
}
