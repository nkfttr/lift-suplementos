import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provedor.dart';
import '../models/produtos.dart';
import 'dart:math';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final durationController = TextEditingController();

  void save() {
    final name = nameController.text;
    final price = double.tryParse(priceController.text) ?? 0;
    final duration = int.tryParse(durationController.text) ?? 0;

    if (name.isEmpty || price <= 0 || duration <= 0) return;

    final product = Product(
      id: Random().toString(),
      name: name,
      price: price,
      durationDays: duration,
    );

    Provider.of<AppProvider>(context, listen: false).addProduct(product);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Adicionar produtos")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Nome do Produto"),
            ),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Preço"),
            ),
            TextField(
              controller: durationController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Duração (dias)"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: save, child: const Text("Salvar Produto")),
          ],
        ),
      ),
    );
  }
}