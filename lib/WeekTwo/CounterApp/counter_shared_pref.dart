import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterSharedPref extends StatefulWidget {
  @override
  State<CounterSharedPref> createState() => _CounterSharedPrefState();
}

class _CounterSharedPrefState extends State<CounterSharedPref> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    loadCounter(); // Load saved value
  }

  // Save to SharedPreferences
  Future<void> saveCounter() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', counter);
  }

  // Load from SharedPreferences
  Future<void> loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = prefs.getInt('counter') ?? 0; // Default to 0
    });
  }

  void increment() {
    setState(() {
      counter++;
    });
    saveCounter();
  }

  void decrement() {
    setState(() {
      counter--;
    });
    saveCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Text("Persistent Counter App",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w900,
          color: const Color.fromARGB(255, 38, 2, 109)
          ),),
          SizedBox(height: 20,),
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: const Color.fromARGB(255, 94, 96, 8),width: 5.0),
              
                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Counter Value:",
                    style: TextStyle(fontSize: 22,),
                  ),
                  Text(
                    "$counter",
                    style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: decrement,
                        icon: const Icon(Icons.remove),
                        label: const Text("Decrease"),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton.icon(
                        onPressed: increment,
                        icon: const Icon(Icons.add),
                        label: const Text("Increase"),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}