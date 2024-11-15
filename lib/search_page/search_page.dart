import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:online_market/data/product_repository/controller/product_controller.dart';
import 'package:online_market/widgets/category_container_widget.dart';
import 'package:online_market/widgets/closes_by_category_widget.dart';
import 'package:online_market/widgets/closes_category_widget.dart';
import 'package:online_market/widgets/search_field_widget.dart';
import 'package:online_market/widgets/text_widgets/middle_text_widget.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  final caregories_controller = GetIt.instance<ProductController>();
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
              SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MiddleTextWidget(
                      widgetText: AppLocalizations.of(context)!.search_field,
                    ),
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
                            builder: (context) => ClosesByCategoryWidget(
                              controller: caregories_controller,
                              name: '',
                            ),
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
