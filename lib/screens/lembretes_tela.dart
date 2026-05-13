import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provedor.dart';
import 'add_lembretes_tela.dart';

class LembretesTela extends StatelessWidget {
  const LembretesTela({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text(
        "Lembretes⏰",
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
        itemCount: provider.lembretes.length,
        itemBuilder: (_, index) {
          final lembrete = provider.lembretes[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.alarm),
              title: Text(lembrete.name),
              subtitle: Text(lembrete.description),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddLembreteScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}