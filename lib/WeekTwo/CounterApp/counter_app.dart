import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Counter_Controller/counter_controller.dart';
class Counter extends StatelessWidget {
   Counter({super.key});
 final CounterController controllers = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    final CounterController controllers = Get.find();
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Counter App",style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.w900,
          color: const Color.fromARGB(255, 38, 2, 109)
          ),),
          SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: const Color.fromARGB(255, 94, 96, 8),width: 5.0),
          
            ),
            child: Column(
              children: [
                SizedBox(height: 20,),
              
                 Obx(()=>Text("${controllers.count.value}",style:TextStyle(
                  color: const Color.fromARGB(255, 19, 11, 19),fontSize: 35.0),
                 ),),
                 SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   
                          FloatingActionButton(
                          onPressed: controllers.increament,
                          foregroundColor: const Color.fromARGB(255, 248, 244, 248),
                          backgroundColor: const Color.fromARGB(255, 17, 155, 111),
                          elevation: 10.0,
                          hoverColor: const Color.fromARGB(255, 179, 97, 245),
                          child: Icon(Icons.add),),
                        
                          SizedBox(width: 30,),
                           FloatingActionButton(onPressed: controllers.decreament,
                           foregroundColor: const Color.fromARGB(255, 237, 235, 238),
                          backgroundColor: const Color.fromARGB(255, 255, 0, 0),
                          elevation: 10.0,
                          hoverColor: const Color.fromARGB(255, 179, 97, 245),

                          child: Icon(Icons.remove)),
                          
                  ],
                ),
              ],
            ),
          ),
        ),
        
      ],),
    );
  }
}