class Bus {
  String img;
  String name;
  String description;
  String location;

  //static var length;

  Bus({
    required this.img,
    required this.name,
    required this.description,
    required this.location
  });
}

final List<Bus> busList = [
  Bus(
    img: 'images/larita.jpg',
    name: 'Larryta Express',
    description: 'Larryta Express is the leading and fastest-growing passenger transport bus company in Cambodia. It has a reputation as the most comfortable, safe, and reliable transportation service provider in the country.',
    location: 'Phnom Penh',
  ),
  Bus(
    img: 'images/buntham.jpg',
    name: 'Virak Buntham',
    description: 'Virak Buntham Express operates in Cambodia, Thailand, and Vietnam. The company offers bus tickets, hotel bookings, and tour packages.',
    location: 'Phnom Penh',
  ),
];
