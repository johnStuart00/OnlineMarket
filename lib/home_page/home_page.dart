import 'package:flutter/material.dart';
import 'package:online_market/widgets/brend_container_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<String> brendImagePaths = [
    'assets/brend_photo/boss.png',
    'assets/brend_photo/boss.png',
    'assets/brend_photo/boss.png',
    // Add more paths as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Text('Explore'),
          const SizedBox(height: 10),
          const Text('Select Category'),
          const SizedBox(height: 5),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: brendImagePaths.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 5.0,
                  ),
                  child: BrendWidget(
                    brendImage: Image.asset(brendImagePaths[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
