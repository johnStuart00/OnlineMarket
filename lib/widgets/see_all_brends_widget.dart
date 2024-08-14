import 'package:flutter/material.dart';
import 'package:online_market/utils/screen_size.dart';
import 'package:online_market/widgets/brend_container_widget.dart';
import 'package:online_market/widgets/closes_by_category_widget.dart';
import 'package:online_market/widgets/favorite_widget.dart';
import 'package:online_market/widgets/product_container_widget.dart';
import 'package:online_market/widgets/text_widgets/middle_text_widget.dart';

class SeeAllBrendsWindget extends StatefulWidget {
  const SeeAllBrendsWindget({super.key});

  @override
  State<SeeAllBrendsWindget> createState() => _SeeAllBrendsWindgetState();
}

class _SeeAllBrendsWindgetState extends State<SeeAllBrendsWindget> {
  final brendPhotoUrl = [
    'assets/brend_photo/boss.png',
    'assets/brend_photo/boss.png',
    'assets/brend_photo/boss.png',
    'assets/brend_photo/boss.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                        icon: const Icon(Icons.keyboard_arrow_left_rounded),
                      ),
                    ),
                    const MiddleTextWidget(widgetText: 'All Brends'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: CustomScrollView(
                slivers: [
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
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
                                        const ClosesByCategoryWidget(),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  BrendWidget(
                                    brendImage: Image(
                                        image:
                                            AssetImage(brendPhotoUrl[index])),
                                  ),
                                  const SizedBox(height: 5.0),
                                  const MiddleTextWidget(widgetText: 'Boss'),
                                ],
                              )),
                        );
                      },
                      childCount: brendPhotoUrl.length,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
