import 'package:event_planner/presentation/screens/landing_page.dart';
import 'package:event_planner/presentation/screens/launch_page.dart';
import 'package:event_planner/presentation/screens/login_page.dart';
import 'package:event_planner/presentation/screens/personal_info_screen.dart';
import 'package:event_planner/presentation/screens/setup_profile_image_page.dart';
import 'package:event_planner/presentation/screens/signup_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String launch = '/launch';
  static const String login = '/login';
  static const String signUp = '/signup';
  static const String setupProfileImage = '/setupProfileImage';
  static const String personalInfo = '/personalInfo';
  static const String landing = '/landing';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case launch:
        return MaterialPageRoute(builder: (context) => const LaunchPage());

      case login:
        return MaterialPageRoute(builder: (context) => const LoginPage());

      case signUp:
        return MaterialPageRoute(builder: (context) => const SignUpPage());

      case setupProfileImage:
        return MaterialPageRoute(builder: (context) => const SetupProfileImagePage());

      case personalInfo:
        return MaterialPageRoute(builder: (context) => const PersonalInfoScreen());

      case landing:
        return MaterialPageRoute(builder: (context) => const LandingPage());

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text('No route found')),
          ),
        );
    }
  }
}
