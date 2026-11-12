import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:third_week_flutter/View/Provider/Shopping_Provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    ShoppingProvider shoppingProvider = Provider.of<ShoppingProvider>(context);

    double total = 0;

    for (int i = 0; i < shoppingProvider.names.length; i++) {
      if (shoppingProvider.isAdded[i]) {
        total += shoppingProvider.prices[i] * shoppingProvider.quantities[i];
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart', style: TextStyle(fontSize: 26)),
        backgroundColor: Colors.teal,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: shoppingProvider.names.length,
          itemBuilder: (context, index) {
            if (!shoppingProvider.isAdded[index]) {
              return SizedBox();
            }

            return Card(
              child: ListTile(
                leading: Icon(
                  shoppingProvider.icons[index],
                  color: Colors.teal,
                ),
                title: Text(shoppingProvider.names[index]),
                subtitle: Text('\$${shoppingProvider.prices[index]}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        shoppingProvider.decreaseQuantity(index);
                      },
                      icon: const Icon(Icons.remove_circle, color: Colors.red),
                    ),
                    Text('${shoppingProvider.quantities[index]}'),
                    IconButton(
                      onPressed: () {
                        shoppingProvider.increaseQuantity(index);
                      },
                      icon: const Icon(Icons.add_circle, color: Colors.teal),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(color: Colors.teal),
        child: Center(
          child: Text(
            'Total : \$${total.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 22, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
