import 'dart:developer';

import 'package:hive_flutter/adapters.dart';

import '../config/app_exceptions.dart';
import '../core/strings.dart';
import '../helper/app_colors.dart';
import '../model/user_model.dart';
import '../utils/app_popups.dart';

class AuthDB {
  Future<bool> signUp(UserModel user) async {
    try {
      final userDB = await Hive.openBox<UserModel>(AppStrings.USER_DB);
      final exists = await userExist(user);
      if (exists != null) {
        AppPopUps.showToast(
            'User with this email already exists', AppColors.errorColor);
        return false;
      } else {
        AppPopUps.showToast('Signed up successfully', AppColors.successColor);
        userDB.add(user);
        log(userDB.values.toString());
        return true;
      }
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return false;
  }

  Future<UserModel?> userExist(UserModel model) async {
    try {
      final userDB = await Hive.openBox<UserModel>(AppStrings.USER_DB);
      List<UserModel> users = userDB.values.toList();
      for (var element in users) {
        if (element.email == model.email) {
          return element;
        }
      }
      return null;
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }

  Future<bool> login(UserModel user) async {
    try {
      final exists = await userExist(user);
      if (exists != null && exists.password == user.password) {
        AppPopUps.showToast('Signed in successfully', AppColors.successColor);
        return true;
      } else {
        AppPopUps.showToast('User not found', AppColors.errorColor);
        return false;
      }
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return false;
  }
}
