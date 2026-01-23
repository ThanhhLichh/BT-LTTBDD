import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../services/task_service.dart';

class TaskDetailScreen extends StatelessWidget {
  final int taskId;
  const TaskDetailScreen({super.key, required this.taskId});



  IconData reminderIcon(String type) {
    switch (type) {
      case 'Email':
        return Icons.email;
      case 'Notification':
        return Icons.notifications;
      default:
        return Icons.alarm;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.blue),
        title: const Text(
          'Detail',
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () async {
              await TaskService.deleteTask(taskId);

              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Delete successfully'),
                    backgroundColor: Colors.green,
                  ),
                );

                Navigator.pop(context);
              }
            },
          )
        ],
      ),
      body: FutureBuilder<Task>(
        future: TaskService.getTaskDetail(taskId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Task not found',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          final task = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TITLE
                Text(
                  task.title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),

                // DESCRIPTION
                Text(task.description),
                const SizedBox(height: 16),

                // CATEGORY - STATUS - PRIORITY (ONE COLORED BAR)
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.pink.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _infoItem(
                        icon: Icons.grid_view,
                        label: 'Category',
                        value: task.category,
                      ),
                      _infoItem(
                        icon: Icons.checklist,
                        label: 'Status',
                        value: task.status,
                      ),
                      _infoItem(
                        icon: Icons.star,
                        label: 'Priority',
                        value: task.priority,
                      ),
                    ],
                  ),
                ),


                const SizedBox(height: 24),

                // SUBTASKS
                const Text(
                  'Subtasks',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ...task.subtasks.map(
                  (s) => CheckboxListTile(
                    value: s['isCompleted'],
                    onChanged: (_) {},
                    title: Text(s['title']),
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ),

                const SizedBox(height: 16),

                // ATTACHMENTS
                const Text(
                  'Attachments',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ...task.attachments.map(
                  (a) => ListTile(
                    leading: const Icon(Icons.attach_file),
                    title: Text(a['fileName']),
                  ),
                ),

                const SizedBox(height: 16),

                // REMINDERS
                const Text(
                  'Reminders',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ...task.reminders.map(
                  (r) => ListTile(
                    leading: Icon(reminderIcon(r['type'])),
                    title: Text(r['type']),
                    subtitle: Text(r['time']),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _infoBox({
    required String label,
    required String value,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

Widget _infoItem({
  required IconData icon,
  required String label,
  required String value,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      // ICON BÊN TRÁI (CAO BẰNG 2 DÒNG CHỮ)
      SizedBox(
        height: 40, // 👈 QUAN TRỌNG: chiều cao gần bằng 2 dòng text
        child: Center(
          child: Icon(
            icon,
            size: 26, // 👈 icon to hơn
            color: Colors.black87,
          ),
        ),
      ),

      const SizedBox(width: 6),

      // TEXT BÊN PHẢI
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ],
  );
}





}


