import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/screens/appreciation_screen.dart';
import 'package:shop/screens/list_products_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  ProductDetailsScreen({super.key, required this.product});

  int quantidade = 1;

  double calcularPrecoTotal() {
    return product.price * quantidade;
  }

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Detalhes do produto'),
          backgroundColor: const Color.fromARGB(220, 70, 20, 43),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Text(
                widget.product.title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Image.asset(
                widget.product.image,
                width: 150,
              ),
              const SizedBox(height: 16),
              Text(
                'R\$ ${widget.product.price.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Quantidade: '),
                  SizedBox(
                    width: 40,
                    height: 20,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          widget.quantidade = int.tryParse(value) ?? 0;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Preço Total: R\$ ${widget.calcularPrecoTotal().toStringAsFixed(2)}',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(220, 70, 20, 43),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AppreciationScreen(),
                        ),
                      );
                    },
                    child: const Text('FINALIZAR COMPRA',
                        textAlign: TextAlign.center),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
