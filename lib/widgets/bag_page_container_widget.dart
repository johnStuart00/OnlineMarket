import 'package:flutter/material.dart';
import 'package:online_market/utils/screen_size.dart';
import 'package:online_market/widgets/text_widgets/large_text_widget.dart';
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
              flex: 1,
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
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LargeTextWidget(widgetText: widget.title),
                    const SizedBox(height: 5.0),
                    MiddleTextWidget(widgetText: widget.description)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
