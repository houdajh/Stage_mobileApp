import 'package:flutter/material.dart';

import '../size_config.dart';

class Categorie {
  final String id;
  final String title;
  final String image;

  Categorie({
    @required this.id,
    @required this.image,
    @required this.title,
  });
}

// Our demo Products

List<Categorie>  demoCategories = [];


