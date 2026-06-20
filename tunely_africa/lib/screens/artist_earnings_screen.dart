import 'package:flutter/material.dart';

class ArtistEarningsScreen extends StatefulWidget {
  const ArtistEarningsScreen({super.key});

  @override
  State<ArtistEarningsScreen> createState() => _ArtistEarningsScreenState();
}

class _ArtistEarningsScreenState extends State<ArtistEarningsScreen> {
  double totalEarnings = 250.75;
  double streamsRevenue = 150.50;
  double downloadsRevenue = 75.25;
  double pendingRevenue = 25.0;

  void withdrawEarnings() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Withdraw Earnings'),
          content: Text(
              'Your available earnings: \$${totalEarnings.toStringAsFixed(2)}\nDo you want to withdraw now?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Withdrawal request submitted!'),
                  ),
                );
              },
              child: const Text('Withdraw'),
            ),
          ],
        );
      },
    );
  }

  Widget revenueCard(String title, double amount, Color color) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: color)),
          const SizedBox(height: 8),
          Text('\$${amount.toStringAsFixed(2)}',
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artist Earnings'),
        backgroundColor: Colors.green[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            revenueCard('Total Earnings', totalEarnings, Colors.green),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                    child: revenueCard('Streams Revenue', streamsRevenue, Colors.blue)),
                const SizedBox(width: 12),
                Expanded(
                    child: revenueCard('Downloads Revenue', downloadsRevenue, Colors.orange)),
              ],
            ),
            const SizedBox(height: 12),
            revenueCard('Pending Revenue', pendingRevenue, Colors.red),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: withdrawEarnings,
              icon: const Icon(Icons.payment),
              label: const Text('Withdraw Earnings'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: Colors.green[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}