import 'package:flutter/material.dart';

void showTaskDialog(BuildContext context, StatefulWidget dialog) {
  showDialog(
    context: context,
    builder: (context) {
      return dialog;
    },
  );
}
