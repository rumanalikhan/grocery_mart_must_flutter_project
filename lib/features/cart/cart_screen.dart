import 'package:flutter/material.dart';
import 'package:grocery_mart/features/cart/checkout_bottomsheet.dart';
import 'package:grocery_mart/features/order/order_accepted_screen.dart';
import 'package:provider/provider.dart';
import 'package:grocery_mart/providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final cartItems = cart.cartItems;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 1,
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty 😿'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    itemBuilder: (context, index) {
                      final product = cartItems[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey.shade200),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 6,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                product.image,
                                width: 60,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              product.name,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              product.category,
                                              style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.close,
                                            color: Colors.grey),
                                        onPressed: () =>
                                            cart.removeFromCart(product),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: const Icon(Icons.remove),
                                            onPressed: () {
                                              cart.decreaseQuantity(product);
                                            },
                                          ),
                                          Text('${product.quantity}'),
                                          IconButton(
                                            icon: const Icon(Icons.add),
                                            onPressed: () {
                                              cart.increaseQuantity(product);
                                            },
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Rs. ${(product.price * product.quantity).toStringAsFixed(0)}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 4,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // showModalBottomSheet(
                      //   context: context,
                      //   isScrollControlled: true,
                      //   shape: const RoundedRectangleBorder(
                      //     borderRadius:
                      //         BorderRadius.vertical(top: Radius.circular(24)),
                      //   ),
                      //   backgroundColor: Colors.white,
                      //   builder: (context) {
                      //     return Padding(
                      //       padding: EdgeInsets.only(
                      //         top: 20,
                      //         left: 20,
                      //         right: 20,
                      //         bottom:
                      //             MediaQuery.of(context).viewInsets.bottom + 20,
                      //       ),
                      //       child: Column(
                      //         mainAxisSize: MainAxisSize.min,
                      //         children: [
                      //           // Drag bar + Close
                      //           Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               const Text(
                      //                 'Checkout',
                      //                 style: TextStyle(
                      //                     fontSize: 18,
                      //                     fontWeight: FontWeight.bold),
                      //               ),
                      //               IconButton(
                      //                 icon: const Icon(Icons.close),
                      //                 onPressed: () => Navigator.pop(context),
                      //               ),
                      //             ],
                      //           ),
                      //           const SizedBox(height: 10),
                      //           // Delivery Method Row
                      //           const Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Text("Deliver",
                      //                   style: TextStyle(fontSize: 16)),
                      //               Row(
                      //                 children: [
                      //                   Text("Select Method",
                      //                       style:
                      //                           TextStyle(color: Colors.black)),
                      //                   Icon(Icons.chevron_right,
                      //                       color: Colors.grey),
                      //                 ],
                      //               ),
                      //             ],
                      //           ),
                      //           const SizedBox(height: 16),
                      //           // Payment Method Row
                      //           const Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Text("Payment",
                      //                   style: TextStyle(fontSize: 16)),
                      //               Row(
                      //                 children: [
                      //                   Icon(Icons.credit_card,
                      //                       size: 20, color: Colors.grey),
                      //                   SizedBox(width: 6),
                      //                   Icon(Icons.chevron_right,
                      //                       color: Colors.grey),
                      //                 ],
                      //               ),
                      //             ],
                      //           ),
                      //           const SizedBox(height: 16),
                      //           // Promo Code Row
                      //           const Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Text("Promo Code",
                      //                   style: TextStyle(fontSize: 16)),
                      //               Row(
                      //                 children: [
                      //                   Text("Pick Discount",
                      //                       style:
                      //                           TextStyle(color: Colors.black)),
                      //                   Icon(Icons.chevron_right,
                      //                       color: Colors.grey),
                      //                 ],
                      //               ),
                      //             ],
                      //           ),
                      //           const SizedBox(height: 16),
                      //           // Total Cost Row
                      //           Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               const Text("Total Cost",
                      //                   style: TextStyle(
                      //                       fontSize: 16,
                      //                       fontWeight: FontWeight.bold)),
                      //               Text(
                      //                   'Rs. ${cart.totalPrice.toStringAsFixed(2)}',
                      //                   style: const TextStyle(
                      //                       fontSize: 16,
                      //                       fontWeight: FontWeight.bold)),
                      //             ],
                      //           ),
                      //           const SizedBox(height: 20),
                      //           const Text.rich(
                      //             TextSpan(
                      //               text:
                      //                   'By placing an order you agree to our ',
                      //               style: TextStyle(
                      //                   color: Colors.grey, fontSize: 12),
                      //               children: [
                      //                 TextSpan(
                      //                   text: 'Terms',
                      //                   style: TextStyle(
                      //                     color: Colors.black,
                      //                     fontWeight: FontWeight.bold,
                      //                   ),
                      //                 ),
                      //                 TextSpan(
                      //                   text: ' and ',
                      //                   style: TextStyle(color: Colors.grey),
                      //                 ),
                      //                 TextSpan(
                      //                   text: 'Conditions',
                      //                   style: TextStyle(
                      //                     color: Colors.black,
                      //                     fontWeight: FontWeight.bold,
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //           const SizedBox(height: 20),
                      //           // Place Order Button
                      //           ElevatedButton(
                      //             onPressed: () {
                      //               Navigator.pushReplacement(
                      //                 context,
                      //                 MaterialPageRoute(
                      //                     builder: (_) =>
                      //                         const OrderAcceptedScreen()),
                      //               );
                      //             },
                      //             style: ElevatedButton.styleFrom(
                      //               backgroundColor: Colors.green,
                      //               minimumSize: const Size.fromHeight(50),
                      //               shape: RoundedRectangleBorder(
                      //                 borderRadius: BorderRadius.circular(12),
                      //               ),
                      //             ),
                      //             child: const Text(
                      //               'Place Order',
                      //               style: TextStyle(
                      //                   fontSize: 16, color: Colors.white),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     );
                      //   },
                      // );

                      showCheckoutBottomSheet(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Go to Checkout",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        Text(
                          "Rs. ${cart.totalPrice.toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
