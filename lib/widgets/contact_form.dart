import 'package:flutter/material.dart';
import 'package:seminario_2026_02/model/contact.dart';

class ContactForm extends StatefulWidget {
  final void Function(Contacto contact) onAgregar;
  const ContactForm({super.key, required this.onAgregar});

  @override
  State<StatefulWidget> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  String message = "";

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    setState(() {
      message = "Contacto agregado";
    });
    final contact = Contacto(
      name: _nameController.text,
      phoneNum: _numberController.text,
    );
    widget.onAgregar(contact);
    _nameController.clear();
    _numberController.clear();
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
            onPressed: _handleSubmit,
            child: const Text("Agregar contacto"),
          ),
          if (message.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(message),
            ),
        ],
      ),
    );
  }
}
