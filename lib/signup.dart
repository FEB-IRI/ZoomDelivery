import "package:flutter/material.dart";
import "package:project_o2/Entrepreneur.dart";
import "package:project_o2/campusvendor.dart";
import "package:project_o2/studentsignup.dart";

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: const Color.fromARGB(47, 19, 184, 129),
  body: Padding(
    padding: const EdgeInsets.only(top: 200),
    child: Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 50),
            child: Text(
              'Welcome',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 65),
            child: Padding(
              padding: EdgeInsets.only(right: 50),
              child: Text(
                'Sign up as?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                        
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Studentsignup(),
                            ),
                          );
                        },
                        
                        child: const Text(
                          'Student',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Padding(
              padding: const EdgeInsets.only(right: 50),
              child: SizedBox(
                height: 50,
                width: 205,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ent(),
                      ),
                    );
                  },
                  child: const Text(
                    'Student Entrepreneur',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Padding(
              padding: const EdgeInsets.only(right: 50),
              child: SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Camp(),
                      ),
                    );
                  },
                  child: const Text(
                    'Campus Vendor',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          
          
        ],
      ),
    ),
  ),
);

  }
}
