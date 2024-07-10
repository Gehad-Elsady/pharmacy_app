class Medicine {
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final MedicineCategore categore;

  Medicine({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.categore,
  });
}

enum MedicineCategore {
  Antibiotics,
  Diabetes,
  Hygiene_And_Cosmetics,
  PainRelievers_And_AntiInflammatories,
  Baby_food,
  Eye_health
}
