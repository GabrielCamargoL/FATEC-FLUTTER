import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';

import 'login_screen.dart';
import 'product_details_screen.dart';

class ListProductsScreen extends StatelessWidget {
  final FormData formData;
  ListProductsScreen({super.key, required this.formData});

  final List<Product> products = Product.getProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Produtos'),
          backgroundColor: const Color.fromARGB(220, 70, 20, 43),
        ),
        body: Column(children: <Widget>[
          Expanded(
              child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Produtos Disponíveis',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        ListView.separated(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: products.length,
                            separatorBuilder: (_, int index) => const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: Divider(),
                                ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.40,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        220, 70, 20, 43),
                                                foregroundColor: Colors.white,
                                              ),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProductDetailsScreen(
                                                            product: product),
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
                            })
                      ])))
        ]));
  }
}
