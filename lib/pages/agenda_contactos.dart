import 'package:flutter/material.dart';
import 'package:seminario_2026_02/model/contact.dart';

// Clase que se inicializa
class ContactAgenda extends StatefulWidget {
  const ContactAgenda({super.key});

  @override
  State<ContactAgenda> createState() => _ContactAgentaState();
}

// Clase del apartado visual (que va a cambiar visualmente)
class _ContactAgentaState extends State<ContactAgenda> {
  //
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();

  // Estado de la aplicación
  final List<Contacto> _contacts = [
    const Contacto(name: "Esteban", phoneNum: "3135036899"),
    const Contacto(name: "Juan", phoneNum: "3135036899"),
  ];
  String message = "";

  void addContactList() {
    print("Agregando contacto...");
    final name = _nameController.text.trim();
    if (name.isEmpty) return;
    final number = _numberController.text;
    if (number.isEmpty) return;
    setState(() {
      message = "Contacto agregado";
      _contacts.add(Contacto(name: name, phoneNum: number));
      _nameController.clear();
      _numberController.clear();
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(labelText: "Nombre del contacto"),
        ),
        TextField(
          controller: _numberController,
          decoration: const InputDecoration(labelText: "Número de teléfono"),
        ),
        ElevatedButton(
          onPressed: () {
            addContactList();
          },
          child: Text("Agregar contacto"),
        ),
        Text(message),
        ..._contacts.map((contacto) => Text(contacto.name)),
      ],
    );
  }
}
