import 'package:flutter/material.dart';
import 'package:online_market/utils/screen_size.dart';
import 'package:online_market/widgets/text_widgets/large_text_widget.dart';
import 'package:online_market/widgets/text_widgets/middle_text_widget.dart';

class FavoriteWidget extends StatelessWidget {
  FavoriteWidget({super.key});

  final List<String> brendImagePaths = [
    'assets/product_photo/nike001.png',
    'assets/product_photo/nike001.png',
    'assets/product_photo/nike001.png',
    'assets/product_photo/nike001.png',
    'assets/product_photo/nike001.png',
    'assets/product_photo/nike001.png',
    'assets/product_photo/nike001.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                child: Column(
                  children: [
                    const SizedBox(height: 5.0),
                    SizedBox(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon:
                                  const Icon(Icons.keyboard_arrow_left_rounded),
                            ),
                          ),
                          const MiddleTextWidget(widgetText: 'Sneaker Shop'),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.shopping_bag_rounded),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      height: 450,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          image: DecorationImage(
                            image:
                                AssetImage('assets/product_photo/nike001.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: SizedBox(
                          width: ScreenUtil.screenWidth(context),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 240,
                                  child: LargeTextWidget(
                                      widgetText:
                                          'Nike Air Max 270 Essential')),
                              MiddleTextWidget(widgetText: 'Men\' shoes'),
                              LargeTextWidget(widgetText: '\$179.39'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 70,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: brendImagePaths.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 5.0,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => FavoriteWidget(),
                                  ),
                                );
                              },
                              child: Container(
                                height: ScreenUtil.setHeight(context, 0.5),
                                width: ScreenUtil.setWidth(context, 0.15),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(brendImagePaths[index]),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: MiddleTextWidget(
                        widgetText:
                            'The Max Air 270 unit delivers unrivaled, all-day comfort. The sleek, running-inspired design roots you to everything Nike',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 125,
            width: ScreenUtil.screenWidth(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border),
                  ),
                ),
                Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 55.0),
                    child: Row(
                      children: [
                        Icon(Icons.shopping_bag_rounded),
                        SizedBox(width: 10.0),
                        Text('Add To Cart'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
