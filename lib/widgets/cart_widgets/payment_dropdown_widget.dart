import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/components/app_icon.dart';
import 'package:flutter_app_for_worker/components/big_text.dart';
import 'package:flutter_app_for_worker/utils/app_colors.dart';

class PaymentDropdownWidget extends StatefulWidget {
  const PaymentDropdownWidget({super.key});

  @override
  State<PaymentDropdownWidget> createState() => _PaymentDropdownWidgetState();
}

class _PaymentDropdownWidgetState extends State<PaymentDropdownWidget> {
  String? _selectedPaymentMethod = "Банковская карта";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40 / 2),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: _selectedPaymentMethod,
          onChanged: (String? newValue) {
            setState(() {
              _selectedPaymentMethod = newValue;
            });
          },
          items: <String>['QR Код', 'Банковская карта', 'Наличные']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Row(
                children: [
                  const AppIcon(
                    icon: Icons.payments_rounded,
                    iconColor: AppColors.lightGreenColor,
                    customSize: 40,
                    size: 40,
                    swadowOff: false,
                    decorBoxOff: false,
                  ),
                  const SizedBox(width: 10),
                  BigText(
                    text: value,
                    maxLines: 1,
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
