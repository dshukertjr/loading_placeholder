import './loading_placeholder.dart';
import 'package:flutter/material.dart';

class Some extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoadingPlaceholder(
      frequency: Duration(milliseconds: 500),
      colors: [Color(0xFFF6F7F8), Color(0xFFEEEEEE)],
    );
  }
}
