import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

sealed class MessagesHelper {
  static void showError(String message, BuildContext context) {
    showTopSnackBar(
        snackBarPosition: SnackBarPosition.bottom,
        displayDuration: const Duration(milliseconds: 500),
        animationDuration: const Duration(milliseconds: 500),
        Overlay.of(context),
        CustomSnackBar.error(message: message));
  }

  static void showInfor(String message, BuildContext context) {
    showTopSnackBar(
        snackBarPosition: SnackBarPosition.bottom,
        displayDuration: const Duration(milliseconds: 500),
        animationDuration: const Duration(milliseconds: 500),
        Overlay.of(context),
        CustomSnackBar.info(message: message));
  }

  static void showSuccess(String message, BuildContext context) {
    showTopSnackBar(
        snackBarPosition: SnackBarPosition.bottom,
        displayDuration: const Duration(milliseconds: 500),
        animationDuration: const Duration(milliseconds: 500),
        Overlay.of(context),
        CustomSnackBar.success(message: message));
  }
}
