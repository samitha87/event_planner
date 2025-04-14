import 'dart:io';

import 'package:event_planner/common/app_colors.dart';
import 'package:event_planner/common/app_strings.dart';
import 'package:event_planner/common/app_text_styles.dart';
import 'package:event_planner/core/local_preferences.dart';
import 'package:event_planner/domain/services/user_service.dart';
import 'package:event_planner/presentation/widgets/buttons/action_button_widget.dart';
import 'package:event_planner/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class SetupProfileImagePage extends StatefulWidget {
  const SetupProfileImagePage({super.key});

  @override
  State<SetupProfileImagePage> createState() => _SetupProfileImagePageState();
}

class _SetupProfileImagePageState extends State<SetupProfileImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: 6,
          child: Stack(
            children: [
              Center(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.welcome,
                        style: AppStyling.w600size32,
                      ),
                      SizedBox(height: 8),
                      Text(
                        AppStrings.setupProfileImage,
                        textAlign: TextAlign.center,
                        style: AppStyling.w400size14.copyWith(color: Color(AppColors.fontGrey)),
                      ),
                      SizedBox(height: 32.sp),
                      GestureDetector(
                        onTap: () async {
                          try {
                            final profileImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                            if (profileImage != null) {
                              final url = await UserService().uploadProfileImage(File(profileImage.path), context);

                              if (url != null) {
                                // print(url);
                                LocalPreferences.instance.setIsLoggedIn('1');
                                Navigator.pushNamed(context, Routes.personalInfo);
                              }
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
                        child: Container(
                          width: 100.sp,
                          height: 100.sp,
                          decoration: BoxDecoration(
                            color: Color(AppColors.profileImageBackground),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/svg/photo-camera.svg',
                              width: 24.sp,
                              height: 24.sp,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
            flex: 1,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 16.sp,
                  right: 16.sp,
                  child: ActionButtonWidget(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.personalInfo);
                    },
                    icon: 'assets/icons/svg/arrow_next.svg',
                    label: 'Next',
                  ),
                ),
              ],
            )),
      ],
    ));
  }
}
