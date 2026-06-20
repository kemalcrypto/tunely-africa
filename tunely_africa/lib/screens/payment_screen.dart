import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Rangi kuu kutoka kwenye logo yako ya Tunely Africa
    const Color brandGreen = Color(0xFF39E75F); 
    const Color bgBlack = Color(0xFF0D0D0D);
    const Color cardGrey = Color(0xFF1A1A1A);

    return Scaffold(
      backgroundColor: bgBlack,
      appBar: AppBar(
        backgroundColor: bgBlack,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Choose Payment Method',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            // M-Pesa Row
            _buildPaymentCard('M-Pesa', Icons.phone_android, brandGreen, cardGrey),
            _buildPaymentCard('Airtel Money', Icons.phone_iphone, Colors.red, cardGrey),
            _buildPaymentCard('Tigo Pesa', Icons.account_balance_wallet, Colors.blue, cardGrey),
            _buildPaymentCard('HaloPesa', Icons.phonelink_ring, Colors.orange, cardGrey),
            _buildPaymentCard('Card Payment', Icons.credit_card, Colors.white, cardGrey),
            
            const Spacer(),
            
            // Footer: Secure payment powered by flutterwave
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.lock_outline, color: Colors.grey, size: 16),
                    const SizedBox(width: 5),
                    Text(
                      'Secure payment powered by',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const Text(
                  'flutterwave',
                  style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentCard(String name, IconData icon, Color iconColor, Color bgColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(
          name,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
        onTap: () {
          // Mantiki ya kubonyeza itafanyika hapa
        },
      ),
    );
  }
}