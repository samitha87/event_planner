import 'package:event_planner/common/app_colors.dart';
import 'package:event_planner/common/app_strings.dart';
import 'package:event_planner/common/app_text_styles.dart';
import 'package:event_planner/core/local_preferences.dart';
import 'package:event_planner/data/models/user_data_model.dart';
import 'package:event_planner/domain/services/auth_service.dart';
import 'package:event_planner/domain/services/push_notification_service.dart';
import 'package:event_planner/presentation/state/auth_provider.dart';
import 'package:event_planner/presentation/widgets/buttons/action_button_widget.dart';
import 'package:event_planner/presentation/widgets/hyperlinks/reset_password_widget.dart';
import 'package:event_planner/presentation/widgets/texts/email_input_widget.dart';
import 'package:event_planner/presentation/widgets/texts/password_input_widget.dart';
import 'package:event_planner/utils/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;
  final _formKey = GlobalKey<FormState>();

  final AuthService _authService = AuthService();
  late AuthenticationProvider _authProvider;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _authProvider = Provider.of<AuthenticationProvider>(context, listen: false);
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState?.validate() ?? false) {
      UserDataModel userDataModel = UserDataModel(
        email: _emailController.text,
        password: _passwordController.text,
      );
      User? user = await _authService.signInWithEmailAndPassword(userDataModel);
      _authProvider.setCredential(user);
      if (user != null) {
        if (LocalPreferences.instance.getIsLoggedIn() == '1') {
          Navigator.pushNamed(context, Routes.landing);
        } else {
          Navigator.pushNamed(context, Routes.setupProfileImage);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
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
                EmailInputWidget(
                  hintText: AppStrings.emailHint,
                  labelText: AppStrings.email,
                  controller: _emailController,
                ),
                const SizedBox(height: 24),
                PasswordInputWidget(
                  hintText: AppStrings.passwordHint,
                  labelText: AppStrings.password,
                  controller: _passwordController,
                ),
                const SizedBox(height: 12),
                const ResetPasswordWidget(),
                const Spacer(),
                ActionButtonWidget(
                  onPressed: _handleLogin,
                  icon: 'assets/icons/svg/arrow_next.svg',
                  label: AppStrings.login,
                ),
                const SizedBox(height: 12),
                ActionButtonWidget(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.signUp);
                  },
                  icon: 'assets/icons/svg/arrow_next.svg',
                  label: AppStrings.signUp,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
