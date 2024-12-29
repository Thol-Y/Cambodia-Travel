import 'package:flutter/material.dart';

class PaymentOptionsScreen extends StatelessWidget {
  const PaymentOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Choose Payment Method')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showPaymentOptionsDialog(context);
          },
          child: const Text('Pay Now'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,  
            padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 32.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }

  void _showPaymentOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choose Payment Method'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.qr_code),
              title: const Text('Pay with QR'),
              onTap: () {
                Navigator.pop(context); // Close the dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QRPaymentScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.credit_card),
              title: const Text('Pay with Visa'),
              onTap: () {
                Navigator.pop(context); // Close the dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VisaPaymentScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// QR Payment Screen (for simplicity)
class QRPaymentScreen extends StatelessWidget {
  const QRPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Payment')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Center(
                child: Icon(Icons.qr_code, size: 80, color: Colors.teal),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Scan the QR code to complete your payment.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Proceeding with QR payment')));
              },
              child: const Text('Proceed with QR Payment'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,  
                padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 32.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class VisaPaymentScreen extends StatelessWidget {
  const VisaPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Visa Payment')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Container(
              width: 300,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.blue[700],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Center(
                child: Icon(Icons.credit_card, size: 80, color: Colors.white),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Enter your Visa card details to complete the payment.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Proceeding with Visa payment')));
              },
              child: const Text('Proceed with Visa Payment'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],  
                padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 32.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
