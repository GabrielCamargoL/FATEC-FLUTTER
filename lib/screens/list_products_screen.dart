import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/widgets/card_product.dart';

class ListProductsScreen extends StatelessWidget {
  ListProductsScreen({super.key});

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
                              return CardProduct(product: product);
                            })
                      ])))
        ]));
  }
}
