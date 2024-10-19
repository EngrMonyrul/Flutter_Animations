import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  State<AnimatedContainerExample> createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  List<Color>? _rgbColors;

  void _changeRgbColors() {
    final random = Random();

    _rgbColors = List.generate(
      3,
      (index) {
        return Color.fromRGBO(
          random.nextInt(256),
          random.nextInt(256),
          random.nextInt(256),
          1,
        );
      },
    );

    setState(() {});
  }

  @override
  void initState() {
    _changeRgbColors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_rgbColors != null)
                for (Color color in _rgbColors!)
                  AnimatedContainer(
                    color: color,
                    duration: const Duration(milliseconds: 600),
                    height: 100,
                    width: 100,
                  ),
              ElevatedButton(
                onPressed: _changeRgbColors,
                child: const Text(
                  "Change Colors",
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_rgbColors != null)
                AnimatedContainer(
                  height: 200,
                  width: 200,
                  duration: const Duration(milliseconds: 600),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [..._rgbColors ?? []],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                ),
              ElevatedButton(
                onPressed: _changeRgbColors,
                child: const Text(
                  "Change Colors",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
