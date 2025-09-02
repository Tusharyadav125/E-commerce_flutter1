import 'package:flutter/material.dart';
import 'package:task_int/service/auth_service.dart';
import 'signupscreen.dart';
import 'home_page.dart';

class Loginpage extends StatefulWidget {
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
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 60),
            Image.asset('assets/images/Logo.png', width: width * 0.8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5))]),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 36),
                child: Column(
                  children: [
                    Text('Sign in', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue)),
                    SizedBox(height: 30),
                    TextField(controller: emailcontroller, decoration: InputDecoration(prefixIcon: Icon(Icons.email), hintText: "Email ID")),
                    SizedBox(height: 20),
                    TextField(controller: passcontroller, decoration: InputDecoration(prefixIcon: Icon(Icons.lock), hintText: "Password"), obscureText: true),
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

                        if (email.isEmpty || password.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill all fields")));
                          return;
                        }

                        String result = AuthService.login(email, password);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));

                        if (result == "Login Successful!") {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
                        }
                      },
                      child: Text("LOGIN"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>SignUpScreen()));
                      },
                      child: Text("Don't have an account? Sign up",style: TextStyle(
                          color: Colors.blueGrey
                      ),),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
