import 'package:flutter/material.dart';

import '../constants/app_number_constants.dart';

class AppDecoration {
  InputDecoration inputDecoration(BuildContext context) => InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppNumberConstants.longTileRadius,
          ),
        ),
        fillColor: Theme.of(context).colorScheme.onPrimary,
        filled: true,
      );
}
