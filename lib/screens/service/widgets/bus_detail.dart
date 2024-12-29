import 'package:cambodia_travel/model/service.dart';
import 'package:cambodia_travel/screens/service/widgets/tiket.dart';
import 'package:flutter/material.dart';

class BusDetail extends StatelessWidget {
  const BusDetail({super.key, required this.bus});
  final Bus bus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Details'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Bus Image
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(bus.img), 
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bus.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    bus.description, 
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),

                  // Location Info
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        bus.location, 
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  
                  const Text(
                    'Additional bus details can be added here.',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 20),
                  //button booking teket bus
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ShowTickets(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Text('Book Ticket'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
