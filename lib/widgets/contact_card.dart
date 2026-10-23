import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final String name;
  final String phoneNum;
  const ContactCard({super.key, required this.name, required this.phoneNum});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(name),
        subtitle: Text(phoneNum),
      ),
    );
  }
}
