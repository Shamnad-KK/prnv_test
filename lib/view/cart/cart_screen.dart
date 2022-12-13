import 'package:flutter/material.dart';
import 'package:prnv_test/controller/cart_controller.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Consumer<CartController>(
          builder: (context, value, child) => value.cartList.isEmpty
              ? const Center(
                  child: Text('Cart empty'),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: value.cartList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final product = value.cartList[index];

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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.name,
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        "₹${product.price.round().toString()}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.indigo[300],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        product.quantity.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
