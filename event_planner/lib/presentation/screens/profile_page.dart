import 'package:event_planner/common/app_colors.dart';
import 'package:event_planner/common/app_strings.dart';
import 'package:event_planner/common/app_text_styles.dart';
import 'package:event_planner/presentation/widgets/buttons/action_button_widget.dart';
import 'package:event_planner/presentation/widgets/buttons/secondory_action_button_widget.dart';
import 'package:event_planner/presentation/widgets/texts/form_input_widget.dart';
import 'package:event_planner/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.network(
              'https://s3-alpha-sig.figma.com/img/8897/6562/e86c53f43befd13de32083f9f60e71d7?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=FYazrcofYqtBYD-XRsKP0NFAuf7Isi1odYCNcUghq3joce~k8SFHFy69jUSNInVfXVg1C3eJ8XIU95Ioml7tkze9Kmb7lvS~dJL-fUNT4C612-SRLke~YoCrO58aIRN6LYzTrW-cTVz5cggvcOrS8RIyrobiALgiJz9pPIltRnYzeczMWAOSaRz9v8iLUrb1KzUjzW~-6kPhviM2ok7Ow1MaVb2zq4CW5YdYfJYG0wF9O0UIAVKKg9Rr-h77lFIgbG-Vi5pWJjRWRzddJLAurSUbFIZ3vzQVLDYHqXiXJudHO8GTWzRJcN7SNqfu4CcZHJdYHKpaXFyNhgGrA6kh9g__', // path to your image
              fit: BoxFit.cover,
              height: 40,
              width: 40,
            ),
          ),
        ),
        title: Text(AppStrings.profile, style: AppStyling.w600size17),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                SizedBox(height: 24.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Container(
                        height: 116.w,
                        width: 116.w,
                        child: Image.network(
                          'https://s3-alpha-sig.figma.com/img/3191/d34b/ad35bdf31bc30d76c19b6f08deb4c15a?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=LBWrv2NdTfrc0J4HfcZsDq8GdAkRksWKcUyvd-WcvDHQ0YadOd75ZE4ggEDmSEwFJoGPSmxIglEW7JkaIIi1Xa6esCxArIaxWAfULIFAonlN6IIV3rgczLOXs8xnGEKonWGRd~3xPFdtqLD69miAOw6p~x4L3beD9uKvvSNaQM0KDgl3QvLjgDx21DJq3CHBMjwTeCefoMvNydSe6erI9X3C4i-9Kw8ITyN3ind~ENerw7Wvh8D1bc4SaIGfUov2YGd5cMUtxd9~DyQSRJ-YBh4fGozNrMfiLv8Sf38YkiqTCwRwqG75q3goSR7kFezB-AMTkJQZMJDsJvswWE95Ow__', // path to your image
                          fit: BoxFit.cover,
                          height: 116.w,
                          width: 116.w,
                        ),
                      ),
                    ),
                  ],
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
                        child: ActionButtonWidget(
                      icon: null,
                      label: AppStrings.edit,
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.editProfile);
                      },
                    )),
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
