
import 'package:flutter/material.dart';
import '../models/produtos.dart';
import '../models/clientes.dart';
import '../models/lembretes.dart';

class AppProvider extends ChangeNotifier {
  final List<Product> products = [];
  final List<Client> clientes = [];
  final List<Lembrete> lembretes = [];

  void addProduct(Product product) {
    products.add(product);
    notifyListeners();
  }
    void addClient(Client client) {
    clientes.add(client);
    notifyListeners();
  }
   void addLembrete(Lembrete lembrete) {
    lembretes.add(lembrete);
    notifyListeners();
   }
}
