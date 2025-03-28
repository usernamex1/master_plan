import 'package:flutter/material.dart';
import '../models/data_layer.dart';

class PlanProvider extends InheritedWidget {
  final ValueNotifier<List<Plan>> plansNotifier;

  PlanProvider({
    super.key,
    required Widget child, required ValueNotifier<List<Plan>> notifier,
  })  : plansNotifier = ValueNotifier([]),
        super(child: child);

  static ValueNotifier<List<Plan>> of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<PlanProvider>();
    return provider!.plansNotifier;
  }

  @override
  bool updateShouldNotify(PlanProvider oldWidget) {
    return oldWidget.plansNotifier != plansNotifier;
  }
}