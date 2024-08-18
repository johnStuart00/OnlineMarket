import 'package:flutter/material.dart';
import 'package:online_market/widgets/text_widgets/middle_text_widget.dart';

class UserPageWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const UserPageWidget({
    required this.icon,
    required this.label,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 110,
            height: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(
                icon,
                size: 40,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: MiddleTextWidget(
              widgetText: label,
            ),
          )
        ],
      ),
    );
  }
}
