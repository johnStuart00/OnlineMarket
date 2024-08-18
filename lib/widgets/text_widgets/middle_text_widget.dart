import 'package:flutter/material.dart';

class MiddleTextWidget extends StatelessWidget {
  final String widgetText;
  const MiddleTextWidget({
    required this.widgetText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      widgetText,
      style: Theme.of(context).textTheme.bodyMedium,
      overflow: TextOverflow.ellipsis,
    );
  }
}
