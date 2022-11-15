class BreweryModel {
  final String id;
  final String name;
  final String descripTion;
  final String image;
  final String address;
  final String latitude;
  final String longitude;

  BreweryModel({
    required this.id,
    required this.name,
    required this.descripTion,
    required this.image,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  factory BreweryModel.fromJsonNotData() => BreweryModel(
      id: '1',
      name: 'Cervecería Lateral Calle 65',
      descripTion: 'Cerveceria tradicional ubicada en la calle 65, con una gran variedad de cervezas ',
      image:'https://www.elcolombiano.com/binrepository/780x856/0c179/780d565/none/11101/WGDY/cerveza-de-papa_40666541_20220912121055.jpg',
       address: 'Cl. 65 #3B-07, Bogotá, D.C, Bogotá',
      latitude: '100',
      longitude: '50');
}
