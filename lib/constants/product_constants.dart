class ProductConstants {
  static const String name = 'Name';
  static const String price = 'Price';
  static const String category = 'Category';
  static const String description = 'Description';
  static const String quantity = 'Quantity';
  static const List<String> categoryItems = <String>[
    'Food',
    'Clothing',
    'Handicraft',
    'Grocery',
    'Fashion-and-Jewellery',
    'Beauty',
    'Kitchen-supplies',
    'Organic',
    'Others'
  ];
  static var categoryMap = {
    'Food': 1,
    'Clothing': 2,
    'Handicraft': 3,
    'Grocery': 4,
    'Fashion-and-Jewellery': 5,
    'Beauty': 6,
    'Kitchen-supplies': 7,
    'Organic': 8,
    'Others': 9
  };
}
