
import 'package:flutter/material.dart';

class ConditionWidget extends StatelessWidget {
  final Widget child,conditionWidget;
  final bool condition;
  const ConditionWidget({Key? key, required this.child, required this.conditionWidget, required this.condition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(condition) return conditionWidget;
    return child;
  }
}
