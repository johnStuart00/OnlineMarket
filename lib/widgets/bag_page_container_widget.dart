import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_market/utils/screen_size.dart';
import 'package:online_market/widgets/text_widgets/large_text_widget.dart';
import 'package:online_market/widgets/text_widgets/marker_text_widget.dart';
import 'package:online_market/widgets/text_widgets/middle_text_widget.dart';

class ObjectContainer extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;
  final Function onDelete;
  final Function onIncrement;

  const ObjectContainer({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.onDelete,
    required this.onIncrement,
  });

  @override
  _ObjectContainerState createState() => _ObjectContainerState();
}

class _ObjectContainerState extends State<ObjectContainer> {
  int objectCount = 1;

  void _incrementCount() {
    setState(() {
      objectCount++;
    });
  }

  void _decrementCount() {
    setState(() {
      if (objectCount > 1) {
        objectCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        width: ScreenUtil.screenWidth(context),
        height: 105,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.imageUrl),
                        fit: BoxFit.cover,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0))),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LargeTextWidget(widgetText: widget.title),
                  MiddleTextWidget(widgetText: widget.description),
                  const MarkerTextWidget(widgetText: '\$565.90')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: ScreenUtil.setWidth(context, 0.18),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18.0,
                      ),
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Image.asset('assets/icons/delete.png'),
                    ),
                  ),
                  Container(
                    width: ScreenUtil.setWidth(context, 0.18),
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.blueAccent)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _decrementCount();
                          },
                          child: const Icon(Icons.arrow_downward_rounded),
                        ),
                        MarkerTextWidget(
                          widgetText: objectCount.toString(),
                        ),
                        GestureDetector(
                          onTap: () {
                            _incrementCount();
                          },
                          child: const Icon(Icons.arrow_upward_rounded),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
