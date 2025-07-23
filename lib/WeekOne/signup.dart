import 'package:flutter/material.dart';
import 'package:internship_tasks/WeekOne/login_Screen.dart';
class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [       
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              "assets/pic.png",
              width: size.width,
              color: const Color.fromARGB(255, 206, 126, 220),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              "assets/pic2.png",
              width: size.width,
              color: Colors.purpleAccent,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "assets/pic3.png",
              width: size.width,
              color: const Color.fromARGB(255, 226, 165, 237),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "assets/pic4.png",
              width: size.width,
              color: Colors.purpleAccent,
            ),
          ),
              Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                     Text("REGISTER", style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.06,
                        letterSpacing: 1.0,
                      ),
                     ),
                SizedBox(height: size.height * 0.02),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Name",
                        prefixIcon: Icon(Icons.account_circle),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Username",
                        prefixIcon: Icon(Icons.account_box_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),                   
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),                   
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Mobile No",
                        prefixIcon: Icon(Icons.add_call),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                
                     SizedBox(height: size.height * 0.02),

                    Container(
                      width: double.infinity,
                      height: size.height * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.yellow[700],
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            // Add login logic or navigation here
                          },
                          child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      },
                            child: Text(
                              "Signup",
                              style: TextStyle(
                                fontSize: size.width * 0.05,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                
                          
                        ),
                      ),
                    ),
                    ),
                    SizedBox(height: 10),
                     SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have your account?",
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
              ),
                        ],
          
          ),
        );
  }
}