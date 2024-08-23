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
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            width: 45,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Image.asset(
                              'assets/icons/back.png',
                              color: Theme.of(context).iconTheme.color,
                            )),
                      ),
                      const MiddleTextWidget(widgetText: 'Category name'),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                            width: 45,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Image.asset(
                              'assets/icons/bag_on.png',
                              color: Theme.of(context).iconTheme.color,
                            )),
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
                    child: _seeProductLarge(),
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
                    child: _infoAboutProduct(),
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
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
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                'assets/icons/bag_on.png',
                                color: Theme.of(context).iconTheme.color,
                              ),
                              MiddleTextWidget(
                                widgetText:
                                    AppLocalizations.of(context)!.add_to_cart,
                              ),
                            ],
                          ),
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

class _infoAboutProduct extends StatelessWidget {
  const _infoAboutProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: MiddleTextWidget(
        widgetText:
            'The Max Air 270 unit delivers unrivaled, all-day comfort. The sleek, running-inspired design roots you to everything Nike',
      ),
    );
  }
}

class _seeProductLarge extends StatelessWidget {
  const _seeProductLarge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      widgetText: 'Nike Air Max 270 Essential')),
              MiddleTextWidget(widgetText: 'Men\'s shoes'),
              LargeTextWidget(widgetText: '\$179.39'),
            ],
          ),
        ),
      ),
    );
  }
}
