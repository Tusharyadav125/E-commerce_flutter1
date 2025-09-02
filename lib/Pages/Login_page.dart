import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_int/Pages/home_page.dart';

class Loginpage extends StatefulWidget{
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();

}
var emailcontroller = TextEditingController();
var passcontroller = TextEditingController();

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final hight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
           SizedBox(height: 60,),
            Image.asset('assets/images/Logo.png',
              width: width*0.8,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 36),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Sign in', style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                      ),
                      SizedBox(height: 30),
                      TextField(
                        controller: emailcontroller,

                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone, color: Colors.grey),
                          hintText: 'Email ID',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: passcontroller,

                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock, color: Colors.grey),
                          hintText: 'Password',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 40),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue,
                          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        onPressed: () {
                          String email = emailcontroller.text.trim();
                          String password = passcontroller.text.trim();

                          if(email.isEmpty || password.isEmpty  ){
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Please fill all fields")),
                            );
                          } else if (!email.contains("@") || !email.contains(".")) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Enter a valid email")),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("✅ Login Successful")),);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()),);
                          }
                        },

                        child: Text('LOGIN', style: TextStyle(
                          fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 16,
                        ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                        },
                        child: Text(
                          "Don't have an account? Sign up",
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )

      ),
    );
  }
}

