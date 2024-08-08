import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      style: GoogleFonts.jost(
          textStyle: const TextStyle(
              color: Color.fromARGB(221, 10, 10, 10),
              fontSize: 16.0,
              fontWeight: FontWeight.normal)),
    );
  }
}
