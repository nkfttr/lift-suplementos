
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/app_provedor.dart';
import 'screens/tela_principal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lift  Suplementos MVP',
        home: const MainScreen(),
      ),
    );
  }
}
