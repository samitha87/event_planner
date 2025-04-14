import 'package:event_planner/common/app_colors.dart';
import 'package:event_planner/common/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SecondaryActionButtonWidget extends StatefulWidget {
  const SecondaryActionButtonWidget({super.key, required this.onPressed, required this.icon, required this.label});

  final VoidCallback onPressed;
  final String icon;
  final String label;

  @override
  State<SecondaryActionButtonWidget> createState() => _SecondaryActionButtonWidgetState();
}

class _SecondaryActionButtonWidgetState extends State<SecondaryActionButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        width: double.infinity,
        height: 44.sp,
        decoration: BoxDecoration(
          color: Color(AppColors.secondaryButtonBackground).withOpacity(0.08),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              widget.icon,
              width: 20.sp,
              height: 20.sp,
              color: Color(AppColors.fontBlack),
            ),
            SizedBox(width: 8.sp),
            Text(
              widget.label,
              style: AppStyling.w600size14.copyWith(color: Color(AppColors.fontBlack)),
            ),
          ],
        ),
      ),
    );
  }
}
