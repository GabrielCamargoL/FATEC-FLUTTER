import 'package:flutter/material.dart';
import 'package:shop/screens/list_products_screen.dart';

class AppreciationScreen extends StatelessWidget {
  const AppreciationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Agradecimento'),
          backgroundColor: const Color.fromARGB(220, 70, 20, 43),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              const SizedBox(height: 40),
              Image.asset(
                'assets/images/logo.png',
                width: 300,
                height: 200,
              ),
              const SizedBox(height: 16),
              const Text(
                'Obrigado por comprar!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(220, 70, 20, 43),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListProductsScreen(),
                    ),
                  );
                },
                child: const Text('VOLTAR', textAlign: TextAlign.center),
              ),
            ])));
  }
}
