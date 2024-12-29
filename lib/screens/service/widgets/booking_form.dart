import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../model/booking_tiket.dart';

enum Mode {
  add,
  edit,
}

class BookingForm extends StatefulWidget {
  const BookingForm({super.key, this.booking, required this.mode,});
  
  final BookingTiket? booking;
  final Mode mode;

  @override
  State<BookingForm> createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _quantityController = TextEditingController();

  TypeBus? _selectedTypeBus;
  Seat? _selectedSeat;
  Province? _selectedFromProvince;
  Province? _selectedToProvince;
  DateTime? _selectedDate;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.mode == Mode.edit && widget.booking != null) {
      _nameController.text = widget.booking!.name;
      _phoneController.text = widget.booking!.phone;
      _quantityController.text = widget.booking!.quantity.toString();
      _selectedTypeBus = widget.booking!.type;
      _selectedSeat = widget.booking!.seat;
      _selectedToProvince = widget.booking!.provinceTo;
      _selectedFromProvince = widget.booking!.provinceFrom;
      _selectedDate = widget.booking!.date;
    }
  }

  Future<void> _pickDate() async {
    DateTime now = DateTime.now();
    DateTime twelveYearsLater = DateTime(now.year + 12, now.month, now.day);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: twelveYearsLater,
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _saveTicket() {
    bool isValidate = _formKey.currentState!.validate();
    if (isValidate) {
      _formKey.currentState!.save();
      final newBooking = BookingTiket(
        name: _nameController.text,
        phone: _phoneController.text,
        type: _selectedTypeBus!,
        seat: _selectedSeat!,
        provinceTo: _selectedToProvince!,
        provinceFrom: _selectedFromProvince!,
        quantity: int.parse(_quantityController.text),
        date: _selectedDate!,
      );
      Navigator.of(context).pop(newBooking);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.mode == Mode.edit;
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Your Ticket' : 'Book Your Ticket'),
        // centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Passenger Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (!RegExp(r'^[0-9]{9,10}$').hasMatch(value)) {
                      return 'Please enter a valid phone number (9-10 digits)';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                const Text(
                  'Bus Information',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<TypeBus>(
                        value: _selectedTypeBus,
                        decoration: const InputDecoration(
                          labelText: 'Bus Type',
                          border: OutlineInputBorder(),
                        ),
                        items: TypeBus.values.map((type) {
                          return DropdownMenuItem(
                            value: type,
                            child: Text(type.type),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedTypeBus = value;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Please select a bus type';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: DropdownButtonFormField<Seat>(
                        value: _selectedSeat,
                        decoration: const InputDecoration(
                          labelText: 'Seat',
                          border: OutlineInputBorder(),
                        ),
                        items: Seat.values.map((seat) {
                          return DropdownMenuItem(
                            value: seat,
                            child: Text(seat.seat),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedSeat = value;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Please select a seat';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _pickDate,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text(
                          _selectedDate == null
                              ? 'Select Travel Date'
                              : DateFormat('yyyy-MM-dd').format(_selectedDate!),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<Province>(
                        value: _selectedFromProvince,
                        decoration: const InputDecoration(
                          labelText: 'From',
                          border: OutlineInputBorder(),
                        ),
                        items: Province.values.map((province) {
                          return DropdownMenuItem(
                            value: province,
                            child: Text(province.province),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedFromProvince = value;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Please select the departure province';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: DropdownButtonFormField<Province>(
                        value: _selectedToProvince,
                        decoration: const InputDecoration(
                          labelText: 'To',
                          border: OutlineInputBorder(),
                        ),
                        items: Province.values.map((province) {
                          return DropdownMenuItem(
                            value: province,
                            child: Text(province.province),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedToProvince = value;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Please select the destination province';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _quantityController,
                  decoration: const InputDecoration(
                    labelText: 'Number of Tickets',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.confirmation_number),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the ticket quantity';
                    }
                    if (int.tryParse(value) == null || int.parse(value) <= 0) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 32,
                      ),
                      backgroundColor: Colors.teal,
                    ),
                    onPressed: _saveTicket,
                    child: Text(
                      isEdit ? 'Update Ticket' : 'Booking now',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}