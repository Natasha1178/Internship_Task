import "package:flutter/material.dart";
import "task_screen_ui.dart";
class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      Column(
        children: [
          SizedBox(height: 30,),
       Image(
  image: AssetImage('assets/started.jpg',),
  fit: BoxFit.cover,
  height: 200,
  width: 200,
),
        SizedBox(height: 30,),
        Text("Daily Task Management",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
            fontSize: 20.0),),
        SizedBox(height: 20,),
        Text("This productive app is designed to\nhelp you better manage your task."),
        SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
            onTap: (){
             Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TaskScreenUi()),
      );
            },
            child: Container(height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(child: Text("Get Started",style: TextStyle(color: const Color.fromARGB(255, 244, 243, 243),fontWeight: FontWeight.w600,
            fontSize: 20.0),)),
            ),
          ),
        ),
        ],
      )
      ),
    );
  }
}