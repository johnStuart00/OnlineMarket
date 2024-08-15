import 'package:flutter/material.dart';
import 'package:online_market/widgets/category_container_widget.dart';
import 'package:online_market/widgets/closes_by_category_widget.dart';
import 'package:online_market/widgets/closes_category_widget.dart';
import 'package:online_market/widgets/search_field_widget.dart';
import 'package:online_market/widgets/text_widgets/middle_text_widget.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final searchBoxController = TextEditingController();

  final List<String> categoryNames = [
    'Ayal',
    'Erkek',
  ];

  final List<String> closesCategoryNames = [
    'All',
    'Shoes',
    'T-Shirts',
    'Pants',
    'Jackets',
    'Hoodies',
    'Dresses',
    'Socks',
    'Hats',
    'Scarves',
    'Gloves',
    'Belts',
    'Sweaters',
    'Shorts',
    'Underwear',
    'Bags',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MiddleTextWidget(widgetText: 'Search Field'),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SearchBoxWidget(
                searchController: searchBoxController,
              ),
              const SizedBox(height: 10),
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
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: closesCategoryNames.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                const ClosesByCategoryWidget(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 5.0,
                        ),
                        child: ClosesCategoryWidget(
                          categoryName: closesCategoryNames[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
