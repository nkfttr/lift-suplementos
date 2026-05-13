import 'package:flutter/material.dart';

class DashboardTela extends StatelessWidget {
  const DashboardTela({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Boas-vindas!",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}