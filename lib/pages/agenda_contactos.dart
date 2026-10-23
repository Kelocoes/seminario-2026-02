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
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();

  // Estado de la aplicación
  final List<Contacto> _contacts = [
    const Contacto(name: "Esteban", phoneNum: "3135036899"),
    const Contacto(name: "Juan", phoneNum: "3135036899"),
  ];
  String message = "";

  void addContactList() {
    final name = _nameController.text.trim();
    if (name.isEmpty) return;
    final number = _numberController.text.trim();
    if (number.isEmpty) return;
    setState(() {
      message = "Contacto agregado";
      _contacts.add(Contacto(name: name, phoneNum: number));
      _nameController.clear();
      _numberController.clear();
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) setState(() => message = "");
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: "Nombre del contacto"),
          ),
          TextField(
            controller: _numberController,
            decoration: const InputDecoration(labelText: "Número de teléfono"),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: addContactList,
            child: const Text("Agregar contacto"),
          ),
          if (message.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(message),
            ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: _contacts.length,
              itemBuilder: (context, index) {
                final contacto = _contacts[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6.0),
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(contacto.name),
                    subtitle: Text(contacto.phoneNum),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
