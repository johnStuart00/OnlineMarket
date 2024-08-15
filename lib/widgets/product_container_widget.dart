import 'package:flutter/material.dart';
import 'package:online_market/home_page/models/productModel.dart';
import 'package:online_market/widgets/text_widgets/marker_text_widget.dart';
import 'package:online_market/widgets/text_widgets/middle_text_widget.dart';

class ProductContainerWidget extends StatefulWidget {
  ProductModel productModel;
  ProductContainerWidget({required this.productModel});

  @override
  State<ProductContainerWidget> createState() => _ProductContainerWidgetState();
}

class _ProductContainerWidgetState extends State<ProductContainerWidget> {
  bool _favoriteButtonPinned = false;

  void _favoritePinned() {
    setState(() {
      _favoriteButtonPinned = !_favoriteButtonPinned;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 250,
        width: 200,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage(widget.productModel.img),
                      fit: BoxFit.cover),
                ),
                child: SizedBox(
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          _favoritePinned();
                        },
                        icon: _favoriteButtonPinned
                            ? Icon(
                                Icons.favorite_border,
                                color: Colors.red[400],
                              )
                            : Icon(
                                Icons.favorite,
                                color: Colors.red[400],
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: MarkerTextWidget(widgetText: 'BEST SELLER'),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: MiddleTextWidget(widgetText: widget.productModel.name),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: MiddleTextWidget(
                            widgetText: '\$${widget.productModel.price}')),
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).iconTheme.color,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        color: Theme.of(context).cardColor,
                      ),
                    )
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
