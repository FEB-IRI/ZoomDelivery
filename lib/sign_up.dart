import "package:flutter/material.dart";
import "package:project_o2/Dashboard.dart";
import "package:project_o2/signup.dart";
//import "package:project_o2/signup.dart";

class Studentsignup extends StatefulWidget {
  const Studentsignup({super.key});

  @override
  State<Studentsignup> createState() => _LoginViewState();
}

class _LoginViewState extends State<Studentsignup> {
  final TextEditingController _studentidController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  String username = "Jon Doe";
  String lock = '12345';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: Scaffold(
          body: Expanded(
            flex: 3,
            child: Row(
              children: [
                
                const SizedBox(width: 10),
                SizedBox(
                  height: 1000,
                  width: 300,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        
                        const SizedBox(
                          height: 150,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 60),
                          child: Text('Student Log In',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 25)),
                        ),
                        const SizedBox(height: 70),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: TextFormField(
                            controller: _studentidController,
                            decoration: const InputDecoration(
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(255, 0, 0, 0))),
                                hintText: 'Please Enter Student ID',
                                hintStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey),
                                labelText: 'Student ID',
                                labelStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                                icon: Icon(Icons.account_circle)),
                            validator: (username) {
                              if (username!.isEmpty) {
                                return "Student ID is Required";
                              }
                              if (username != "Jon Doe") {
                                return "Enter a Valid Student ID";
                              }
                              setState(() {
                                username = "Jon Doe";
                              });
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 35),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: TextFormField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black)),
                                hintText: 'Please Enter Your Student Pin',
                                hintStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey),
                                labelText: 'Student Pin',
                                labelStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                                icon: Icon(Icons.lock)),
                            obscureText: true,
                            validator: (lock) {
                              if (lock!.isEmpty) {
                                return "student Pin is Required";
                              }
                              if (lock != "12345") {
                                return "Enter a Valid Pin";
                              }
                              setState(() {
                                lock = "12345";
                              });
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: TextButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (context) {
                                    return const Dashboard();
                                  }));
                                } else {
                                  print('failed');
                                }
                              },
                              style: TextButton.styleFrom(
                                  minimumSize: const Size(200, 50),
                                  backgroundColor:
                                      const Color.fromARGB(255, 2, 48, 19)),
                              child: const Text('Login',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white))),
                        ),
                        const SizedBox(height: 8),
                        const Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Text('Forgot your Pin ?',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w200)),
                        )
                      ]),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

 
