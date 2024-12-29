enum TypeBus {
  SLEEP(type: 'Sleep'),
  SIMPLE(type: 'Simple');

  final String type;
  const TypeBus({required this.type});
}

enum Seat {
  A1(seat: 'A1'),
  A2(seat: 'A2'),
  A3(seat: 'A3'),
  A4(seat: 'A4'),
  A5(seat: 'A5'),
  A6(seat: 'A6'),
  A7(seat: 'A7'),
  A8(seat: 'A8'),
  A9(seat: 'A9'),
  A10(seat: 'A10');

    final  String seat;
  const Seat({required this.seat});
}

enum Province {
  pp(province: 'Phnom Penh'),
  bt(province: 'Battambang'),
  kt(province: 'Kep'),
  ks(province: 'Koh Kong'),
  kp(province: 'Kampot'),
  sr(province: 'Siem Reap'),
  psh(province: 'Preah Sihanouk');

  final String province;
  const Province({required this.province});
}

class BookingTiket {
  late final String name;
  final String phone;
  final TypeBus type;
  final Seat seat;
  final Province provinceTo;
  final Province provinceFrom;
  final int quantity;
  final DateTime date;

  BookingTiket({
    required this.name,
    required this.phone,
    required this.type,
    required this.seat,
    required this.provinceTo,
    required this.provinceFrom,
    required this.quantity,
    required this.date,
  });

  factory BookingTiket.fromJson(Map<String, dynamic> json) {
    return BookingTiket(
      name: json['name'] as String,
      phone: json['phone'] as String,
      type: TypeBus.values.firstWhere((element) => element.type == json['type']),
      seat: Seat.values.firstWhere((element) => element.seat == json['seat']),
      provinceTo: Province.values.firstWhere((element) => element.province == json['provinceTo']),
      provinceFrom: Province.values.firstWhere((element) => element.province == json['provinceFrom']),
      quantity: json['quantity'] as int,
      date: DateTime.parse(json['date']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'type': type.type,
      'seat': seat.seat,
      'provinceTo': provinceTo.province,
      'provinceFrom': provinceFrom.province,
      'quantity': quantity,
      'date': date.toIso8601String(),
    };
  }

}


