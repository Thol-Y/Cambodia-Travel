import 'package:cambodia_travel/model/service.dart';
import 'package:cambodia_travel/screens/service/widgets/bus_cart.dart';
import 'package:cambodia_travel/screens/service/widgets/cart.dart';
import 'package:flutter/material.dart';

import '../../model/booking_tiket.dart';

class Service extends StatefulWidget {
  const Service({super.key});

  @override
  _ServiceState createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  final List<BookingTiket> _bookedTickets = [];  
  double totalPrice = 0.0; 

  double calculateTotalPrice() {
    return _bookedTickets.fold(0.0, (sum, ticket) {
      return sum + (ticket.type == TypeBus.SLEEP ? 20.0 : 13.0);  
    });
  }
  void updateTotalPrice() {
    totalPrice = _bookedTickets.fold(0.0, (sum, ticket) {
      return sum + (ticket.type == TypeBus.SLEEP ? 20.0 : 13.0);  
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Bar
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Service',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    Column(
                      children: [
                       
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            IconButton(
                              onPressed: () {
                                
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CartPage(
                                      tickets: _bookedTickets, 
                                      totalPrice: totalPrice, 
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.shopping_cart),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    '${_bookedTickets.length}', 
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Search Bar
                Container(
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Bus List Section
          Expanded(
            child: BusCart(
              busList: busList,
              onTicketSelected: (ticket) {
                setState(() {
                  _bookedTickets.add(ticket);
                  updateTotalPrice(); 
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
