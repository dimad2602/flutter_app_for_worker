import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/components/big_text.dart';
import 'package:flutter_app_for_worker/locator_get.dart';
import 'package:flutter_app_for_worker/models/items/items.dart';
import 'package:flutter_app_for_worker/utils/constants.dart';
import 'package:flutter_app_for_worker/widgets/menu_widgets/dish_card_widget.dart';

class MenuWidget extends StatefulWidget {
  final String menuCategory;
  final List<Items> items;
  //final String testModel;
  final int indexCount;

  /*final String? itemName;
  final String? itemWeight;*/
  const MenuWidget({
    Key? key,
    required this.menuCategory,
    required this.indexCount,
    required this.items,
    /*this.itemName ='',
    this.itemWeight ='',*/
    //required this.model,
    //required this.testModel,
  }) : super(key: key);

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  ScrollController _scrollController = ScrollController();
  double _previousPosition = 0;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    var sizeConstants = locator.get<Constants>();
    return InkWell(
      child: Padding(
        padding: EdgeInsets.only(left: sizeConstants.getWidth10()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: sizeConstants.getWidth10()),
              child: BigText(
                text: widget.menuCategory,
                bold: true,
              ),
            ),
            Container(
              height: _screenHeight * 0.3,
              child: ListView.builder(
                controller: _scrollController,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  // перемешиваю первую строку
                  List<Items> items = widget.items;
                  // wide_menuPaperController.allItemsForCategory[
                  //     widget
                  //         .IndexCount];

                  // if (widget.indexCount == 0 && index == 0) {
                  //   items.shuffle();
                  // }
                  return //Text(widget.items[index].item.price.toString());
                      DishCardWidget(
                   // testName: widget.items[index].item.title,
                    imagePath: '${widget.items[index].item.image}',
                    itemCosts: '${widget.items[index].item.price}',
                    model: widget.items[index],
                  );
                },
                itemCount: widget.items.length,
                // _menuPaperController
                //     .allItemsForCategory[widget.indexCount].length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
