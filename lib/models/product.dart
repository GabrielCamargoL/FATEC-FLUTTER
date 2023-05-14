class Product {
  final String title;
  final String image;
  final double price;

  Product({required this.title, required this.image, required this.price});

  static getProducts() {
    List<Product> products = [
      Product(
        title: 'Guitarra Ibanez Rg350',
        image: 'assets/images/ibanez-rg350.png',
        price: 2599.00,
      ),
      Product(
        title: 'Guitarra Gibson Les Paul',
        image: 'assets/images/gibson-lespaul.png',
        price: 3000.00,
      ),
      Product(
        title: 'Amplificador Marshal',
        image: 'assets/images/amp.png',
        price: 1200.00,
      ),
      Product(
        title: 'Pedal BOSS Distortion DS-1',
        image: 'assets/images/pedal-orange.png',
        price: 800.00,
      ),
      Product(
        title: 'Pedal Heavy Metal',
        image: 'assets/images/pedal-pink.png',
        price: 450.00,
      ),
      Product(
        title: 'Capa para guitarra',
        image: 'assets/images/capa.png',
        price: 200.00,
      ),
    ];
    return products;
  }
}
