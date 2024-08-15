import 'package:flutter/material.dart';

class LargeTextWidget extends StatelessWidget {
  final String widgetText;
  const LargeTextWidget({
    required this.widgetText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      widgetText,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
