import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planner/data/models/user_data_model.dart';
import 'package:event_planner/domain/use_cases/user_cases.dart';
import 'package:event_planner/presentation/state/auth_provider.dart';
import 'package:event_planner/utils/app_routes.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserService extends UserCases {
  AuthenticationProvider _authProvider = AuthenticationProvider();
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Future<String?> uploadProfileImage(File? image, BuildContext context) async {
    try {
      AuthenticationProvider _authProvider = Provider.of<AuthenticationProvider>(context, listen: false);
      String uid = _authProvider.credential!.uid;

      if (image != null) {
        final ref = storage.ref().child('profile_images').child('$uid.jpg');
        await ref.putFile(image);
        final url = await ref.getDownloadURL();
        await firestore.collection('users').doc(uid).update({'profileImage': url});
        return url;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateUserInfo(UserDataModel userData, BuildContext context) async {
    try {
      AuthenticationProvider _authProvider = Provider.of<AuthenticationProvider>(context, listen: false);
      String uid = _authProvider.credential!.uid;

      await firestore.collection('users').doc(uid).set({
        'uid': uid,
        'email': userData.email,
        'fname': userData.fname,
        'lname': userData.lname,
        'phone': userData.phone,
        'address': userData.address,
        'profileImage': userData.profileImage,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      rethrow;
    }
  }
}
