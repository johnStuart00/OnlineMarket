import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:online_market/home_page/models/productModel.dart';
import 'package:online_market/utils/screen_size.dart';
import 'package:online_market/widgets/see_product_widget.dart';
import 'package:online_market/widgets/product_container_widget.dart';
import 'package:online_market/widgets/text_widgets/middle_text_widget.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoritePage extends StatefulWidget {
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    // TODO: implement initState
    favourity.readdb();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MiddleTextWidget(
                          widgetText: AppLocalizations.of(context)!.favorites,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 60.0,
                  ),
                  child: Observer(builder: (_) {
                    return CustomScrollView(
                      slivers: [
                        SliverGrid(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio:
                                (ScreenUtil.screenWidth(context) / 2) / 300,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const FavoriteWidget(),
                                        ),
                                      );
                                    },
                                    child: ProductContainerWidget(
                                      productModel: ProductModel(
                                          img:
                                              "https://static.vecteezy.com/system/resources/previews/008/619/502/non_2x/bag-yellow-orange-red-white-color-golden-background-wallpaper-copy-space-decoration-ornament-business-shopping-friday-sale-store-retail-product-special-surprise-commercial-discount-consumer-3d-render-photo.jpg",
                                          name: favourity.favourit[index].name,
                                          price:
                                              favourity.favourit[index].price,
                                          description:
                                              favourity.favourit[index].dis,
                                          id: favourity.favourit[index].id),
                                      onPressed: () {
                                        log("message");
                                        favourity.checkdb(
                                            favourity.favourit[index].id,
                                            favourity.favourit[index]);
                                      },
                                    )),
                              );
                            },
                            childCount: favourity.favourit.length,
                          ),
                        ),
                      ],
                    );
                  }),
                )
              ],
            )),
      ),
    );
  }
}
