import 'package:flutter/material.dart';
import '../../../model/booking_tiket.dart';

class CartPage extends StatelessWidget {
  final List<BookingTiket> tickets;
  final double totalPrice;

  const CartPage({
    super.key,
    required this.tickets,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Summary'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // List of tickets
            Expanded(
              child: ListView.builder(
                itemCount: tickets.length,
                itemBuilder: (context, index) {
                  final ticket = tickets[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    elevation: 8.0,
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                      leading: const Icon(
                        Icons.directions_bus, // Bus icon
                        color: Colors.teal,
                        size: 32.0,
                      ),
                      title: Row(
                        children: [
                          Text(
                            ticket.name,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          
                          
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bus Type: ${ticket.type.type} | Seat: ${ticket.seat.seat}',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14.0,
                            ),
                          ),
                          const SizedBox(height: 6),
                          
                          
                        ],
                      ),
                      trailing: Text(
                        '\$${ticket.type == TypeBus.SLEEP ? 20.0 : 13.0}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // Total Price
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Total: \$${totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Payment Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing payment')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    vertical: 14.0,
                    horizontal: 32.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Complete Payment',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
