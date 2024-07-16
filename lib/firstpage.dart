import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:device_preview/device_preview.dart';
//import 'package:project_o2/Dashboard.dart';
import 'package:project_o2/signup.dart';
//import 'package:project_o2/studentsignup.dart';
//import 'package:project_o2/signup.dart';


void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(), // Wrap your app
  ),
);
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Signup() ,
    );
  }
}

// ignore: camel_case_types
 class page1 extends StatelessWidget {
 const page1({super.key});

  @override
  Widget build(BuildContext context) {
      //background of the first page
    return Scaffold( 
     body: InkWell(
        child: const Image(image: const AssetImage('assets/zoom.png')),
        onTap: () {
         Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const Signup();
           },));
          
       },

       ),
     );
  

   }
   }
