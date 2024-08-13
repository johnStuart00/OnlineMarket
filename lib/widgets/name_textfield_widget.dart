import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class NameTextField extends StatefulWidget {
  const NameTextField({
    super.key,
    required this.textFieldNameController,
  });

  final TextEditingController textFieldNameController;

  @override
  State<NameTextField> createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> {
  void textFieldClear() {
    widget.textFieldNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        controller: widget.textFieldNameController,
        keyboardType: TextInputType.text,
        inputFormatters: [
          LengthLimitingTextInputFormatter(50),
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9\s]')),
        ],
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          suffix: GestureDetector(
            onTap: textFieldClear,
            child: const Icon(Icons.clear_rounded),
          ),
        ),
      ),
    );
  }
}
