import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoController extends GetxController{
   var tasks = <String>[].obs;

  @override
  void onInit() {
    loadTasks();
    super.onInit();
  }

  void addTask(String task) {
    if (task.trim().isEmpty) return;
    tasks.add(task);
    saveTasks();
  }

  void removeTask(int index) {
    tasks.removeAt(index);
    saveTasks();
  }

  Future<void> saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('tasks', jsonEncode(tasks));
  }

  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedTasks = prefs.getString('tasks');
    if (storedTasks != null) {
      tasks.value = List<String>.from(jsonDecode(storedTasks));
    }
  }
}
