import 'package:event_planner/common/app_text_styles.dart';
import 'package:flutter/material.dart';

class EmailInputWidget extends StatefulWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;

  const EmailInputWidget({super.key, required this.hintText, required this.labelText, required this.controller});

  @override
  State<EmailInputWidget> createState() => _EmailInputWidgetState();
}

class _EmailInputWidgetState extends State<EmailInputWidget> {
  final inputDecoration = InputDecoration(
    filled: true,
    fillColor: const Color(0xFFFDF5F2),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText, style: AppStyling.w500size13),
        const SizedBox(height: 8),
        TextField(
          controller: widget.controller,
          decoration: inputDecoration.copyWith(
            prefixIcon: const Icon(Icons.email_outlined),
            hintText: widget.hintText,
          ),
        ),
      ],
    );
  }
}
