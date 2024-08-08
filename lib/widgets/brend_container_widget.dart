import 'package:flutter/material.dart';
import 'package:online_market/utils/screen_size.dart';

class BrendWidget extends StatelessWidget {
  final Image brendImage;
  const BrendWidget({
    required this.brendImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: ScreenUtil.setWidth(context, 0.2), //20% of the screen
        height: ScreenUtil.setHeight(context, 0.2), // 20% of the screen
        padding: const EdgeInsets.only(right: 10.0, left: 10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(2, 2),
              ),
            ]),
        child: brendImage,
      ),
    );
  }
}
