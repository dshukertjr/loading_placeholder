library loading_placeholder;

import 'dart:async';

import 'package:flutter/material.dart';

/// Creates a widget where the color changes
class LoadingPlaceholder extends StatefulWidget {
  @override
  _LoadingPlaceholderState createState() => _LoadingPlaceholderState();
}

class _LoadingPlaceholderState extends State<LoadingPlaceholder> {
  final Duration frequency;
  final List<Color> colors;
  _LoadingPlaceholderState({
    this.frequency = const Duration(milliseconds: 800),
    this.colors = const [Color(0xFFF6F7F8), Color(0xFFEEEEEE)],
  });

  Duration duration;
  Color color1;
  Color color2;
  Color currentColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration,
      color: currentColor,
    );
  }

  @override
  void initState() {
    duration = frequency ?? Duration(milliseconds: 800);
    color1 = colors?.isEmpty == false ? colors[0] : Color(0xFFF6F7F8);
    color2 = (colors?.length ?? 0) >= 2 ? colors[1] : Color(0xFFEEEEEE);
    currentColor = color1;
    _alternateColors();
    super.initState();
  }

  void _alternateColors() {
    Timer.periodic(duration, (Timer t) {
      setState(() {
        currentColor = currentColor == color1 ? color2 : color1;
      });
    });
  }
}
