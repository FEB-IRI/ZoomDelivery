import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:my_project/Campus%20vendor.dart';
import 'package:my_project/sign_up.dart';
import 'package:my_project/student-ent.dart'; 



void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const login(), // Wrap your app
  ),
);
class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: const Color.fromARGB(47, 19, 184, 129), 
    body: Padding(
      padding: const EdgeInsets.only(top:200),
      child: 
          Padding(
            padding: const EdgeInsets.only(left:40 ),
            child: Column(
              children: [
                const Text('Welcome to ZoomDelivery', style: TextStyle( color: Colors.white,
                fontSize: 25, 
                fontWeight: FontWeight.w200), ),
                const Padding(
                  padding: EdgeInsets.only(top: 44),
                  child: Text('sign up as ?', style: TextStyle( color: Colors.white,
                  fontSize: 20),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: SizedBox(
                    height: 50,
                    width: 300,
                    child: ElevatedButton(
                     onPressed: () {
                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SignUp(),)
                       );
                     },
                      child: const Text('Student',
                      style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),),
                    ),
                  ),
                ),

               Padding(
                 padding: const EdgeInsets.only(top: 50),
                 child: SizedBox(
                   height: 50,
                   width: 300,
                   child: ElevatedButton(
                     onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Studentent(),)
                       );
                       
                     },
                     child: const Text('Student Entrepreneur',
                     style: TextStyle(
                       fontSize: 25, fontWeight: FontWeight.bold,
                       color: Colors.black
                     ),),
                   ),
                 ),
               ),

               Padding(
                 padding: const EdgeInsets.only(top: 50),
                 child: SizedBox(
                   height: 50,
                   width: 300,
                   child: ElevatedButton(
                     onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const campusvendor(),)
                       );
                     },
                     child: const Text('Campus Vendor',
                     style: TextStyle(
                       fontSize: 25, fontWeight: FontWeight.bold,
                       color: Colors.black
                     ),),
                   ),
                 ),
               )

         
          
         
           ],
            ),
            
          ),
      ),
    );
    }
    }
