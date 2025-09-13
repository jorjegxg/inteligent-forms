import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../domain/entities/field.dart';

class FieldCard extends StatelessWidget {
  const FieldCard({
    super.key,
    required this.field,
  });
  final Field field;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Theme.of(context).colorScheme.onPrimary,
      child: Padding(
        padding: EdgeInsets.all(2.w),
        child: Row(
          children: [
            const Icon(Icons.drag_handle),
            const SizedBox(
              width: 10,
            ),
            Text(field.label),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
