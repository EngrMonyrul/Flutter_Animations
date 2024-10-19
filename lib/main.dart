import 'package:flutter/material.dart';
import 'package:flutter_animation/animationExamples/impicitAnimation/animated_container_example.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedContainerExample(),
    );
  }
}
