
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/components/product_images.dart';
import 'package:shop_app/screens/home/home_screen.dart';

import '../../../size_config.dart';
import '../details_screen.dart';

class FormScreen extends StatefulWidget {
  final Product value;
  //final Product product;
  FormScreen({Key key,  this.value }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  
  String _name;
  String _email;
  String _adress;
  String _phoneNumber;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Product product;
  final _auth = FirebaseAuth.instance;
  List<String>  ListID = [];
  
 
 
  User userData=  FirebaseAuth.instance.currentUser;
  
  CollectionReference usersRef = 
                  FirebaseFirestore.instance.collection("users");
 CollectionReference orderRef = FirebaseFirestore.instance.collection("orders");
 CollectionReference postRef = FirebaseFirestore.instance.collection("produits");
              
             
  FormScreenState({Key key, @required this.product }) ;
  
   

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Name',
        hintText: 'Name'
        ),
      maxLength: 15,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Email'
        ),
      maxLength:30,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildAdress() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Adress',
        hintText: 'Adress'
        ),
      maxLength:30,
      //keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Adress is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _adress = value;
      },
    );
  }

  

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Phone number',
        hintText: 'Phone number'
        ),
      maxLength:10,
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _phoneNumber = value;
      },
    );
  }
  int _n = 1;
  void add() {
  setState(() {
    _n++;
  });
}
  void minus() {
  setState(() {
    if (_n != 1) 
      _n--;
  });
}
  Widget _buildCounter() {
    return new Container(
      child: new Center(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new FloatingActionButton(
              onPressed: add,
              child: new Icon(Icons.add, color: Colors.black,),
              backgroundColor: Colors.white,),

            new Text('$_n',
                style: new TextStyle(fontSize: 60.0)),

            new FloatingActionButton(
              onPressed: minus,
              child: new Icon(Icons.remove, 
                 color: Colors.black),
              backgroundColor: Colors.white,),
          ],
        ),
      ),
    );
  //);
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.black),
    onPressed: () =>  Navigator.of(context, rootNavigator: true).pop(context)
  ), 
        
        title: Text(
        "Place an order",
        style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        )
        ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildEmail(),
                _buildAdress(),
               // _builURL(),
                _buildPhoneNumber(),
               // _buildCalories(),
                _buildCounter(),
                SizedBox(height: 100),
                 
                RaisedButton(
                  color: Colors.redAccent,
                  splashColor: Colors.yellow[200],
                  animationDuration: Duration(seconds: 2),
                  shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.black),
                    ),
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.black, fontSize: 50),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }


                    _formKey.currentState.save();


                    print(_name);
                    print(_email);
                    print(_phoneNumber);
                  // print(_url);
                    print(_adress);
                    print(_n);
                   // print(_calories);

                    //Send to API
                    FutureBuilder(
                      future: orderRef.get(),
                      // ignore: missing_return
                      builder: (context ,snapshot){
                        if(snapshot.connectionState == ConnectionState.waiting){
                                   print("WAIT");
                                  // print(likesRef.doc(userData.uid).firestore.collection(product.id).where(product.id));
                                }
                       if(snapshot.hasError){
                               print("ERROR");    
                               }
                        if(snapshot.hasData   ){
                            print(product.id);
                           orderRef.doc(userData.uid).get().then((DocumentSnapshot doc) =>
             print(doc.data()));
                        }
                      }
                    );
                    
                    orderRef.add({
    '${widget.value.id}' :{ 
      'title': widget.value.title,
      'address': _adress,
      'email': _email,
      'name': _name,
      'phone': _phoneNumber,
      'counter': _n
      },
  },//SetOptions(merge : true),
  ).then((_) {
    print("success!");
  });
  Navigator.pushNamed(context, HomeScreen.routeName);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}