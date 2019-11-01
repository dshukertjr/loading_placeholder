library loading_placeholder;

import 'dart:async';

import 'package:flutter/material.dart';

/// Creates a widget where the color changes
class LoadingPlaceholder extends StatefulWidget {
  final Duration frequency;
  final List<Color> colors;

  const LoadingPlaceholder({
    Key key,
    this.frequency = const Duration(milliseconds: 800),
    this.colors = const [Color(0xFFF6F7F8), Color(0xFFEEEEEE)],
  }) : super(key: key);
  @override
  _LoadingPlaceholderState createState() => _LoadingPlaceholderState();
}

class _LoadingPlaceholderState extends State<LoadingPlaceholder> {
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
    duration = widget.frequency ?? Duration(milliseconds: 800);
    color1 =
        widget.colors?.isEmpty == false ? widget.colors[0] : Color(0xFFF6F7F8);
    color2 = (widget.colors?.length ?? 0) >= 2
        ? widget.colors[1]
        : Color(0xFFEEEEEE);
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
