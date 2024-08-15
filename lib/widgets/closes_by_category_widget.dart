import 'package:flutter/material.dart';
import 'package:online_market/home_page/models/productModel.dart';
import 'package:online_market/utils/screen_size.dart';
import 'package:online_market/widgets/favorite_widget.dart';
import 'package:online_market/widgets/product_container_widget.dart';
import 'package:online_market/widgets/text_widgets/middle_text_widget.dart';

class ClosesByCategoryWidget extends StatelessWidget {
  const ClosesByCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                child: SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.keyboard_arrow_left_rounded),
                        ),
                      ),
                      const Expanded(
                        child: Center(
                          child: MiddleTextWidget(widgetText: 'Shoes'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 60,
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio:
                        (ScreenUtil.screenWidth(context) / 2) / 300,
                  ),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const FavoriteWidget(),
                          ),
                        );
                      },
                      child: ProductContainerWidget(
                        productModel: ProductModel(
                            img:
                                "https://static.vecteezy.com/system/resources/previews/008/619/502/non_2x/bag-yellow-orange-red-white-color-golden-background-wallpaper-copy-space-decoration-ornament-business-shopping-friday-sale-store-retail-product-special-surprise-commercial-discount-consumer-3d-render-photo.jpg",
                            name: "name",
                            price: 123),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
