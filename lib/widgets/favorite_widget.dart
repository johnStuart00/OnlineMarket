import 'package:flutter/material.dart';
import 'package:online_market/utils/screen_size.dart';
import 'package:online_market/widgets/text_widgets/large_text_widget.dart';
import 'package:online_market/widgets/text_widgets/middle_text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  final List<String> brendImagePaths = [
    'assets/product_photo/nike001.png',
    'assets/product_photo/nike001.png',
    'assets/product_photo/nike001.png',
    'assets/product_photo/nike001.png',
    'assets/product_photo/nike001.png',
    'assets/product_photo/nike001.png',
    'assets/product_photo/nike001.png',
  ];

  bool _favoriteButtonPinned = false;

  void _favoritePinned() {
    setState(() {
      _favoriteButtonPinned = !_favoriteButtonPinned;
    });
  }

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
                    const EdgeInsets.only(right: 10.0, top: 10.0, left: 10.0),
                child: SizedBox(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      const MiddleTextWidget(widgetText: 'Category name'),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
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
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, top: 60.0, right: 10.0),
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(child: SizedBox(height: 10.0)),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 450,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                          image: AssetImage('assets/product_photo/nike001.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: SizedBox(
                        width: ScreenUtil.screenWidth(context),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 240,
                                  child: LargeTextWidget(
                                      widgetText:
                                          'Nike Air Max 270 Essential')),
                              MiddleTextWidget(widgetText: 'Men\'s shoes'),
                              LargeTextWidget(widgetText: '\$179.39'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 10.0)),
                  SliverToBoxAdapter(
                    child: SizedBox(
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
                                    builder: (context) =>
                                        const FavoriteWidget(),
                                  ),
                                );
                              },
                              child: Container(
                                height: ScreenUtil.setHeight(context, 0.5),
                                width: ScreenUtil.setWidth(context, 0.15),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
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
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 10.0)),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: MiddleTextWidget(
                        widgetText:
                            'The Max Air 270 unit delivers unrivaled, all-day comfort. The sleek, running-inspired design roots you to everything Nike',
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 350)),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 125,
                width: ScreenUtil.screenWidth(context),
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: IconButton(
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
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 55.0),
                        child: Row(
                          children: [
                            const Icon(Icons.shopping_bag_rounded),
                            const SizedBox(width: 10.0),
                            MiddleTextWidget(
                              widgetText:
                                  AppLocalizations.of(context)!.add_to_cart,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
