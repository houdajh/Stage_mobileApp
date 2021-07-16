import 'package:flutter/material.dart';

import '../size_config.dart';

class Categorie {
  final int id;
  final String title;
  final String image;

  Categorie({
    @required this.id,
    @required this.image,
    @required this.title,
  });
}

// Our demo Products

List<Categorie>  demoCategories = [
  Categorie(
    id: 1,
    image: "https://wristreview.com/wp-content/uploads/2016/08/Swatch-Sistem51-Irony-Steel-1.jpg",
    title: "Wireless PS4™",
  ),
  Categorie(
    id: 2,
    image:"https://fdn.gsmarena.com/imgroot/news/20/05/samsung-galaxy-note-20-plus-renders/-315x315/gsmarena_003.jpg",
    title: "Nike Sport",
  ),
  Categorie(
    id: 3,
    image: "https://hips.hearstapps.com/amv-prod-gp.s3.amazonaws.com/gearpatrol/wp-content/uploads/2019/10/Buy-a-Kia-Telluride-Instead-gear-patrol-slide-1.jpg?crop=0.620xw:0.919xh;0.293xw,0.0813xh&resize=640:*",
    title: "Gloves XC Omega - Polygon",
  ),
  Categorie(
    id: 4,
    image:"https://hips.hearstapps.com/amv-prod-gp.s3.amazonaws.com/gearpatrol/wp-content/uploads/2019/10/Buy-a-Kia-Telluride-Instead-gear-patrol-slide-1.jpg?crop=0.620xw:0.919xh;0.293xw,0.0813xh&resize=640:*",
    title: "Logitech Head",
  ),
];


