import 'package:event_planner/common/app_colors.dart';
import 'package:event_planner/common/app_strings.dart';
import 'package:event_planner/common/app_text_styles.dart';
import 'package:event_planner/data/models/user_data_model.dart';
import 'package:event_planner/domain/services/user_service.dart';
import 'package:event_planner/presentation/widgets/buttons/action_button_widget.dart';
import 'package:event_planner/presentation/widgets/buttons/secondory_action_button_widget.dart';
import 'package:event_planner/presentation/widgets/texts/form_input_widget.dart';
import 'package:event_planner/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      UserDataModel userData = UserDataModel(
        fname: _firstNameController.text,
        lname: _lastNameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        address: _addressController.text,
      );

      UserService().updateUserInfo(userData, context);
      Navigator.pushNamed(context, Routes.landing);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Text(
                  AppStrings.personalInfo,
                  style: AppStyling.w600size19,
                ),
                SizedBox(height: 8),
                Text(
                  AppStrings.personalInfoDescription,
                  style: AppStyling.w400size14.copyWith(color: Color(AppColors.fontGrey)),
                ),
                SizedBox(height: 24.sp),
                FormInputWidget(
                  label: AppStrings.firstName,
                  controller: _firstNameController,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                ),
                SizedBox(height: 24.sp),
                FormInputWidget(
                  label: AppStrings.lastName,
                  controller: _lastNameController,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                ),
                SizedBox(height: 24.sp),
                FormInputWidget(
                  label: AppStrings.email,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  maxLines: 1,
                ),
                SizedBox(height: 24.sp),
                FormInputWidget(
                  label: AppStrings.phone,
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  maxLines: 1,
                ),
                SizedBox(height: 24.sp),
                FormInputWidget(
                  label: AppStrings.address,
                  controller: _addressController,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                ),
                SizedBox(height: 24.sp),
                Row(
                  children: [
                    Expanded(
                      child: SecondaryActionButtonWidget(
                        icon: 'assets/icons/svg/arrow_back.svg',
                        label: AppStrings.back,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(width: 16.sp),
                    Expanded(
                      child: ActionButtonWidget(
                        icon: 'assets/icons/svg/arrow_next.svg',
                        label: AppStrings.next,
                        onPressed: _handleSubmit,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
