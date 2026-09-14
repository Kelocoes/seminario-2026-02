import 'package:flutter/material.dart';

class WidgetProps extends StatelessWidget {
  final String message;
  final double number;

  const WidgetProps({super.key, required this.message, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Center(
        child: Text(
          message,
          style: TextStyle(fontSize: number, color: Colors.black87),
        ),
      ),
    );
  }
}
