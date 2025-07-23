import 'package:flutter/material.dart';
import 'package:internship_tasks/WeekThree/Model/task_model.dart';
class TaskCard extends StatelessWidget {
  final TaskModel task;
  final VoidCallback onToggle;
  final VoidCallback onDelete;
   final Color color;
TaskCard({required this.task, required this.onToggle, required this.onDelete,required this.color});
  
  @override
  Widget build(BuildContext context) {
    return Card(    
      color:color,
        margin: EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          title: Text(
            task.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration: task.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Text(task.isDone ? 'Completed' : 'Pending'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.check_circle,
                    color: task.isDone ? const Color.fromARGB(255, 14, 103, 17) : const Color.fromARGB(255, 25, 146, 227)),
                onPressed: onToggle,
              ),
              IconButton(
                icon: Icon(Icons.delete, color: const Color.fromARGB(255, 225, 22, 7)),
                onPressed: onDelete,
              ),
            ],
          ),
        ),
      );
  }
}