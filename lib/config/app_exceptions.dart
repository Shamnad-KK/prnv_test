import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';

import '../helper/app_colors.dart';
import '../utils/app_popups.dart';

class AppExceptions {
  static void handleError(Object exception) {
    if (exception is SocketException) {
      AppPopUps.showToast("Please check your connection", AppColors.errorColor);
      return;
    }
    if (exception is TimeoutException) {
      AppPopUps.showToast("Time out", AppColors.errorColor);
      return;
    } else if (exception is PlatformException) {
      AppPopUps.showToast(exception.message.toString(), AppColors.errorColor);
      return;
    } else {
      log('other exception');
      AppPopUps.showToast(exception.toString(), AppColors.errorColor);
      log(exception.toString());
      return;
    }
  }
}
