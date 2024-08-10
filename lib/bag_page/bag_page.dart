import 'package:flutter/material.dart';
import 'package:online_market/utils/screen_size.dart';
import 'package:online_market/widgets/bag_page_container_widget.dart';
import 'package:online_market/widgets/checkout_widget.dart';
import 'package:online_market/widgets/text_widgets/large_text_widget.dart';
import 'package:online_market/widgets/text_widgets/marker_text_widget.dart';
import 'package:online_market/widgets/text_widgets/middle_text_widget.dart';

class BagPage extends StatefulWidget {
  const BagPage({super.key});

  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  List<String> insideBagItems = [
    'item1',
    'item2',
    'item3',
    'item2',
    'item3',
    'item2',
    'item3',
    'item2',
    'item3',
    'item2',
    'item3'
  ];

  void incrementItem(int count) {}

  void deleteItem(int index) {
    setState(() {
      insideBagItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
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
                      mainAxisAlignment: MainAxisAlignment.start,
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
                        const Expanded(
                            child: Center(
                                child: MiddleTextWidget(
                                    widgetText: 'Sneaker Shop'))),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 60.0,
                    bottom: 200,
                  ),
                  child: CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return ObjectContainer(
                              imageUrl:
                                  'assets/product_photo/nike001.png', // Example image path
                              title: insideBagItems[index],
                              description:
                                  'Description for ${insideBagItems[index]}',
                              onDelete: () => deleteItem(index),
                              onIncrement: (count) => incrementItem(count),
                            );
                          },
                          childCount: insideBagItems.length,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(18.0),
                    height: 200,
                    width: ScreenUtil.screenWidth(context),
                    color: Colors.white,
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MiddleTextWidget(widgetText: 'Subtotal'),
                            MarkerTextWidget(widgetText: '\$753.95'),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MiddleTextWidget(widgetText: 'Delivery'),
                            MarkerTextWidget(widgetText: '\$60.00'),
                          ],
                        ),
                        const Divider(
                          height: 10,
                          thickness: 1,
                          indent: 0,
                          endIndent: 1,
                          color: Colors.grey,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LargeTextWidget(widgetText: 'Total Cost:'),
                            MarkerTextWidget(widgetText: '\$813.95'),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const BagPageWidget(),
                              ),
                            );
                          },
                          child: SizedBox(
                            width: ScreenUtil.setWidth(context, 0.7),
                            height: 40,
                            child: const Center(child: Text('Checkout')),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
