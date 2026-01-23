import 'package:flutter/material.dart';
import '../services/task_service.dart';
import '../models/task_model.dart';
import '../widgets/task_card.dart';
import '../widgets/empty_view.dart';
import 'task_detail_screen.dart';

class TaskListScreen extends StatefulWidget {
  // const TaskListScreen({super.key});

  final VoidCallback? onLoaded;

  const TaskListScreen({
    super.key,
    this.onLoaded,
  });

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  late Future<List<Task>> future;

  @override
  void initState() {
    super.initState();
    future = TaskService.getTasks();
  }

@override
Widget build(BuildContext context) {
  return FutureBuilder<List<Task>>(
    future: future,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }

      if (!snapshot.hasData || snapshot.data!.isEmpty) {
        return const EmptyView();
      }

      // BÁO VỀ HOME SCREEN
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onLoaded?.call();
      });

      return ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (_, i) {
          final task = snapshot.data![i];
          return TaskCard(
            task: task,
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TaskDetailScreen(taskId: task.id),
                ),
              );
              setState(() {
                future = TaskService.getTasks();
              });
            },
          );
        },
      );
    },
  );
}

}
