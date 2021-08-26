

import 'package:flutter/material.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/screens/wishlist/wishlist_empty.dart';
import 'package:shop_app/screens/wishlist/wishlist_full.dart';

import '../../enums.dart';

class wishlist extends StatelessWidget {
  static String routeName = "/wish";
  @override
  Widget build(BuildContext context) {
    List wishlistList = [];
    return wishlistList.isNotEmpty
    ?Scaffold(
      body: WishlistEmpty()
      )
      :Scaffold(
        appBar : AppBar(
          title : Text("wishlist"),
        ),
        body : ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext ctx, int index ){
            return WishlistFull();
          },
        ),
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.favourite),
      );
  }
}