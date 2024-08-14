import 'package:flutter/material.dart';
import 'package:online_market/widgets/text_widgets/middle_text_widget.dart';

class SeeAllBrendsWindget extends StatefulWidget {
  const SeeAllBrendsWindget({super.key});

  @override
  State<SeeAllBrendsWindget> createState() => _SeeAllBrendsWindgetState();
}

class _SeeAllBrendsWindgetState extends State<SeeAllBrendsWindget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
        child: Stack(
          children: [
            Positioned(
              child: Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.keyboard_arrow_left_rounded),
                        ),
                      ),
                      const MiddleTextWidget(widgetText: 'All Brends'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
