import 'package:flutter/material.dart';
import '../models/data_layer.dart';
import '../provider/plan_provider.dart';

class PlanScreen extends StatefulWidget {
  final Plan plan;
  const PlanScreen({super.key, required this.plan});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  late ScrollController scrollController;
  Plan get plan => widget.plan;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<Plan>> plansNotifier = PlanProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(plan.name)),
      body: ValueListenableBuilder<List<Plan>>(
        valueListenable: plansNotifier,
        builder: (context, plans, child) {
          final currentPlan = plans.firstWhere(
            (p) => p.name == plan.name,
            orElse: () => plan,
          );

          return Column(
            children: [
              Expanded(child: _buildList(currentPlan)),
              SafeArea(child: Text(currentPlan.completenessMessage)),
            ],
          );
        },
      ),
      floatingActionButton: _buildAddTaskButton(context),
    );
  }

  Widget _buildAddTaskButton(BuildContext context) {
    ValueNotifier<List<Plan>> plansNotifier = PlanProvider.of(context);

    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        final List<Plan> updatedPlans = List.from(plansNotifier.value);
        final int planIndex = updatedPlans.indexWhere(
          (p) => p.name == plan.name,
        );

        if (planIndex != -1) {
          updatedPlans[planIndex] = Plan(
            name: updatedPlans[planIndex].name,
            tasks: [
              ...updatedPlans[planIndex].tasks,
              Task(name: 'New Task', description: '', complete: false),
            ],
          );

          plansNotifier.value = updatedPlans;
        }
      },
    );
  }

  Widget _buildList(Plan plan) {
    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) => _buildTaskTile(plan, index, context),
    );
  }

  Widget _buildTaskTile(Plan plan, int index, BuildContext context) {
    ValueNotifier<List<Plan>> plansNotifier = PlanProvider.of(context);
    final task = plan.tasks[index];

    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          final List<Plan> updatedPlans = List.from(plansNotifier.value);
          final int planIndex = updatedPlans.indexWhere(
            (p) => p.name == plan.name,
          );

          if (planIndex != -1) {
            List<Task> updatedTasks = List.from(updatedPlans[planIndex].tasks);
            updatedTasks[index] = Task(
              name: task.name,
              description: task.description,
              complete: selected ?? false,
            );

            updatedPlans[planIndex] = Plan(
              name: updatedPlans[planIndex].name,
              tasks: updatedTasks,
            );

            plansNotifier.value = updatedPlans;
          }
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          final List<Plan> updatedPlans = List.from(plansNotifier.value);
          final int planIndex = updatedPlans.indexWhere(
            (p) => p.name == plan.name,
          );

          if (planIndex != -1) {
            List<Task> updatedTasks = List.from(updatedPlans[planIndex].tasks);
            updatedTasks[index] = Task(
              name: task.name,
              description: text,
              complete: task.complete,
            );

            updatedPlans[planIndex] = Plan(
              name: updatedPlans[planIndex].name,
              tasks: updatedTasks,
            );

            plansNotifier.value = updatedPlans;
          }
        },
      ),
    );
  }
}