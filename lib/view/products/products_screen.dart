import 'package:flutter/material.dart';
import 'package:prnv_test/controller/cart_controller.dart';
import 'package:prnv_test/controller/home_controller.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<HomeController>(
        builder: (context, value, child) => value.productsByCategory.isEmpty
            ? const Center(
                child: Text('No stocks left'),
              )
            : ListView.builder(
                itemCount: value.productsByCategory.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final product = value.productsByCategory[index];
                  return Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    product.image,
                                  ),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: const TextStyle(fontSize: 18),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "₹${product.price.round().toString()}",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const Spacer(),
                          TextButton(
                            style: TextButton.styleFrom(
                              side: const BorderSide(color: Colors.black),
                            ),
                            onPressed: () {
                              cartController.addToCart(product);
                            },
                            child: const Text(
                              'Add to cart',
                              style: TextStyle(color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
