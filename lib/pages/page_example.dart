import 'package:flutter/material.dart';
import 'package:seminario_2026_02/widgets/action_button.dart';
import 'package:seminario_2026_02/widgets/basic_widget.dart';
import 'package:seminario_2026_02/widgets/basic_widget_props.dart';
import 'package:seminario_2026_02/widgets/notification_banner.dart';
import 'package:seminario_2026_02/widgets/status_badge.dart';
import 'package:seminario_2026_02/widgets/user_profile_card.dart';

class PageExample extends StatelessWidget {
  const PageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widget Sandbox')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            MyFirstWidget(),
            WidgetProps(message: "Mensaje de prueba", number: 15),
            WidgetProps(
              message: "Soy el mismo widget pero con diferentes props!",
              number: 15,
            ),
            ActionButton(icon: Icon(Icons.download), text: "Descargar Guía"),
            SizedBox(height: 10),
            StatusBadge(
              state: "En progreso",
              dotColor: Colors.green,
              label: "Estado del Módulo Flutter",
            ),
            SizedBox(height: 10),
            NotificationBanner(
              icon: Icon(Icons.info, color: Colors.white),
              title: "Aviso Académico",
              description:
                  "La entrega del Sprint 2 de Flutter vence este viernes a las 23:59 hrs.",
            ),
            SizedBox(height: 10),
            UserProfileCard(
              imageUrl: "https://picsum.photos/200",
              name: "Sofia Martinez",
              description: "Monitora SIS - Flutter GDE",
              state: "En línea",
              icon: Icon(Icons.chat_outlined, color: Color.fromARGB(255, 61, 61, 61)),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
