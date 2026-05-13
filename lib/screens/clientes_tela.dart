import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provedor.dart';
import 'add_clientes_tela.dart';

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text(
        "Clientes👤",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),),
        flexibleSpace: Container(
          decoration: const BoxDecoration(color: Color.fromARGB(255, 180, 92, 85),),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: provider.clientes.length,
        itemBuilder: (_, index) {
          final client = provider.clientes[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(client.name),
              subtitle: Text(client.phone),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddClientScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}