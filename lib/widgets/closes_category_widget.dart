import 'package:flutter/material.dart';
import 'package:online_market/utils/screen_size.dart';
import 'package:online_market/widgets/text_widgets/middle_text_widget.dart';

class ClosesCategoryWidget extends StatelessWidget {
  final String categoryName;
  const ClosesCategoryWidget({
    super.key,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: ScreenUtil.screenWidth(context),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              child: Center(child: MiddleTextWidget(widgetText: categoryName))),
          const Expanded(child: Icon(Icons.chevron_right_rounded)),
          Container(
            padding: const EdgeInsets.all(60.0),
            margin: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/product_photo/nike001.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
          ),
        ],
      ),
    );
  }
}
