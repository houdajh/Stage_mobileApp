

import 'package:flutter/material.dart';
import 'package:shop_app/screens/details/components/form_screen.dart';
import 'package:shop_app/screens/details/details_screen.dart';

class Order extends StatelessWidget {
  static String routeName = "/order";
  @override
  Widget build(BuildContext context) {
   // final ProductDetailsArguments agrs =
       // ModalRoute.of(context).settings.arguments;
    return MaterialApp(
      title: 'place an order',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: FormScreen(),
    );
  }
}