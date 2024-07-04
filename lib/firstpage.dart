import 'package:flutter/material.dart';

class mypage extends StatelessWidget {
  const mypage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(image: const AssetImage('assets/zoom.png')),
      ),
      
    );
  }
}