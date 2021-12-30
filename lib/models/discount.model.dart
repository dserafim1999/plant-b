class Discount {
  int tokens;
  int percentage;
  String description;
  String location;
  String shop;
  String name;
  //String imageUrl;

  Discount({
    required this.tokens,
    required this.percentage,
    required this.description,
    required this.location,
    required this.shop,
    required this.name,
    //required this.imageUrl,
  });
}

List<Discount> discounts = [
  Discount(
    tokens: 100,
    percentage: 10,
    description: "kdsj dknd adnj jk vrj jjdnkmdc m scknsc mcnjknmsc k cjncek kjcn ik jm jkmrk mjrj f",
    location: "Leiria",
    shop: "Loja",
    name: "10% Off Trousers",
    //required this.imageUrl,
  ),
  Discount(
    tokens: 300,
    percentage: 20,
    description: "kdsj dknd adnj jk vrj jjdnkmdc m scknsc mcnjknmsc k cjncek kjcn ik jm jkmrk mjrj f",
    location: "Leiria",
    shop: "Loja",
    name: "20% Off Vegetables",
    //required this.imageUrl,
  ),
  Discount(
    tokens: 500,
    percentage: 20,
    description: "kdsj dknd adnj jk vrj jjdnkmdc m scknsc mcnjknmsc k cjncek kjcn ik jm jkmrk mjrj f",
    location: "Leiria",
    shop: "Loja",
    name: "10% Off Cardigans",
    //required this.imageUrl,
  ),
  Discount(
    tokens: 200,
    percentage: 10,
    description: "kdsj dknd adnj jk vrj jjdnkmdc m scknsc mcnjknmsc k cjncek kjcn ik jm jkmrk mjrj f",
    location: "Leiria",
    shop: "Loja",
    name: "10% Off Beer",
    //required this.imageUrl,
  ),
  Discount(
    tokens: 100,
    percentage: 10,
    description: "kdsj dknd adnj jk vrj jjdnkmdc m scknsc mcnjknmsc k cjncek kjcn ik jm jkmrk mjrj f",
    location: "Leiria",
    shop: "Loja",
    name: "10% Off Eco Toilet Paper and other stuff to test spacing",
    //required this.imageUrl,
  ),
];