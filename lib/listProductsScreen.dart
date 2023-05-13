import 'package:flutter/material.dart';
import 'package:shop/classes/Product.dart';

import 'loginScreen.dart';
import 'productDetailsScreen.dart';

class ListProductsScreen extends StatelessWidget {
  final FormData formData;
  ListProductsScreen({required this.formData});

  List<Product> products = Product.getProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Produtos'),
          backgroundColor: const Color.fromARGB(220, 70, 20, 43),
        ),
        body: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Card(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        product.image,
                        width: 125,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'R\$ ${product.price.toStringAsFixed(2)}', // Insira o preço do produto
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 40.0,
                            width: MediaQuery.of(context).size.width * 0.50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(220, 70, 20, 43),
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetailsScreen(product: product),
                                  ),
                                );
                              },
                              child: const Text('COMPRE AGORA',
                                  textAlign: TextAlign.center),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}

//--------------- Página de produtos ---------------



    // Padding(
    //   padding: const EdgeInsets.all(16),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       const SizedBox(height: 16),
    //       Text('Bem vindo, ${formData.name}'),
          
    //       const SizedBox(height: 16),
    //     ],
    //   ),
    // ),
