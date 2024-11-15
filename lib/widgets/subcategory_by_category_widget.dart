import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:online_market/widgets/closes_by_category_widget.dart';
import 'package:online_market/widgets/closes_category_widget.dart';
import 'package:online_market/widgets/text_widgets/middle_text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../data/product_repository/controller/product_controller.dart';

class SubcategoryByCategoryWidget extends StatelessWidget {
  SubcategoryByCategoryWidget({super.key});

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
        child: Stack(
          children: [
            Positioned(
              child: Positioned(
                top: 0,
                left: 0,
                right: 0,
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
                      MiddleTextWidget(
                        widgetText: AppLocalizations.of(context)!.subcategories,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 60.0,
              ),
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
    ));
  }
}
