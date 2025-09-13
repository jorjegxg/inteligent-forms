import 'package:flutter/material.dart';

import 'my_slidable_action.dart';

class MyDeleteSlidable extends StatelessWidget {
  const MyDeleteSlidable({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MySlidableAction(
      onPressed: onPressed,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      foregroundColor: Theme.of(context).colorScheme.onSecondary,
      icon: Icons.delete,
    );
  }
}
