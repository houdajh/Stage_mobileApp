import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/components/product_card.dart';

import '../../models/Product.dart';
import '../../size_config.dart';
import 'components/body.dart';
import 'components/comment.dart';
import 'components/custom_app_bar.dart';


class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({@required this.product});
}
 class DetailPage extends StatefulWidget {
   static String routeName = "/details";
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          
          Container(
            
            width: double.infinity,
            height: size.height * 0.5,
            
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage("https://wristreview.com/wp-content/uploads/2016/08/Swatch-Sistem51-Irony-Steel-1.jpg"),
                  //Image(image: NetworkImage("https://wristreview.com/wp-content/uploads/2016/08/Swatch-Sistem51-Irony-Steel-1.jpg"),
                  
                  fit: BoxFit.cover),
            ),
           
             child: SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
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
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
                      
              child: Row(
                children: [
                  Text(
                    "4.9",
                    style: const TextStyle(
                      color : Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 5),
                  SvgPicture.asset("assets/icons/Star Icon.svg"),
                  
                ],
                ),
              ),
            ),
            ),
            )
          ],
        ),
      ),
    )
          ),
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
                           color: Color(0xFFFF4848) ,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(15)),
            width: getProportionateScreenWidth(64),
            decoration: BoxDecoration(
              color: Color(0xFFFFE6E6) ,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: SvgPicture.asset(
              "assets/icons/Heart Icon_2.svg",
              color: Color(0xFFFF4848) ,
              height: getProportionateScreenWidth(16),
            ),
            
                        ),
                        
                      ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "10 best interior ideas for your\nliving room",
                    style: TextStyle(fontSize: 20, height: 1.5),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    
                    children: <Widget>[
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80"),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Jean-Luis",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "Interior Design",
                            style: TextStyle(fontSize: 13),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
      
        


                  Row(
                    children: <Widget>[
                     // Container(
                       // decoration: BoxDecoration(
                         //   border: Border.all(color: Colors.grey),
                         //   borderRadius: BorderRadius.circular(3)),
                       // child: Padding(
                        //  padding: const EdgeInsets.all(6.0),
                        //  child: Text("Interior"),
                       // ),
                     // ),
                      SizedBox(
                        width: 20,
                      ),
                     // Container(
                       // decoration: BoxDecoration(
                          //  border: Border.all(color: Colors.grey),
                          //  borderRadius: BorderRadius.circular(3)),
                        //child: Padding(
                        //  padding: const EdgeInsets.all(6.0),
                        //  child: Text("40m2"),
                       // ),
                    //  ),
                       SizedBox(
                        width: 20,
                      ),
                     // Container(
                       // decoration: BoxDecoration(
                           // border: Border.all(color: Colors.grey),
                          //  borderRadius: BorderRadius.circular(3)),
                        //child: Padding(
                        //  padding: const EdgeInsets.all(6.0),
                        //  child: Text("Ideas"),
                       // ),
                     // )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text("Nobody wants to stare at a blank wall all day long, which is why wall art is such a crucial step in the decorating process. And once you start brainstorming, the rest is easy. From gallery walls to DIY pieces like framing your accessories and large-scale photography, we've got plenty of wall art ideas to spark your creativity. And where better to look for inspiration that interior designer-decorated walls",style: TextStyle(
                    height: 1.6
                  ),
                  ),
                                     
 Align(
          alignment: Alignment.centerRight,
          child:Container(
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
            child:  IconButton(
            icon:SvgPicture.asset(
              "assets/icons/Conversation.svg",
              color: Color(0xFFFF4848) ,
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
                  SizedBox(height: 20,),
                  Text("Gallery",style: TextStyle(
                    fontSize: 18
                  ),),
                  SizedBox(height: 20,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                                      child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80"),
                                //image: AssetImage("assets\images\Image Popular Product 1.png"),
                              fit: BoxFit.cover)
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80"),
                                //image: AssetImage("assets\images\Image Popular Product 1.png"),
                                fit: BoxFit.cover)
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80"),
                               // image: AssetImage("assets\images\Image Popular Product 1.png"),
                                fit: BoxFit.cover)
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                  
                 
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}