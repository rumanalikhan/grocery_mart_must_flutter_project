import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:grocery_mart/features/order/order_accepted_screen.dart';
import 'package:grocery_mart/providers/cart_provider.dart';

void showCheckoutBottomSheet(BuildContext context) {
  final cart = Provider.of<CartProvider>(context, listen: false);

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    backgroundColor: Colors.white,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Checkout',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Deliver", style: TextStyle(fontSize: 16)),
                Row(
                  children: [
                    Text("Select Method",
                        style: TextStyle(color: Colors.black)),
                    Icon(Icons.chevron_right, color: Colors.grey),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Payment", style: TextStyle(fontSize: 16)),
                Row(
                  children: [
                    Icon(Icons.credit_card, size: 20, color: Colors.grey),
                    SizedBox(width: 6),
                    Icon(Icons.chevron_right, color: Colors.grey),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Promo Code", style: TextStyle(fontSize: 16)),
                Row(
                  children: [
                    Text("Pick Discount",
                        style: TextStyle(color: Colors.black)),
                    Icon(Icons.chevron_right, color: Colors.grey),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total Cost",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('Rs. ${cart.totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 20),
            const Text.rich(
              TextSpan(
                text: 'By placing an order you agree to our ',
                style: TextStyle(color: Colors.grey, fontSize: 12),
                children: [
                  TextSpan(
                    text: 'Terms',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' and ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextSpan(
                    text: 'Conditions',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const OrderAcceptedScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Place Order',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      );
    },
  );
}
