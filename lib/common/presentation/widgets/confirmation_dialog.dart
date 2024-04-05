import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';

class ConfirmationDialog {
  static void showDialog({
    required BuildContext context,
    required String msg,
    required String title,
    void Function()? onConfirm,
    void Function()? onCancel,
  }) {
    Dialogs.bottomMaterialDialog(
        msg: msg,
        title: title,
        context: context,
        actions: [
          IconsButton(
            onPressed: () {
              context.pop();
              onCancel?.call();
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            text: 'Cancel',
            color: ColorPalette.secondaryAccentColor,
            textStyle: TextStyle(color: ColorPalette.primaryButtonTextColor),
            iconColor: ColorPalette.primaryButtonTextColor,
          ),
          IconsButton(
            onPressed: () {
              context.pop();
              onConfirm?.call();
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            text: 'Confirm',
            color: ColorPalette.primaryColor,
            textStyle: const TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ]);
  }
}
