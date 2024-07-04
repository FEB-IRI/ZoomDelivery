import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 230, 243, 230),
        body: Title(color:Colors.black, 
        child: Center(child: Text('Student Sign-up'))),
      ),
    );
}}