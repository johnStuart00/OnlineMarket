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
        width: ScreenUtil.setWidth(context, 0.2),
        padding: const EdgeInsets.only(right: 10.0, left: 10.0),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: brendImage,
      ),
    );
  }
}
