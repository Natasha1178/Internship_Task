import 'package:flutter/material.dart';
import 'package:internship_tasks/WeekOne/login_Screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_forward_ios,color: Colors.white,),
            backgroundColor: Colors.indigo,
          title: Center(child: Text("MY COURSES",style: TextStyle(
              color: Colors.white,fontWeight: FontWeight.bold,
            letterSpacing: 1.0
          ),)),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              
            }, icon: Icon(Icons.logout,color: Colors.white,))

          ],
          bottom: TabBar(
              unselectedLabelColor: Colors.white,
              labelColor: Colors.yellow,
              tabs: [
            Tab(icon:Icon(Icons.home,color:Colors.white,size: 33,),text: "All",),
            Tab(icon: Icon(Icons.on_device_training_sharp,color:Colors.white,size: 30),text: "On Going",),
            Tab(icon: Icon(Icons.recommend,color:Colors.white,size: 30),text: "Complete",),
          ]),
        ),
          body:TabBarView(children: [
               Padding(
                 padding: const EdgeInsets.only(top: 30.0),
                 child: SingleChildScrollView(
                   child: Column(
                     children: [
                       Container(
                         height: 200,
                         width: 340,
                         decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                           border: Border.all(color: Colors.black),
                           image: DecorationImage(
                             scale:1.0,
                               image: AssetImage("assets/flutter.jpg"))
                         ),
                         child: Column(
                           children: [
                             Text("Flutter Mobile App",style: TextStyle(
                               color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18.0),),
                           ],
                   
                         ),
                             ),
                       SizedBox(height: 20,),
                       Container(
                         height: 200,
                         width: 340,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                             border: Border.all(color: Colors.black),
                             image: DecorationImage(fit: BoxFit.cover,
                                 scale:1.0,
                                 image: AssetImage("assets/web.jpg"))
                         ),
                         child: Column(
                           children: [
                             Text("Web Development",style: TextStyle(
                                 color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18.0),),
                           ],
                   
                         ),
                       ),
                       SizedBox(height: 20,),
                       Container(
                         height: 210,
                         width: 340,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                             border: Border.all(color: Colors.black),
                             image: DecorationImage(
                                 scale:1.0,
                                 image: AssetImage("assets/Gdesign.jpg"))
                         ),
                         child: Column(
                           children: [
                             Text("Graphic Designing",style: TextStyle(
                                 color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18.0),),
                           ],
                   
                         ),
                       ),
                       SizedBox(height: 20,),
                       Container(
                         height: 210,
                         width: 340,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                             border: Border.all(color: Colors.black),
                             image: DecorationImage(
                                 scale:1.0,
                                 image: AssetImage("assets/ai.png"))
                         ),
                         child: Column(
                           children: [
                             Text("Artificial Intelligence",style: TextStyle(
                                 color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18.0),),
                           ],

                         ),
                       ),
                     ],
                   ),
                 ),
               ),
            //on Going
           Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Column(
            children: [
              Container(
                height: 200,
                width: 340,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                    image: DecorationImage(
                        scale:1.0,
                        image: AssetImage("assets/flutter.jpg"))
                ),
                child: Column(
                  children: [
                    Text("Flutter Mobile App",style: TextStyle(
                        color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18.0),),
                  ],

                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 210,
                width: 340,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                    image: DecorationImage(
                        scale:1.0,
                        image: AssetImage("assets/Gdesign.jpg"))
                ),
                child: Column(
                  children: [
                    Text("Graphic Designing",style: TextStyle(
                        color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18.0),),
                  ],

                ),
              ),
              ],
          ),
        ),
           //Complete
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Column(
                children: [
                  Container(
                    height: 210,
                    width: 340,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black),
                        image: DecorationImage(
                            scale:1.0,
                            image: AssetImage("assets/ai.png"))
                    ),
                    child: Column(
                      children: [
                        Text("Artificial Intelligence",style: TextStyle(
                            color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18.0),),
                      ],

                    ),
                  ),
                ],
              ),
            ),
          ],
      ),
    ),
    ),
    );
  }
}
