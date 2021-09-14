import 'package:flutter/material.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/search/search.dart';
import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //SearchField(),
          Expanded(child: Text('ParisJJ', style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 26.0),),
          ),
         // IconBtnWithCounter(
           // svgSrc: "assets/icons/Cart Icon.svg",
           // numOfitem: 3,
          //  press: () => Navigator.pushNamed(context, CartScreen.routeName),
         // ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: IconBtnWithCounter(
              svgSrc: "assets/icons/Search Icon.svg",
              press: () {return Navigator.pushNamed(context, PastTripsView.routeName);},
            ),
          ),
        ],
      ),
    );
  }
}

