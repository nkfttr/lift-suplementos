import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provedor.dart';
import '../models/clientes.dart';
import 'dart:math';

class AddClientScreen extends StatefulWidget {
  const AddClientScreen({super.key});

  @override
  State<AddClientScreen> createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<AddClientScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  void saveClient() {
    final name = nameController.text.trim();
    final phone = phoneController.text.trim();

    if (name.isEmpty || phone.isEmpty) return;

    final client = Client(
      id: Random().toString(),
      name: name,
      phone: phone,
    );

    Provider.of<AppProvider>(context, listen: false)
        .addClient(client);

    Navigator.pop(context);
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Client")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Nome do Cliente",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "Telefone",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveClient,
                child: const Text("Salvar Cliente"),
              ),
            )
          ],
        ),
      ),
    );
  }
}