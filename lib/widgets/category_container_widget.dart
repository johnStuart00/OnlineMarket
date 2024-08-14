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
      //onTap: _toggleSelection,
      child: Container(
        width: ScreenUtil.setWidth(context, 0.2),
        height: ScreenUtil.setHeight(context, 0.2),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(10),
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
