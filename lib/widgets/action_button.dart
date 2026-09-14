import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final Icon icon;
  final String text;

  const ActionButton({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      onPressed: () {
        print("Botón presionado!");
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [icon, const SizedBox(width: 12), Text(text)],
        ),
      ),
    );
  }
}
