import 'package:flutter/material.dart';
import 'package:online_market/utils/screen_size.dart';
import 'package:online_market/widgets/brend_container_widget.dart';
import 'package:online_market/widgets/category_container_widget.dart';
import 'package:online_market/widgets/favorite_widget.dart';
import 'package:online_market/widgets/text_widgets/large_text_widget.dart';
import 'package:online_market/widgets/product_container_widget.dart';
import 'package:online_market/widgets/text_widgets/marker_text_widget.dart';
import 'package:online_market/widgets/text_widgets/middle_text_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<String> categoryNames = [
    'Ayal',
    'Erkek',
  ];

  final List<String> brendImagePaths = [
    'assets/brend_photo/boss.png',
    'assets/brend_photo/boss.png',
    'assets/brend_photo/boss.png',
    'assets/brend_photo/boss.png',
    'assets/brend_photo/boss.png',
    'assets/brend_photo/boss.png',
    'assets/brend_photo/boss.png',
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
                        child: BrendWidget(
                          brendImage: Image.asset(brendImagePaths[index]),
                        ),
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
                    return const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 5.0,
                        ),
                        child: ProductContainerWidget());
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
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: (ScreenUtil.screenWidth(context) / 2) / 300,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: ProductContainerWidget(),
                );
              },
              childCount: 10,
            ),
          ),
        ),
      ],
    );
  }
}
