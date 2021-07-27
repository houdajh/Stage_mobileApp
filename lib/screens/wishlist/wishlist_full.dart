import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/constants.dart';

class WishlistFull extends StatefulWidget {
  final String productId;

  const WishlistFull({this.productId});
  @override
  _WishlistFullState createState() => _WishlistFullState();
}

class _WishlistFullState extends State<WishlistFull> {
  @override
  Widget build(BuildContext context) {
   // final favsAttr = Provider.of<FavsAttr>(context);
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: 30.0, bottom: 10.0),
          child: Material(
            color: Theme.of(context).backgroundColor,
            //color: kTextColor,
            borderRadius: BorderRadius.circular(5.0),
            elevation: 3.0,
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 80,
                      child: Image.network("https://wristreview.com/wp-content/uploads/2016/08/Swatch-Sistem51-Irony-Steel-1.jpg"),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "wish",
                            //favsAttr.title,
                            style: TextStyle(
                                fontSize: 16.0, 
                                fontWeight: FontWeight.bold
                                ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "\$ ${130}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, 
                                fontSize: 18.0,
                                color:  Color(0xFFFFECDF)
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        positionedRemove(widget.productId),
      ],
    );
  }

  Widget positionedRemove(String productId) {
   // final favsProvider = Provider.of<FavsProvider>(context);
   // GlobalMethods globalMethods = GlobalMethods();
    return Positioned(
      top: 20,
      right: 15,
      child: Container(
        height: 30,
        width: 30,
        child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            padding: EdgeInsets.all(0.0),
            color: Color(0xFFFF7643),
            child: Icon(
              Icons.clear,
              color: Colors.white,
            ),
            onPressed: () => {
                  //globalMethods.showDialogg(
                     // 'Remove wish!',
                     // 'This product will be removed from your wishlist!',
                    //  () => favsProvider.removeItem(productId),
                   //   context),
                }
                ),
      ),
    );
  }
}