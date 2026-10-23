import 'package:flutter/material.dart';
import 'package:seminario_2026_02/model/contact.dart';

import 'package:seminario_2026_02/widgets/contact_form.dart';
import 'package:seminario_2026_02/widgets/list_card.dart';

// Clase que se inicializa
class ContactAgenda extends StatefulWidget {
  const ContactAgenda({super.key});

  @override
  State<ContactAgenda> createState() => _ContactAgentaState();
}

// Clase del apartado visual (que va a cambiar visualmente)
class _ContactAgentaState extends State<ContactAgenda> {

  // Estado de la aplicación
  final List<Contacto> _contacts = [
    const Contacto(name: "Esteban", phoneNum: "3135036899"),
    const Contacto(name: "Juan", phoneNum: "3135036899"),
  ];

  void onAgregar(Contacto contact) {
    setState(() {
      _contacts.add(contact);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ContactForm(onAgregar: onAgregar),
          const SizedBox(height: 12),
          Expanded(
            child: ListCard(contacts: _contacts),
          ),
        ],
      ),
    );
  }
}
