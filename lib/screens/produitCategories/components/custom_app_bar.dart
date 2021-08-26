import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/screens/home/components/section_title.dart';

import '../../../size_config.dart';

class CustomAppBar extends PreferredSize {

  CustomAppBar();

  @override
  // AppBar().preferredSize.height provide us the height that appy on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 7,bottom: 10),
              child: SizedBox(
                height: getProportionateScreenWidth(40),
                width: getProportionateScreenWidth(40),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  color: Colors.white,
                  padding: EdgeInsets.zero,
                  onPressed: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                    "assets/icons/Back ICon.svg",
                    height: 15,
                  ),

                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Retour",style: TextStyle(fontSize: 20),),
            ),
          ],
        ),
      ),
    );
  }
}
