import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/models/active_order_model.dart';

import '../../components/custom_app_bar.dart';
import '../../locator_get.dart';
import '../../utils/app_colors.dart';
import '../../utils/constants.dart';
import '../../widgets/orders_widgets/active_order_widget.dart';

class ActiveOrdersOldPage extends StatelessWidget {
  const ActiveOrdersOldPage({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeConstants = locator.get<Constants>();
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(sizeConstants.getHeight45()),
          child: const CustomAppBar(
            tabBar: TabBar(
              indicatorColor: AppColors.bottonColor,
              labelColor: AppColors.bottonColor,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  icon: Icon(Icons.new_label),
                ),
                Tab(
                  icon: Icon(Icons.kitchen),
                ),
                Tab(
                  icon: Icon(Icons.done_all),
                ),
              ],
            ),
            label: 'Оформление заказа',
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: ListView.separated(
                  // Позволяем перекрывать категории
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return ActiveOrderWidget(orderModel: const ActiveOrderModel(id: '1', tableNumber: '23', time: '12:36', takeaway: false,),);
                    // OrderIncomingWidget(
                    //   model: _incomingOrderController.allPapers.reversed
                    //           .toList()[
                    //       index], //_incomingOrderController.allPapers[index],
                    //   index: index,
                    //   orderItems: _incomingOrderController.allCategories,
                    // );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: 25 //TODO: Bloc
                  //_incomingOrderController.allPapers.length
                  ),
            ),
            SingleChildScrollView(
              child: ListView.separated(
                  // Позволяем перекрывать категории
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Text('dfg');
                    // OrderIncomingWidget(
                    //   model: _incomingOrderController.allPapers.reversed
                    //           .toList()[
                    //       index], //_incomingOrderController.allPapers[index],
                    //   index: index,
                    //   orderItems: _incomingOrderController.allCategories,
                    // );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: 3 //TODO: Bloc
                  //_incomingOrderController.allPapers.length
                  ),
            ),
            SingleChildScrollView(
              child: ListView.separated(
                  // Позволяем перекрывать категории
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Text('dfg1231');
                    // OrderIncomingWidget(
                    //   model: _incomingOrderController.allPapers.reversed
                    //           .toList()[
                    //       index], //_incomingOrderController.allPapers[index],
                    //   index: index,
                    //   orderItems: _incomingOrderController.allCategories,
                    // );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: 5 //TODO: Bloc
                  //_incomingOrderController.allPapers.length
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
