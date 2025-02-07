import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

// ignore: non_constant_identifier_names
void CustomErrorWidget(BuildContext context) {
  QuickAlert.show(
      text: "Please enter all the fields correctly",
      context: context,
      type: QuickAlertType.error);
}
