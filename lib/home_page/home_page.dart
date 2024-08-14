import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:online_market/data/banner_repository/controller/brends_controller.dart';
import 'package:online_market/utils/screen_size.dart';
import 'package:online_market/widgets/brend_container_widget.dart';
import 'package:online_market/widgets/category_container_widget.dart';
import 'package:online_market/widgets/favorite_widget.dart';
import 'package:online_market/widgets/text_widgets/large_text_widget.dart';
import 'package:online_market/widgets/product_container_widget.dart';
import 'package:online_market/widgets/text_widgets/marker_text_widget.dart';
import 'package:online_market/widgets/text_widgets/middle_text_widget.dart';

import '../data/banner_repository/controller/brends_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final brendcontroller = GetIt.instance<BrendsController>();
  @override
  void initState() {
    // TODO: implement initState
    brendcontroller.fetchData();
    super.initState();
  }

  final List<String> categoryNames = [
    'Ayal',
    'Erkek',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(left: 10.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const LargeTextWidget(
                              widgetText: 'Explore',
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.shopping_bag_rounded)),
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                        const MiddleTextWidget(
                          widgetText: 'Select Category',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryNames.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 5.0,
                          ),
                          child: CategoryWidget(
                            categoryName: categoryNames[index],
                          ),
                        );
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MiddleTextWidget(widgetText: 'Brendler'),
                        MarkerTextWidget(widgetText: 'See all')
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
                          return CircularProgressIndicator();
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
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MiddleTextWidget(widgetText: 'Popular products'),
                        MarkerTextWidget(widgetText: 'See all')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
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
                                  builder: (context) => const FavoriteWidget(),
                                ),
                              );
                            },
                            child: const ProductContainerWidget(),
                          ),
                        );
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MiddleTextWidget(widgetText: 'New Arrivals'),
                        MarkerTextWidget(widgetText: 'See all')
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  // childAspectRatio: (ScreenUtil.screenWidth(context) / 2) / 300,
                  maxCrossAxisExtent: 300,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const FavoriteWidget(),
                            ),
                          );
                        },
                        child: const ProductContainerWidget());
                  },
                  childCount: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
