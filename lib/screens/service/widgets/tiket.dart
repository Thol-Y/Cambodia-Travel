import 'package:cambodia_travel/screens/service/widgets/cart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../model/booking_tiket.dart';
import 'booking_form.dart';
import 'dart:convert';



class ShowTickets extends StatefulWidget {
  const ShowTickets({super.key});

  @override
  State<ShowTickets> createState() => _ShowTicketsState();
}

class _ShowTicketsState extends State<ShowTickets> {
  final List<BookingTiket> _bookedTickets = [];

  @override
  void initState() {
    super.initState();
    _loadTickets();
  }

  Future<void> _loadTickets() async {
    final prefs = await SharedPreferences.getInstance();
    final ticketsString = prefs.getString('bookedTickets');
    if (ticketsString != null && ticketsString.isNotEmpty) {
      final List<dynamic> ticketsJson = jsonDecode(ticketsString);
      setState(() {
        _bookedTickets.addAll(ticketsJson.map((json) => BookingTiket.fromJson(json)).toList());
      });
    }
  }

  Future<void> _saveTickets() async {
    final prefs = await SharedPreferences.getInstance();
    final ticketsJson = jsonEncode(_bookedTickets.map((ticket) => ticket.toJson()).toList());
    await prefs.setString('bookedTickets', ticketsJson);
  }

  void removedTicket(int index) {
    final removedTicket = _bookedTickets.removeAt(index);
    _saveTickets();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Text('Ticket for ${removedTicket.name} has been deleted!'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _bookedTickets.insert(index, removedTicket);
                _saveTickets();
              });
            })));
  }

  Future<void> _addTicket() async {
    final newTicket = await Navigator.of(context).push<BookingTiket>(
      MaterialPageRoute(
        builder: (ctx) => const BookingForm(mode: Mode.add),
      ),
    );

    if (newTicket != null) {
      setState(() {
        _bookedTickets.add(newTicket);
        _saveTickets();
      });
    }
  }

  Future<void> _editTicket(int index) async {
    final editedTicket = await Navigator.of(context).push<BookingTiket>(
      MaterialPageRoute(
        builder: (ctx) => BookingForm(
          mode: Mode.edit,
          booking: _bookedTickets[index],
        ),
      ),
    );

    if (editedTicket != null) {
      setState(() {
        _bookedTickets[index] = editedTicket;
        _saveTickets();
      });
    }
  }

  double calculateTotalPrice() {
    double total = 0.0;
    for (var ticket in _bookedTickets) {
      double price = ticket.type == TypeBus.SLEEP ? 20.0 : 13.0;
      total += price;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booked Tickets'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
              tooltip: 'Booking Ticket',
              onPressed: _addTicket,
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ))
        ],
      ),
      body: _bookedTickets.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.confirmation_number, size: 100, color: Colors.teal),
                  SizedBox(height: 16),
                  Text('No tickets booked yet!',
                      style: TextStyle(fontSize: 20)),
                ],
              ),
            )
          : ListView.builder(
              itemCount: _bookedTickets.length,
              itemBuilder: (context, index) {
                final ticket = _bookedTickets[index];

                double price;
                if (ticket.type == TypeBus.SLEEP) {
                  price = 20.0;
                } else {
                  price = 13.0;
                }

                return Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.confirmation_number,
                            size: 40, color: Colors.teal),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ticket.name,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                '${ticket.type.type} | Seat: ${ticket.seat.seat}',
                                style: const TextStyle(fontSize: 12),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'From: ${ticket.provinceFrom.province}',
                                    style: const TextStyle(fontSize: 12),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'To: ${ticket.provinceTo.province}',
                                    style: const TextStyle(fontSize: 12),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              Text(
                                'Date: ${DateFormat('yyyy-MM-dd').format(ticket.date)}',
                                style: const TextStyle(fontSize: 12),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '\$${price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              //  'Edit Ticket',
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () => _editTicket(index),
                            ),
                            IconButton(
                              //  'Delete Ticket',
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  removedTicket(index);
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      // Pay Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            final totalPrice = calculateTotalPrice();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CartPage(
                  tickets: _bookedTickets,
                  totalPrice: totalPrice,
                ),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: const Text(
            'Pay Now',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}