import 'package:flutter/material.dart';

/////////////////////////////////////////////////

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ShoppingStatefulTest(),
//     );
//   }
// }

//////////////////////////////////////////////////////////
///

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

  final List<double> prices = const [
    120,
    149.99,
    999.99,
    299.99,
    699.99,
    499.99,
    199.99,
    249.99,
  ];

  List<bool> isAdded = List.filled(8, false);
  List<int> quantities = List.filled(8, 0);
  int addedProducts = 0;

  void toggle(int index) {
    setState(() {
      isAdded[index] = !isAdded[index];

      if (isAdded[index]) {
        quantities[index] = 1;
        addedProducts++;
      } else {
        quantities[index] = 0;
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
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(
                icons: icons,
                names: names,
                prices: prices,
                quantities: quantities,
                isAdded: isAdded,
              ),
            ),
          );

          setState(() {
            addedProducts = 0;

            for (int i = 0; i < isAdded.length; i++) {
              if (isAdded[i]) {
                addedProducts++;
              }
            }
          });
        },
        child: Icon(Icons.shopping_cart, color: Colors.teal),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: ProductCards(
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

class ProductCards extends StatelessWidget {
  ProductCards({
    super.key,
    required this.icons,
    required this.names,
    required this.prices,
    required this.toggle,
    required this.isAdded,
  });

  final List<IconData> icons;
  final List<String> names;
  final List<double> prices;
  Function(int index) toggle;
  List<bool> isAdded;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
                      "\$${prices[index].toString()}",
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
    );
  }
}

class CartPage extends StatefulWidget {
  final List<IconData> icons;
  final List<String> names;
  final List<double> prices;
  final List<int> quantities;
  final List<bool> isAdded;

  const CartPage({
    super.key,
    required this.icons,
    required this.names,
    required this.prices,
    required this.quantities,
    required this.isAdded,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    double total = 0;

    for (int i = 0; i < widget.names.length; i++) {
      if (widget.isAdded[i]) {
        total += widget.prices[i] * widget.quantities[i];
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
          itemCount: widget.names.length,

          itemBuilder: (context, index) {
            if (widget.isAdded[index] == false) {
              return SizedBox();
            }

            return Card(
              child: ListTile(
                leading: Icon(widget.icons[index], color: Colors.teal),

                title: Text(widget.names[index]),

                subtitle: Text('\$${widget.prices[index]}'),

                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Decrease Quantity
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (widget.quantities[index] > 1) {
                            widget.quantities[index]--;
                          } else {
                            widget.quantities[index] = 0;
                            widget.isAdded[index] = false;
                          }
                        });
                      },
                      icon: Icon(Icons.remove_circle, color: Colors.red),
                    ),

                    Text('${widget.quantities[index]}'),

                    // Increase Quantity
                    IconButton(
                      onPressed: () {
                        setState(() {
                          widget.quantities[index]++;
                        });
                      },
                      icon: Icon(Icons.add_circle, color: Colors.teal),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(15),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Total: \$${total.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 22),
            ),

            SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                if (total == 0) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Your cart is empty')));
                } else {
                  showDialog(
                    context: context,
                    builder: (dialogContext) => AlertDialog(
                      title: Text('Order Confirmed'),
                      content: Text(
                        'Your Total is \$${total.toStringAsFixed(2)}',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            for (int i = 0; i < widget.quantities.length; i++) {
                              widget.quantities[i] = 0;
                              widget.isAdded[i] = false;
                            }

                            Navigator.pop(dialogContext);
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text('Checkout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
