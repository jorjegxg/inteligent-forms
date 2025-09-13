import 'package:flutter/material.dart';
import 'package:inteligent_forms/core/constants/string_constants.dart';

Future<void> showMyDialog(
  BuildContext context, {
  required String title,
  required String content,
  required VoidCallback onPressed,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(content),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(AppStringConstants.cancel),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            onPressed: () {
              onPressed();
              Navigator.of(context).pop();
            },
            child: const Text(AppStringConstants.yes),
          ),
        ],
      );
    },
  );
}
