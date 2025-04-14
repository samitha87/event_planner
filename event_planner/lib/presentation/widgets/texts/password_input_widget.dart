import 'package:event_planner/common/app_text_styles.dart';
import 'package:flutter/material.dart';

class PasswordInputWidget extends StatefulWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;

  const PasswordInputWidget({super.key, required this.hintText, required this.labelText, required this.controller});

  @override
  State<PasswordInputWidget> createState() => _PasswordInputWidgetState();
}

class _PasswordInputWidgetState extends State<PasswordInputWidget> {
  bool _obscurePassword = true;

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
          obscureText: _obscurePassword,
          decoration: inputDecoration.copyWith(
            prefixIcon: const Icon(Icons.lock_outline),
            suffixIcon: IconButton(
              icon: Icon(_obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
