import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:online_market/data/banner_repository/controller/brends_controller.dart';
import 'package:online_market/data/product_repository/controller/product_controller.dart';
import 'package:online_market/utils/screen_size.dart';
import 'package:online_market/widgets/brend_container_widget.dart';
import 'package:online_market/widgets/closes_by_category_widget.dart';
import 'package:online_market/widgets/text_widgets/middle_text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SeeAllBrendsWindget extends StatefulWidget {
  BrendsController controller;
  SeeAllBrendsWindget(this.controller);
  @override
  State<SeeAllBrendsWindget> createState() => _SeeAllBrendsWindgetState();
}

class _SeeAllBrendsWindgetState extends State<SeeAllBrendsWindget> {
  final brend_controller = GetIt.instance<ProductController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Observer(builder: (context) {
        if (widget.controller.brends_get == null) {
          return Container();
        }
        switch (widget.controller.brends_get!.status) {
          case FutureStatus.pending:
            return Center(child: CircularProgressIndicator());
          case FutureStatus.rejected:
            return MiddleTextWidget(
                widgetText: AppLocalizations.of(context)!.error);
          case FutureStatus.fulfilled:
            return Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
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
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon:
                                  const Icon(Icons.keyboard_arrow_left_rounded),
                            ),
                          ),
                          MiddleTextWidget(widgetText: 'All Brends'),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: CustomScrollView(
                      slivers: [
                        SliverGrid(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
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
                                      brend_controller.brendProduct(widget
                                          .controller
                                          .brends_get!
                                          .value!
                                          .data![index]
                                          .id!);
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ClosesByCategoryWidget(
                                            controller: brend_controller,
                                            name: widget.controller.brends_get!
                                                .value!.data![index].name!,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        BrendWidget(
                                          brendImage: Image.network(
                                            widget.controller.brends_get!.value!
                                                .data![index].logo!,
                                            errorBuilder: (context, error,
                                                    stackTrace) =>
                                                Image.asset(
                                                    "assets/brend_photo/boss.png"),
                                          ),
                                        ),
                                        const SizedBox(height: 5.0),
                                        MiddleTextWidget(
                                            widgetText: widget
                                                .controller
                                                .brends_get!
                                                .value!
                                                .data![index]
                                                .name!),
                                      ],
                                    )),
                              );
                            },
                            childCount: widget
                                .controller.brends_get!.value!.data!.length,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
        }
      }),
    ));
  }
}
