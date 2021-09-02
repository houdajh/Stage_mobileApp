import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/components/form_screen.dart';
import 'package:shop_app/size_config.dart';
import 'package:like_button/like_button.dart';
import 'comment.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'product_images.dart';

/*class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BodyScreen(),
      ),
    );
  }
}*/

class BodyScreen extends StatefulWidget {
  final Product product;
  BodyScreen({Key key, @required this.product}) : super(key: key);

  @override
  State<BodyScreen> createState() => _BodyScreen(product: this.product);
}

class _BodyScreen extends State<BodyScreen> {
  final Product product;
  final _auth = FirebaseAuth.instance;

  List<String> ListID = [];

  User userData = FirebaseAuth.instance.currentUser;

  CollectionReference usersRef = FirebaseFirestore.instance.collection("users");
  CollectionReference postRef =
      FirebaseFirestore.instance.collection("produits");
  CollectionReference likesRef = FirebaseFirestore.instance.collection("likes");
  CollectionReference likesCounterRef =
      FirebaseFirestore.instance.collection("likesCounter");

  var likes;
  var fetchedValue;

  _BodyScreen({Key key, @required this.product});

  @override
  void initState() {
    fetchLikeValue();
  }

  Future<bool> fetchLikeValue() async {
    this.fetchedValue = await FirebaseFirestore.instance
        .collection('likes')
        .doc(userData.uid)
        .get()
        .then((value) => value.data()[product.id]);

    print(this.fetchedValue);
    return fetchedValue;
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    print("samiii");
    print("************** ${isLiked}");
    likesCounterRef
        .doc(product.id)
        .set(
          {
            userData.uid: !isLiked,
            "uid": product.id,
          },
          SetOptions(merge: true),
        )
        .then((value) => print("likesCounter")
            //  ListID.add(userData.uid)
            )
        .catchError((error) => print("Failed to modify like : $error"));

    likesRef
        .doc(userData.uid)
        .set(
          {
            product.id: !isLiked,
          },
          SetOptions(merge: true),
        )
        .then((value) => print("object")
            //  ListID.add(userData.uid)
            )
        .catchError((error) => print("Failed to modify like : $error"));

    return !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    FirebaseFirestore.instance
        .collection('likesCounter')
        .doc(product.id)
        .get()
        .then((value) {
      postRef
          .doc(product.id)
          .set(
            {
              "countlikes": value.data().length,
            },
            SetOptions(merge: true),
          )
          .then((value) => print("countlikes")
              //  ListID.add(userData.uid)
              )
          .catchError((error) => print("Failed to modify like : $error"));

      print(
          "voila: ${value.data().length}"); // Access your after your get the data
    });
    FirebaseFirestore.instance
        .collection('produits')
        .doc(product.id)
        .get()
        .then((value) {
      likes = value.data()["countlikes"];
      // Access your after your get the data
    });

    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          ProductImages(product: product),
          // Icon(Icons.favorite, color: Colors.black , size: 80.0 ),
          Container(
              width: double.infinity,
              height: size.height * 0.5,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Row(
                    children: [
                      SizedBox(
                        //height: getProportionateScreenWidth(30),
                        width: getProportionateScreenWidth(30),
                        child: Align(
                          alignment: Alignment.topRight,
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
                      Spacer(),
                      Container(
                        child: SizedBox(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: 5),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.45),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    child: Container(
                      width: 150,
                      height: 7,
                      decoration: BoxDecoration(
                          color: Color(0xFFFF4848),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                      width: getProportionateScreenWidth(64),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFE6E6),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: LikeButton(
                        onTap: onLikeButtonTapped,
                        isLiked: fetchedValue,
                        likeBuilder: (bool isLiked) {
                          return Icon(
                            Icons.favorite,
                            color: isLiked ? Colors.red : Colors.grey,
                            size: 30,
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    product.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              Text(
                                "\$" + product.price.toString(),
                                style: TextStyle(
                                    color: Colors.red[500],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                product.oldPrice.toString(),
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    decoration: TextDecoration.lineThrough),
                              ),
                            ],
                          ), //le prix old and new
                          Text(
                            " likes: ${product.countlikes}",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    product.description,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                      height: 1.5,
                    ),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                      width: getProportionateScreenWidth(64),
                      height: getProportionateScreenWidth(64),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFE6E6),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: IconButton(
                        icon: SvgPicture.asset(
                          "assets/icons/Conversation.svg",
                          color: Color(0xFFFF4848),
                          height: getProportionateScreenWidth(16),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TestMe()),
                          );
                        },
                      ),
                    ),
                  ),
                  DefaultButton(
                    text: 'ORDER',
                    press: () {
                      // A MaterialPageRoute is a  modal route that replaces the entire screen
                      // with a platform-adaptive transition.
                      var route = new MaterialPageRoute(
                        builder: (BuildContext context) => new FormScreen(
                            value: Product(
                          id: product.id,
                          title: product.title,
                        )),
                      );
                      Navigator.of(context).push(route);
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
