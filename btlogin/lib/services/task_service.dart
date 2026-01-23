import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task_model.dart';

class TaskService {
  static const baseUrl = 'https://amock.io/api/researchUTH';

  static bool forceEmpty = false;

  static Future<List<Task>> getTasks() async {
    final res = await http.get(Uri.parse('$baseUrl/tasks'));
    final body = json.decode(res.body);

    if (forceEmpty) {
      return [];
    }

    return (body['data'] as List)
        .map((e) => Task.fromJson(e))
        .toList();
  }

  static Future<Task> getTaskDetail(int id) async {
  final res = await http.get(Uri.parse('$baseUrl/task/$id'));

  if (res.statusCode == 200) {
    final body = json.decode(res.body);
    return Task.fromJson(body['data']);
  }

  // 👉 QUAN TRỌNG
  if (res.statusCode == 404) {
    throw Exception('NOT_FOUND');
  }

  throw Exception('FAILED');
}


  static Future<void> deleteTask(int id) async {
    await http.delete(Uri.parse('$baseUrl/task/$id'));
  }
}
