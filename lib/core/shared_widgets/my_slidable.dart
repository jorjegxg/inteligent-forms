import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class MySlidable extends StatelessWidget {
  const MySlidable({
    super.key,
    required this.actions,
    required this.child,
  });

  final List<Widget> actions;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: .25,
        motion: const DrawerMotion(),
        children: actions,
      ),
      child: child,
    );
  }
}
