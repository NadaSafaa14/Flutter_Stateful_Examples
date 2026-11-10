import 'package:flutter/material.dart';

class ShoppingStatefulTest extends StatefulWidget {
  const ShoppingStatefulTest({super.key});

  @override
  State<ShoppingStatefulTest> createState() => _ShoppingStatefulTestState();
}

class _ShoppingStatefulTestState extends State<ShoppingStatefulTest> {
  final List<IconData> icons = const [
    Icons.watch,
    Icons.headphones,
    Icons.laptop,
    Icons.camera_alt,
    Icons.smartphone,
    Icons.tablet,
    Icons.watch,
    Icons.headphones,
  ];

  final List<String> names = const [
    'Smartwatch',
    'Headphones',
    'Laptop',
    'Camera',
    'Smartphone',
    'Tablet',
    'Smartwatch',
    'Headphones',
  ];

  final List<String> prices = const [
    '\$120.00',
    '\$149.99',
    '\$999.99',
    '\$299.99',
    '\$699.99',
    '\$499.99',
    '\$199.99',
    '\$249.99',
  ];

  List<bool> isAdded = List.filled(8, false);
  int addedProducts = 0;

  void toggle(int index) {
    setState(() {
      isAdded[index] = !isAdded[index];

      if (isAdded[index]) {
        addedProducts++;
      } else {
        addedProducts--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping', style: TextStyle(fontSize: 26)),
        backgroundColor: Colors.teal,
        centerTitle: true,
        foregroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Text("$addedProducts", style: TextStyle(fontSize: 20)),
                SizedBox(width: 4),
                Icon(Icons.shopping_cart),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.shopping_cart, color: Colors.teal),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: ProductCard(
            icons: icons,
            names: names,
            prices: prices,
            toggle: toggle,
            isAdded: isAdded,
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  ProductCard({
    super.key,
    required this.icons,
    required this.names,
    required this.prices,
    required this.toggle,
    required this.isAdded,
  });

  final List<IconData> icons;
  final List<String> names;
  final List<String> prices;
  Function(int index) toggle;
  List<bool> isAdded;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 10.0, // Horizontal spacing between items
          mainAxisSpacing: 10.0, // Vertical spacing between items
        ),
        itemCount: icons.length, // Total number of items in the grid
        itemBuilder: (context, index) => InkWell(
          child: Card(
            elevation: 4.0,
            color: Colors.grey[100],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icons[index], color: Colors.teal, size: 40),
                  SizedBox(height: 6),
                  Column(
                    children: [
                      Text(
                        names[index],
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      SizedBox(height: 4),
                      Text(
                        prices[index],
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => toggle(index),
                        child: Text(isAdded[index] ? "Added" : "Add to Cart"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isAdded[index]
                              ? Colors.redAccent
                              : Colors.teal,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
