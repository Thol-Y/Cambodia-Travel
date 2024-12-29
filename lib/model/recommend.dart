class Recommend {
  final String img;
  final String name;
  final String location;
  final String description;
  final double views;

  Recommend({
    required this.img,
    required this.name,
    required this.location,
    required this.description,
    required this.views,
  });
}

List<Recommend> recommend = [
  Recommend(
    img: 'images/recom1.jpg',
    name: 'Angkor Wat',
    location: 'Siem Reap',
    description:
        'Angkor Wat, a UNESCO World Heritage Site, is the largest and most iconic temple complex in Cambodia. Built in the early 12th century, it showcases exquisite Khmer architecture and intricate carvings. It remains a symbol of national pride and spirituality.',
    views: 100,
  ),
  Recommend(
    img: 'images/recom2.jpg',
    name: 'Koh Tonsay (Rabbit Island)',
    location: 'Kep',
    description:
        'Koh Tonsay, or Rabbit Island, is a tranquil getaway in Kep Province. Known for its pristine beaches and crystal-clear waters, it is perfect for relaxing, swimming, and enjoying fresh seafood.',
    views: 75,
  ),
  Recommend(
    img: 'images/recom3.jpg',
    name: 'Bamboo Train',
    location: 'Battambang',
    description:
        'The Bamboo Train, or Norry, is a unique and fun experience in Battambang Province. It offers a ride through the countryside on bamboo platforms powered by small engines.',
    views: 80,
  ),
  Recommend(
    img: 'images/recom4.jpg',
    name: 'Otres Beach',
    location: 'Koh Kong',
    description:
        'Otres Beach is a serene and beautiful beach in Koh Kong Province, offering golden sands and a peaceful environment for relaxation or water sports.',
    views: 65,
  ),
  Recommend(
    img: 'images/recom5.jpg',
    name: 'Mekong Dolphin Watching',
    location: 'Kratie',
    description:
        'Experience the rare and majestic Irrawaddy dolphins in the Mekong River near Kratie. A must-visit for nature lovers and wildlife enthusiasts.',
    views: 85,
  ),
  Recommend(
    img: 'images/recom6.jpg',
    name: 'Yeak Laom Lake',
    location: 'Ratanakiri',
    description:
        'Yeak Laom Lake, a volcanic crater lake in Ratanakiri, is surrounded by lush jungle. It is a peaceful spot for swimming and picnicking while enjoying nature.',
    views: 70,
  ),
  Recommend(
    img: 'images/recom7.jpg',
    name: 'Royal Palace',
    location: 'Phnom Penh',
    description:
        'The Royal Palace in Phnom Penh is a stunning complex of traditional Khmer architecture. It is the official residence of the Cambodian King and a symbol of the nation’s heritage.',
    views: 90,
  ),
  Recommend(
    img: 'images/recom8.jpg',
    name: 'Preah Vihear Temple',
    location: 'Preah Vihear',
    description:
        'Preah Vihear Temple, located atop a mountain on the Cambodian-Thai border, is an ancient Khmer temple known for its breathtaking views and historical significance.',
    views: 95,
  ),
  Recommend(
    img: 'images/recom9.jpg',
    name: 'Koh Rong',
    location: 'Sihanoukville',
    description:
        'Koh Rong is a paradise island near Sihanoukville, famous for its white sandy beaches, vibrant nightlife, and turquoise waters. Perfect for adventure and relaxation.',
    views: 120,
  ),
  Recommend(
    img: 'images/recom11.jpg',
    name: 'Phnom Yat',
    location: 'Pailin',
    description:
        'Phnom Yat is a sacred hill in Pailin, featuring temples and stunning views. It is a peaceful spot for spiritual reflection and sightseeing.',
    views: 50,
  ),
];
