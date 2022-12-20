class CoffeeModel {
  String? name;
  String? subname;
  double? price;
  double? rating;
  String? assetImage;

  CoffeeModel({
    this.name,
    this.subname,
    this.price,
    this.rating,
    this.assetImage
  });
}

List<CoffeeModel>? coffeeListItems = [
  CoffeeModel(
      assetImage: 'assets/images/espresso_optimized.png',
      name: 'Espresso',
      price: 35.5,
      rating: 4.8,
      subname: 'Americano Coffee'
  ),
  CoffeeModel(
      assetImage: 'assets/images/cappuchino2_optimized.png',
      name: 'Espresso',
      price: 37.5,
      rating: 4.1,
      subname: 'Original Espresso'
  ),
  CoffeeModel(
      assetImage: 'assets/images/espresso1_optimized.png',
      name: 'Espresso',
      price: 30,
      rating: 4.8,
      subname: 'With 2/3 Milk'
  ),
  CoffeeModel(
      assetImage: 'assets/images/cappuchino4_optimized.png',
      name: 'Espresso',
      price: 42.5,
      rating: 4.9,
      subname: 'With 1/3 Milk'
  ),
];

List<CoffeeModel> cappuListItems = [
  CoffeeModel(
      assetImage: 'assets/images/cappuchino1_optimized.png',
      name: 'Cappuccino',
      price: 50,
      rating: 5.0,
      subname: 'Original Cappuccino'
  ),
  CoffeeModel(
      assetImage: 'assets/images/cappuchino3_optimized.png',
      name: 'Cappuccino',
      price: 54.3,
      rating: 5.0,
      subname: 'With 1/3 Milk'
  ),
];

List<CoffeeModel> macchListItems = [
  CoffeeModel(
      assetImage: 'assets/images/macchiato1_optimized.png',
      name: 'Macchiato',
      price: 35.1,
      rating: 4.2,
      subname: 'With 2/3 Milk'
  ),
  CoffeeModel(
      assetImage: 'assets/images/macchiato2_optimized.png',
      name: 'Macchiato',
      price: 50,
      rating: 5.0,
      subname: 'With 1/3 Cocoa, & 1/3 Milk'
  ),
];

List<CoffeeModel> nesListItems = [
  CoffeeModel(
      assetImage: 'assets/images/nescofe_optimized.png',
      name: 'Nescafe',
      price: 30,
      rating: 4.8,
      subname: 'With 2/3 Milk, & 1/3 suger'
  ),
];
