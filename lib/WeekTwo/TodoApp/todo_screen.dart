import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship_tasks/WeekTwo/TodoApp/Controller/todo_controller.dart';
class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TodoController todoController = Get.put(TodoController());
  final TextEditingController inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("To-Do List App ",style: TextStyle(
          color: Colors.white
        ),),
         flexibleSpace: ClipRRect(
    borderRadius: const BorderRadius.only(
      bottomLeft: Radius.circular(25),
      bottomRight: Radius.circular(25),
    ),
    child: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.indigo,
            Colors.purple, Colors.indigo],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    ),
         ),
      ),

      //   backgroundColor: const Color.fromARGB(255, 58, 46, 168),
      // ),
      body: Column(
        children: [
    
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: inputController,
                    decoration: const InputDecoration(
                      labelText: "Enter a Task",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    todoController.addTask(inputController.text);
                    inputController.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 1, 42, 24),
                  ),
                  child: const Text("Add",style: TextStyle(
          color: Colors.white
        ),),
                ),
              ],
            ),
          ),

          // Task List
          Expanded(
            child: Obx(() {
              return todoController.tasks.isEmpty
                  ? const Center(child: Text("No tasks yet"))
                  : ListView.builder(
                      itemCount: todoController.tasks.length,
                      itemBuilder: (context, index) {
                        return Card(
                          //color: const Color.fromARGB(255, 151, 203, 228),
                          shape: Border.all(color: Colors.teal,width: 3.0),                                                                  
                          elevation: 2.0,
                          margin:EdgeInsets.all(15.0),
                          
                          child: ListTile(
                            title: Text(todoController.tasks[index]),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => todoController.removeTask(index),
                            ),
                          ),
                        );
                      },
                    );
            }),
          ),
        ],
      ),
    );
  }
}