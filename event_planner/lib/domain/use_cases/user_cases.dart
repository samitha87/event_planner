import 'dart:io';

import 'package:event_planner/data/models/user_data_model.dart';
import 'package:flutter/material.dart';

abstract class UserCases {
  Future<String?> uploadProfileImage(File? path, BuildContext context);
  Future<void> updateUserInfo(UserDataModel userData, BuildContext context);
}
