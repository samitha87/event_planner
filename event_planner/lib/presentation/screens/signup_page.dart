import 'package:event_planner/common/app_colors.dart';
import 'package:event_planner/common/app_strings.dart';
import 'package:event_planner/common/app_text_styles.dart';
import 'package:event_planner/presentation/widgets/buttons/action_button_widget.dart';
import 'package:event_planner/presentation/widgets/hyperlinks/reset_password_widget.dart';
import 'package:event_planner/presentation/widgets/texts/email_input_widget.dart';
import 'package:event_planner/presentation/widgets/texts/password_input_widget.dart';
import 'package:event_planner/utils/app_routes.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60),
              Center(
                child: Column(
                  children: [
                    Text(
                      AppStrings.welcome,
                      style: AppStyling.w600size32,
                    ),
                    SizedBox(height: 8),
                    Text(
                      AppStrings.welcomeToYourPortal,
                      style: AppStyling.w400size14.copyWith(color: Color(AppColors.fontGrey)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const EmailInputWidget(hintText: AppStrings.emailHint, labelText: AppStrings.email),
              const SizedBox(height: 24),
              const PasswordInputWidget(hintText: AppStrings.passwordHint, labelText: AppStrings.password),
              const SizedBox(height: 24),
              const PasswordInputWidget(hintText: AppStrings.passwordHint, labelText: AppStrings.confirmPassword),
              const SizedBox(height: 12),
              const Spacer(),
              ActionButtonWidget(
                onPressed: () {},
                icon: 'assets/icons/svg/arrow_next.svg',
                label: AppStrings.signUp,
              ),
              const SizedBox(height: 12),
              ActionButtonWidget(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.login);
                },
                icon: 'assets/icons/svg/arrow_next.svg',
                label: AppStrings.login,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
