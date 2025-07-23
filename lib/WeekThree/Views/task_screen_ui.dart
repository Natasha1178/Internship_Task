import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:internship_tasks/WeekThree/Model/task_model.dart';
import 'package:internship_tasks/WeekThree/Views/task_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskScreenUi extends StatefulWidget {
  const TaskScreenUi({super.key});

  @override
  State<TaskScreenUi> createState() => _TaskScreenUiState();
}

class _TaskScreenUiState extends State<TaskScreenUi> {
  
  final TextEditingController controller = TextEditingController();
  List<TaskModel> tasks = [];
  final List<Color> cardColors = [
  const Color.fromARGB(255, 227, 155, 239),
  const Color.fromARGB(255, 101, 180, 244),
  const Color.fromARGB(255, 241, 187, 106),
  const Color.fromARGB(255, 223, 112, 149),
  const Color.fromARGB(255, 79, 188, 177),
  const Color.fromARGB(255, 230, 218, 89),
];

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  void loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString('tasks');
    if (data != null) {
      final decoded = jsonDecode(data);
      setState(() {
        tasks = List.from(decoded)
            .map((e) => TaskModel.fromJson(e))
            .toList();
      });
    }
  }

  void saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(tasks.map((e) => e.toJson()).toList());
    await prefs.setString('tasks', encoded);
  }

  void addTask(String title) {
    if (title.isEmpty) return;
    setState(() {
      tasks.add(TaskModel(title: title));
      controller.clear();
      saveTasks();
    });
  }

  void toggleTask(int index) {
    setState(() {
      tasks[index].isDone = !tasks[index].isDone;
      saveTasks();
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
      saveTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    double progress = tasks.isEmpty
        ? 0
        : tasks.where((t) => t.isDone).length / tasks.length;

    return Scaffold(
      backgroundColor: Color(0xFFF8F5FF),
      appBar: AppBar(
  backgroundColor: Colors.transparent,
  elevation: 0,
  toolbarHeight: 80,
  title: Row(
    children: [
      CircleAvatar(
        radius: 24,
        backgroundImage: AssetImage("assets/person.png"),
      ),
      SizedBox(width: 12),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Natasha',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            'From Hyderabad',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    ],
  ),
  actions: [
    Padding(
      padding: const EdgeInsets.only(right:17),
      child: Icon(Icons.notifications,size: 25,),
    )
  ],
),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress Card
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: [
                  Text('Keep Going!', style: TextStyle(color: Colors.white)),
                  SizedBox(height: 10),
                  Text("Your Progress, Today", style: TextStyle(color: Colors.white)),
                  SizedBox(height: 10,),
                  LinearProgressIndicator(
                    value: progress,
                    color: Colors.white,
                    backgroundColor: Colors.white24,
                  ),
                  SizedBox(height: 6),
                  Text('${(progress * 100).toInt()}% complete',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Enter a task...',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => addTask(controller.text),
                  child: Icon(Icons.add,color: Colors.white,),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(14),
                    backgroundColor: Colors.deepPurple,
                  ),
                )
              ],
            ),

            SizedBox(height: 20),
            Text("Today's Tasks",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
            fontSize: 18.0),),
            SizedBox(height: 20),
            // Task List
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, i) => TaskCard(
                  task: tasks[i],
                  onToggle: () => toggleTask(i),
                  onDelete: () => deleteTask(i),
                   color: cardColors[i % cardColors.length],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}