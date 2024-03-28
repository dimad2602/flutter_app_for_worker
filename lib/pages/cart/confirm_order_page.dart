import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/components/app_icon.dart';
import 'package:flutter_app_for_worker/components/big_text.dart';
import 'package:flutter_app_for_worker/components/button_bar_wide_green_button.dart';
import 'package:flutter_app_for_worker/components/custom_app_bar.dart';
import 'package:flutter_app_for_worker/components/my_text_field.dart';
import 'package:flutter_app_for_worker/domain/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_app_for_worker/domain/blocs/cart/cart_bloc.dart';
import 'package:flutter_app_for_worker/domain/blocs/restaurant/restaurant_bloc.dart';
import 'package:flutter_app_for_worker/domain/repositories/restaurant_repo/restaurant_repo.dart';
import 'package:flutter_app_for_worker/models/cart/cart_model.dart';
import 'package:flutter_app_for_worker/pages/first/first_page.dart';
import 'package:flutter_app_for_worker/utils/app_colors.dart';
import 'package:flutter_app_for_worker/widgets/cart_widgets/order_settings_in_cart.dart';
import 'package:flutter_app_for_worker/widgets/cart_widgets/payment_dropdown_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmOrderPage extends StatefulWidget {
  final List<CartModel> cartList;
  const ConfirmOrderPage({super.key, required this.cartList});
  static const String routeName = "/order_confirm_sql";

  @override
  State<ConfirmOrderPage> createState() => _OrderConfirmStateSql();
}

class _OrderConfirmStateSql extends State<ConfirmOrderPage> {
  bool switchValue = false;
  bool switchValueTable = false;
  final TextEditingController _tableFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //double _screenWidth = MediaQuery.of(context).size.width;
    //double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: const CustomAppBar(
        label: "Оформление заказа",
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                final idRestaurant = state.maybeWhen(
                  authenticated: (user) => user.restaurantId,
                  orElse: () => 0,
                );
                return BlocProvider(
                  create: (context) => RestaurantBloc(RestaurantRepo())
                    ..add(RestaurantEvent.started(idRestaurant)),
                  child: BlocBuilder<RestaurantBloc, RestaurantState>(
                    builder: (context, state) {
                      return state.when(restLoaded: ((restaurant) {
                        return BigText(
                          text: restaurant.brand.name ?? "Название",
                          bold: true,
                        );
                      }), initial: () {
                        return const SizedBox();
                      }, loading: () {
                        return const SizedBox();
                      }, error: () {
                        return const SizedBox();
                      });
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: OrderSettingsInCartWidget(
              text: 'Упаковать с собой',
              leftWidget: const AppIcon(
                icon: Icons.shopping_bag_rounded,
                backgroundColor: AppColors.lightGreenColor,
                iconColor: Colors.white,
                customSize: 20,
                size: 40,
                swadowOff: false,
              ),
              rightWidget: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Switch(
                  value: switchValue,
                  onChanged: (bool value) {
                    setState(() {
                      switchValue = value;
                    });
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: OrderSettingsInCartWidget(
              text: 'Добавить номер столика',
              leftWidget: const AppIcon(
                icon: Icons.table_bar,
                backgroundColor: AppColors.lightGreenColor,
                iconColor: Colors.white,
                customSize: 20,
                size: 40,
                swadowOff: false,
              ),
              rightWidget: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Switch(
                  value: switchValueTable,
                  onChanged: (bool value) {
                    setState(() {
                      switchValueTable = value;
                    });
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 8,),
          switchValueTable
              ? MyTextField(
                  labelText: "Номер столика", controller: _tableFieldController)
              : const SizedBox.shrink(),
          const SizedBox(
            height: 8,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: BigText(
              text: 'Выбор способа оплаты',
              bold: true,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
             padding: EdgeInsets.symmetric(horizontal: 12),
            child: PaymentDropdownWidget(),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0, bottom: 4),
            child: BigText(
              text: "Состав заказа",
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: widget.cartList.length,
              physics: const ClampingScrollPhysics(),
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8, top: 4, bottom: 4),
                  child: OrderSettingsInCartWidget(
                    container: false,
                    text: widget.cartList[index].itemName,
                    quantityAndPrice:
                        "${widget.cartList[index].quantity} x ${widget.cartList[index].itemPrice} руб.",
                  ),
                );
              },
            ),
          ),
        ]),
      ),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return state.cartModel.isNotEmpty
              ? ButtonBarGreenButton(
                  onTap: () {
                    print(state.cartModel);

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FirstPage(),
                      ),
                    );
                  },
                  row: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const BigText(
                            text:
                                "Итого" /*cartController.totalItems.toString() textCountItems*/,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.currency_ruble,
                                size: 16,
                              ),
                              BlocBuilder<CartBloc, CartState>(
                                builder: (context, state) {
                                  return BigText(
                                    text: context
                                        .read<CartBloc>()
                                        .totalPrice()
                                        .toString(),
                                    bold: true,
                                  );
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                  buttonText: "Оформить заказ",
                  condition: true)
              : const SizedBox.shrink();
        },
      ),
    );
  }
}
