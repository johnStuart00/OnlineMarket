import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:online_market/data/banner_repository/controller/brends_controller.dart';
import 'package:online_market/data/categories_repository/controller/categories_controller.dart';
import 'package:online_market/data/product_repository/controller/product_controller.dart';
import 'package:online_market/home_page/models/productModel.dart';
import 'package:online_market/utils/screen_size.dart';

import 'package:online_market/widgets/brend_container_widget.dart';
import 'package:online_market/widgets/category_container_widget.dart';
import 'package:online_market/widgets/closes_by_category_widget.dart';
import 'package:online_market/widgets/favorite_widget.dart';
import 'package:online_market/widgets/product_grid_widget.dart';
import 'package:online_market/widgets/see_all_brends_widget.dart';
import 'package:online_market/widgets/subcategory_by_category_widget.dart';
import 'package:online_market/widgets/text_widgets/large_text_widget.dart';
import 'package:online_market/widgets/product_container_widget.dart';
import 'package:online_market/widgets/text_widgets/marker_text_widget.dart';
import 'package:online_market/widgets/text_widgets/middle_text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final brendcontroller = GetIt.instance<BrendsController>();
  final productcontroller = GetIt.instance<ProductController>();
  final cateogriescontroller = GetIt.instance<CategoriesController>();
  @override
  void initState() {
    // TODO: implement initState
    productcontroller.fetchData();
    brendcontroller.fetchData();
    cateogriescontroller.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(left: 10.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            LargeTextWidget(
                              widgetText: 'Explore',
                            ),
                            // Container(
                            //   decoration: BoxDecoration(
                            //     color: Colors.white,
                            //     borderRadius: BorderRadius.circular(30),
                            //   ),
                            //   child: IconButton(
                            //       onPressed: () {},
                            //       icon: const Icon(Icons.shopping_bag_rounded)),
                            // )
                          ],
                        ),
                        SizedBox(height: 5),
                        MiddleTextWidget(
                          widgetText: 'Select Category',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: Observer(builder: (_) {
                      if (cateogriescontroller.categories == null) {
                        return Container();
                      }
                      switch (cateogriescontroller.categories!.status) {
                        case FutureStatus.pending:
                          return const CircularProgressIndicator();
                        case FutureStatus.rejected:
                          return Text(
                              'Error: ${brendcontroller.brends_get!.error}');
                        case FutureStatus.fulfilled:
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: cateogriescontroller
                                .categories!.value!.data!.length,
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
                                            SubcategoryByCategoryWidget(),
                                      ),
                                    );
                                  },
                                  child: CategoryWidget(
                                    categoryName: cateogriescontroller
                                        .categories!.value!.data![index].name!,
                                  ),
                                ),
                              );
                            },
                          );
                      }
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const MiddleTextWidget(widgetText: 'Brendler'),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const SeeAllBrendsWindget(),
                              ),
                            );
                          },
                          child: const MarkerTextWidget(widgetText: 'See all'),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: Observer(builder: (_) {
                      if (brendcontroller.brends_get == null) {
                        return Container();
                      }
                      switch (brendcontroller.brends_get!.status) {
                        case FutureStatus.pending:
                          return const CircularProgressIndicator();
                        case FutureStatus.rejected:
                          return Text(
                              'Error: ${brendcontroller.brends_get!.error}');
                        case FutureStatus.fulfilled:
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                brendcontroller.brends_get!.value!.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5.0,
                                  horizontal: 5.0,
                                ),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: BrendWidget(
                                    brendImage: Image.network(
                                      brendcontroller.brends_get!.value!
                                          .data![index].logo!,
                                      errorBuilder: (context, error,
                                              stackTrace) =>
                                          Image.asset(
                                              "assets/brend_photo/boss.png"),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                      }
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const MiddleTextWidget(widgetText: 'Popular products'),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ClosesByCategoryWidget(),
                                ),
                              );
                            },
                            child:
                                const MarkerTextWidget(widgetText: 'See all'))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    child: Observer(builder: (_) {
                      if (productcontroller.product_controller == null) {
                        return Container();
                      }
                      switch (productcontroller.product_controller!.status) {
                        case FutureStatus.pending:
                          return CircularProgressIndicator();
                        case FutureStatus.rejected:
                          return Text("Error");
                        case FutureStatus.fulfilled:
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: productcontroller
                                .product_controller!.value!.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              var pro = productcontroller
                                  .product_controller!.value!.data![index];
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
                                  child: ProductContainerWidget(
                                    productModel: ProductModel(
                                        img:
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBbmndaKuy8w2TPeq2mCtia2PIxHYuV4uCng&s",
                                        name: pro.name!,
                                        price: pro.price!.toDouble()),
                                  ),
                                ),
                              );
                            },
                          );
                      }
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const MiddleTextWidget(widgetText: 'New Arrivals'),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ClosesByCategoryWidget(),
                              ),
                            );
                          },
                          child: const MarkerTextWidget(widgetText: 'See all'),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            Observer(builder: (_) {
              if (productcontroller.product_controller == null) {
                return Container();
              }
              switch (productcontroller.product_controller!.status) {
                case FutureStatus.pending:
                  return SliverFillRemaining(
                    child: CircularProgressIndicator(),
                  );
                case FutureStatus.rejected:
                  return SliverFillRemaining(child: Text("error"));
                case FutureStatus.fulfilled:
                  return SliverPadding(
                    padding: const EdgeInsets.all(8.0),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 0.8,
                        crossAxisCount: 2,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          var pro = productcontroller
                              .product_controller!.value!.data![index];
                          return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const FavoriteWidget(),
                                  ),
                                );
                              },
                              child: ProductGridWidget(
                                products: ProductModel(
                                    img:
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBbmndaKuy8w2TPeq2mCtia2PIxHYuV4uCng&s",
                                    name: pro.name!,
                                    price: pro.price!.toDouble()),
                              ));
                        },
                        childCount: productcontroller
                            .product_controller!.value!.data!.length,
                      ),
                    ),
                  );
              }
            }),
          ],
        ),
      ),
    );
  }
}
