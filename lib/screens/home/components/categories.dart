import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(items: [
      Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQj1IWFKsF7hOu1dGC6zQdLgMTV62afeZ-Avw&usqp=CAU",),
        width:double.maxFinite,
        fit: BoxFit.cover,),
      Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCxCt5L-PYZV8OBS2fknWZ6nH4oxcTcFLyOg&usqp=CAU"),
        width: double.infinity,fit: BoxFit.cover,),
      Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHVnabCQZ2FW7NPU7lYQDwypg4WUVSYdKcJvey6xHTAZi7d23uViJQnl7qI8lyT8VUyhw&usqp=CAU"),
        width: double.infinity,
        fit: BoxFit.cover,),
    ], options: CarouselOptions(
      initialPage: 0,
      height: 240,
      enableInfiniteScroll: true,
      autoPlay: true,
      viewportFraction: 1.0,
    ));

  }
}
