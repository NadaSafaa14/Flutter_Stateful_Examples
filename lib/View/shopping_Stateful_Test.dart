import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:third_week_flutter/View/Provider/Shopping_Provider.dart';
import 'package:third_week_flutter/View/cart_page.dart';

class ShoppingStatefulTest extends StatelessWidget {
  const ShoppingStatefulTest({super.key});

  @override
  Widget build(BuildContext context) {
    ShoppingProvider shoppingProvider = Provider.of<ShoppingProvider>(context);

    int counter = 0;

    for (int i = 0; i < shoppingProvider.names.length; i++) {
      if (shoppingProvider.isAdded[i] == true) {
        counter++;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping', style: TextStyle(fontSize: 26)),
        backgroundColor: Colors.teal,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage()),
          );
        },
        child: Badge(
          backgroundColor: Colors.redAccent,
          label: Text(counter.toString()),
          child: const Icon(Icons.shopping_cart, size: 30, color: Colors.teal),
        ),
      ),
      body: const SafeArea(
        child: Padding(padding: EdgeInsets.all(14.0), child: ProductCard()),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final shoppingProvider = Provider.of<ShoppingProvider>(context);

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: shoppingProvider.icons.length,
      itemBuilder: (context, index) => Card(
        elevation: 4,
        color: Colors.grey[100],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(shoppingProvider.icons[index], color: Colors.teal, size: 40),
              const SizedBox(height: 6),
              Column(
                children: [
                  Text(
                    shoppingProvider.names[index],
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${shoppingProvider.prices[index]}",
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      shoppingProvider.toggle(index);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: shoppingProvider.isAdded[index]
                          ? Colors.redAccent
                          : Colors.teal,
                      foregroundColor: Colors.white,
                    ),
                    child: Text(
                      shoppingProvider.isAdded[index] ? "Added" : "Add to Cart",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
