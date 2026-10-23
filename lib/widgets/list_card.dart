import 'package:flutter/material.dart';
import 'package:seminario_2026_02/model/contact.dart';
import 'package:seminario_2026_02/widgets/contact_card.dart';

class ListCard extends StatelessWidget {
  final List<Contacto> _contacts;
  const ListCard({super.key, required this._contacts});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _contacts.length,
      itemBuilder: (context, index) {
        final contacto = _contacts[index];
        return ContactCard(name: contacto.name, phoneNum: contacto.phoneNum);
      },
    );
  }
}
