import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/checkout.dart';
import 'package:provider_project/model/cart.dart';
import 'package:provider_project/model/item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Item> items = [
    Item(name: "S24 ultra", price: 300),
    Item(name: "15 pro max", price: 350),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (c) => CheckOut()));
                },
                icon: Icon(Icons.add_shopping_cart),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Consumer<Cart>(
                  builder: (context, value, child) {
                    return Text(
                      "${value.count}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),

      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Consumer<Cart>(
              builder: (context, value, child) {
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  leading: CircleAvatar(
                    radius: 26,
                    backgroundColor: Colors.blue.shade50,
                    child: Icon(
                      Icons.shopping_bag,
                      color: Colors.blue.shade700,
                    ),
                  ),
                  title: Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    '\$${item.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      value.add(item);
                    },
                    icon: const Icon(Icons.add_circle_outline),
                    color: Colors.blue,
                    tooltip: 'Add to cart',
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
