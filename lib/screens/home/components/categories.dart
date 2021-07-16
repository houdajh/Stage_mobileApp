import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> ImagesProductPromo = [
      {"icon": "assets/icons/Flash Icon.svg", "text": "Flash Deal"},
      {"icon": "assets/icons/Bill Icon.svg", "text": "Bill"},
      {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
      {"icon": "assets/icons/Discover.svg", "text": "More"},
    ];
    return CarouselSlider(items: [
      Image(image: NetworkImage("https://image.freepik.com/vecteurs-libre/affiche-pour-promotion-produits-cosmetiques-hydratants-nourrissants_1441-229.jpg",),
        width:double.maxFinite,
        fit: BoxFit.cover,),
      Image(image: NetworkImage("https://dailygeekshow.com/wp-content/uploads/2019/11/une-promos-gearbest-1024x538.jpg"),
        width: double.infinity,fit: BoxFit.cover,),
      Image(image: NetworkImage("https://media.istockphoto.com/photos/cosmetics-set-with-promotion-frame-picture-id854034416"),
        width: double.infinity,
        fit: BoxFit.cover,),
    ], options: CarouselOptions(
      initialPage: 0,
      height: 240,
      enableInfiniteScroll: true,
      autoPlay: true,
      viewportFraction: 1.0,
    ));
    //   Padding(
    //   padding: EdgeInsets.all(getProportionateScreenWidth(20)),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: List.generate(
    //       categories.length,
    //       (index) => CategoryCard(
    //         icon: categories[index]["icon"],
    //         text: categories[index]["text"],
    //         press: () {},
    //       ),
    //     ),
    //   ),
    // );
  }
}
