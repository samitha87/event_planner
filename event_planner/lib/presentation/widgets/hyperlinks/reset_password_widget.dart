import 'package:event_planner/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ResetPasswordWidget extends StatelessWidget {
  const ResetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          foregroundColor: Color(AppColors.primary),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Restore password',
              style: TextStyle(color: Color(AppColors.primary)),
            ),
            const SizedBox(width: 4),
            SvgPicture.asset(
              'assets/icons/svg/arrow_exit.svg',
              width: 16,
              height: 16,
              color: Color(AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}
