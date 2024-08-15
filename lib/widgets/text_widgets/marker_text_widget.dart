import 'package:flutter/material.dart';

class MarkerTextWidget extends StatelessWidget {
  final String widgetText;
  const MarkerTextWidget({
    required this.widgetText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      widgetText,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
