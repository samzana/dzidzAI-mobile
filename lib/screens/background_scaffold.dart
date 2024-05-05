import 'package:flutter/material.dart';

class BackgroundScaffold extends StatelessWidget {
  final Widget child;  

  const BackgroundScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),  
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),  
            fit: BoxFit.cover,  
          ),
        ),
        child: SafeArea(child: child), 
      ),
    );
  }
}