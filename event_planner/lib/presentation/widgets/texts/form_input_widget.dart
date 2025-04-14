import 'package:event_planner/common/app_strings.dart';
import 'package:flutter/material.dart';

class FormInputWidget extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int maxLines;
  final String? Function(String?)? validator;

  const FormInputWidget({
    super.key,
    required this.label,
    required this.controller,
    required this.keyboardType,
    required this.maxLines,
    this.validator,
  });

  @override
  State<FormInputWidget> createState() => _FormInputWidgetState();
}

class _FormInputWidgetState extends State<FormInputWidget> {
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter ${widget.label}';
    }
    if (value.length < 3) {
      return '${widget.label} must be at least 3 characters long';
    }
    if (value.length > 10) {
      return '${widget.label} must not exceed 10 characters';
    }
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return '${widget.label} must contain only alphabetic characters';
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter ${widget.label}';
    }

    // Remove any spaces, dashes, or other non-digit characters
    String cleanNumber = value.replaceAll(RegExp(r'[^\d+]'), '');

    // Check for Sri Lankan mobile number (07XXXXXXXX)
    if (RegExp(r'^07\d{8}$').hasMatch(cleanNumber)) {
      return null;
    }

    // Check for Sri Lankan landline (0XX-XXXXXXX)
    if (RegExp(r'^0\d{9}$').hasMatch(cleanNumber)) {
      return null;
    }

    // Check for international format (+94XXXXXXXXX)
    if (RegExp(r'^\+94\d{9}$').hasMatch(cleanNumber)) {
      return null;
    }

    return 'Please enter a valid Sri Lankan phone number (e.g., 07XXXXXXXX, 0XX-XXXXXXX, or +94XXXXXXXXX)';
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter ${widget.label}';
    }

    // Email validation regex
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  String? _validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter ${widget.label}';
    }
    if (value.length < 6) {
      return '${widget.label} must be at least 6 characters long';
    }
    if (value.length > 50) {
      return '${widget.label} must not exceed 50 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF9F0ED),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
          validator: widget.validator ??
              (widget.label == AppStrings.firstName || widget.label == AppStrings.lastName
                  ? _validateName
                  : widget.label == AppStrings.phone
                      ? _validatePhoneNumber
                      : widget.label == AppStrings.email
                          ? _validateEmail
                          : widget.label == AppStrings.address
                              ? _validateAddress
                              : null),
        ),
      ],
    );
  }
}
