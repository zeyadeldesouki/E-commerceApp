import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

// ignore: non_constant_identifier_names
void CustomSuccessWidget(
    BuildContext context, void Function()? onConfirmBtnTap) {
  QuickAlert.show(
    context: context,
    type: QuickAlertType.success,
    onConfirmBtnTap: onConfirmBtnTap,
    showCancelBtn: true,
    cancelBtnText: "Cancel",
    onCancelBtnTap: () => GoRouter.of(context).pop(),
  );
}
