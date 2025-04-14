import 'package:event_planner/common/app_colors.dart';
import 'package:event_planner/common/app_strings.dart';
import 'package:event_planner/common/app_text_styles.dart';
import 'package:event_planner/data/models/user_data_model.dart';
import 'package:event_planner/domain/services/auth_service.dart';
import 'package:event_planner/presentation/widgets/buttons/action_button_widget.dart';
import 'package:event_planner/presentation/widgets/hyperlinks/reset_password_widget.dart';
import 'package:event_planner/presentation/widgets/texts/email_input_widget.dart';
import 'package:event_planner/presentation/widgets/texts/password_input_widget.dart';
import 'package:event_planner/utils/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

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
              EmailInputWidget(hintText: AppStrings.emailHint, labelText: AppStrings.email, controller: _emailController),
              const SizedBox(height: 24),
              PasswordInputWidget(hintText: AppStrings.passwordHint, labelText: AppStrings.password, controller: _passwordController),
              const SizedBox(height: 24),
              PasswordInputWidget(hintText: AppStrings.passwordHint, labelText: AppStrings.confirmPassword, controller: _confirmPasswordController),
              const SizedBox(height: 12),
              const Spacer(),
              ActionButtonWidget(
                onPressed: () async {
                  UserDataModel userData = UserDataModel(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );

                  User? user = await _authService.signUpWithEmailAndPassword(userData);
                  if (user != null) {
                    Navigator.pushNamed(context, Routes.login);
                  }
                },
                icon: 'assets/icons/svg/arrow_next.svg',
                label: AppStrings.signUp,
              ),
              const SizedBox(height: 12),
              ActionButtonWidget(
                onPressed: () async {
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
