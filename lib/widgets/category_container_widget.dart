import 'package:flutter/material.dart';
import 'package:online_market/utils/screen_size.dart';

class CategoryWidget extends StatefulWidget {
  final String categoryName;

  const CategoryWidget({
    required this.categoryName,
    super.key,
  });

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  bool isSelected = false;

  void _toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSelection,
      child: Container(
        width: ScreenUtil.setWidth(context, 0.2), // 20% of the screen
        height: ScreenUtil.setHeight(context, 0.2), // 20% of the screen
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            widget.categoryName,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
