import 'package:flutter/material.dart';

// Define el estado inicial del Widget
class ContadorWidget extends StatefulWidget {
  const ContadorWidget({super.key});
  @override
  State<StatefulWidget> createState() => _ContadorState();
}

// Definir el apartado visual del widget
class _ContadorState extends State<ContadorWidget> {
  int contador = 1;
  Color color = Colors.red;
  void incrementar() {
    setState(() {
      contador++;
      if (contador == 1) color = Colors.red;
      if (contador == 2) color = Colors.yellow;
      if (contador == 3) color = Colors.green;
      if (contador == 4) contador = 1;
    });
    print(contador);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(contador.toString()),
        SizedBox(height: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: color),
          onPressed: () {
            incrementar();
          },
          child: Text("Aumentar!"),
        ),
      ],
    );
  }
}
