class SpiceCategory {
  final int id;
  final String name;
  final String description;
  final String image;

  SpiceCategory({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });
}

class IndianSpice {
  final int categoryId;
  final int id;
  final String name;
  final String description;
  final String image;
  final String advantage;
  final String inconvenient;
  final String utilization;

  IndianSpice({
    required this.categoryId,
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.advantage,
    required this.inconvenient,
    required this.utilization,
  });
}

class Recipe {
  final int id;
  final String name;
  final String description;
  final String image;
  final String link;

  Recipe({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.link,
  });
}

// Sample data

// List of Spice Categories
final List<SpiceCategory> spiceCategories = [
  SpiceCategory(
    id: 1,
    name: "Épices Amères",
    description: "Épices qui apportent une saveur amère aux plats.",
    image: "assets/images/epices_ameres.png",
  ),
  SpiceCategory(
    id: 2,
    name: "Épices Piquantes",
    description: "Épices qui ajoutent du piquant et de la chaleur aux plats.",
    image: "assets/images/epices_piquantes.png",
  ),
  SpiceCategory(
    id: 3,
    name: "Épices Acidulées",
    description: "Épices qui ajoutent une touche acidulée aux recettes.",
    image: "assets/images/epices_acidulees.png",
  ),
  SpiceCategory(
    id: 4,
    name: "Épices Colorantes",
    description: "Épices utilisées principalement pour donner de la couleur aux plats.",
    image: "assets/images/epices_colorantes.png",
  ),
  SpiceCategory(
    id: 5,
    name: "Épices Aromatiques",
    description: "Épices riches en arômes et souvent utilisées pour parfumer les plats.",
    image: "assets/images/epices_aromatiques.png",
  ),
];

// List of Indian Spices
final List<IndianSpice> indianSpices = [
  // Épices Amères
  IndianSpice(
    categoryId: 1,
    id: 1,
    name: "Fenugrec",
    description: "Épice amère utilisée dans les currys et plats végétariens.",
    image: "assets/images/fenugrec.png",
    advantage: "Aide à la digestion et réduit le cholestérol.",
    inconvenient: "Peut être trop amer si mal dosé.",
    utilization: "Utilisé dans les currys ou pour aromatiser les légumes.",
  ),
  IndianSpice(
    categoryId: 1,
    id: 2,
    name: "Cumin",
    description: "Épice au goût légèrement amer et terreux.",
    image: "assets/images/cumin.png",
    advantage: "Favorise la digestion et réduit les ballonnements.",
    inconvenient: "Peut être dominant dans certaines recettes.",
    utilization: "Utilisé dans les currys, marinades et plats de riz.",
  ),

  // Épices Piquantes
  IndianSpice(
    categoryId: 2,
    id: 3,
    name: "Piment Rouge",
    description: "Épice piquante utilisée pour ajouter de la chaleur aux plats.",
    image: "assets/images/piment_rouge.png",
    advantage: "Stimule la circulation sanguine.",
    inconvenient: "Trop de piquant peut causer des irritations.",
    utilization: "Utilisé dans les currys et les sauces.",
  ),
  IndianSpice(
    categoryId: 2,
    id: 4,
    name: "Poivre Noir",
    description: "Épice piquante commune utilisée pour rehausser la saveur des plats.",
    image: "assets/images/poivre_noir.png",
    advantage: "Contient des antioxydants.",
    inconvenient: "Peut causer des irritations gastriques.",
    utilization: "Utilisé dans presque tous les plats pour ajouter du piquant.",
  ),

  // Épices Acidulées
  IndianSpice(
    categoryId: 3,
    id: 5,
    name: "Tamarin",
    description: "Fruit acide souvent utilisé dans les currys et chutneys.",
    image: "assets/images/tamarin.png",
    advantage: "Bon pour la digestion et riche en antioxydants.",
    inconvenient: "Peut être trop acide s'il est trop utilisé.",
    utilization: "Utilisé dans les sauces, chutneys, et currys.",
  ),
  IndianSpice(
    categoryId: 3,
    id: 6,
    name: "Citronnelle",
    description: "Épice au goût acidulé et rafraîchissant.",
    image: "assets/images/citronnelle.png",
    advantage: "Aide à la digestion et rafraîchit.",
    inconvenient: "Peut être trop prononcée dans certaines recettes.",
    utilization: "Utilisée dans les soupes et plats de poisson.",
  ),

  // Épices Colorantes
  IndianSpice(
    categoryId: 4,
    id: 7,
    name: "Curcuma",
    description: "Épice jaune vif utilisée pour colorer les plats.",
    image: "assets/images/curcuma.png",
    advantage: "Anti-inflammatoire et riche en antioxydants.",
    inconvenient: "Peut tacher les vêtements et surfaces.",
    utilization: "Utilisé dans les currys, soupes et riz.",
  ),
  IndianSpice(
    categoryId: 4,
    id: 8,
    name: "Safran",
    description: "L'une des épices les plus chères, utilisée pour sa couleur dorée.",
    image: "assets/images/safran.png",
    advantage: "Améliore l'humeur et réduit le stress.",
    inconvenient: "Très coûteux et nécessite une utilisation modérée.",
    utilization: "Utilisé dans les plats de riz et desserts.",
  ),

  // Épices Aromatiques
  IndianSpice(
    categoryId: 5,
    id: 9,
    name: "Cardamome",
    description: "Épice au parfum intense, souvent utilisée dans les desserts et le thé.",
    image: "assets/images/cardamome.png",
    advantage: "Améliore la digestion et l'haleine.",
    inconvenient: "Goût très fort qui peut ne pas plaire à tout le monde.",
    utilization: "Utilisé dans les desserts, thés, et currys.",
  ),
  IndianSpice(
    categoryId: 5,
    id: 10,
    name: "Cannelle",
    description: "Épice sucrée et aromatique utilisée dans les desserts et plats salés.",
    image: "assets/images/cannelle.png",
    advantage: "Propriétés anti-inflammatoires et antioxydantes.",
    inconvenient: "Peut être irritante pour la peau.",
    utilization: "Utilisée dans les desserts, boissons, et certains currys.",
  ),
];

// List of Recipes
final List<Recipe> recipes = [
  Recipe(
    id: 1,
    name: "Curry de Légumes",
    description: "Un curry riche et épicé avec des légumes de saison.",
    image: "assets/images/curry_legumes.png",
    link: "https://example.com/curry_legumes",
  ),
  Recipe(
    id: 2,
    name: "Poulet Tandoori",
    description: "Poulet mariné dans un mélange d'épices tandoori et cuit au four.",
    image: "assets/images/poulet_tandoori.png",
    link: "https://example.com/poulet_tandoori",
  ),
  Recipe(
    id: 3,
    name: "Riz Biriyani",
    description: "Riz parfumé aux épices avec des légumes ou de la viande.",
    image: "assets/images/riz_biriyani.png",
    link: "https://example.com/riz_biriyani",
  ),
];
