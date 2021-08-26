import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/components/product_search_card.dart';
import 'package:shop_app/models/Product.dart';
class PastTripsView extends StatefulWidget {
  static String routeName = "/search";
  @override
  _PastTripsViewState createState() => _PastTripsViewState();
}

class _PastTripsViewState extends State<PastTripsView> {
  TextEditingController _searchController = TextEditingController();

  Future resultsLoaded;
  List _allResults = [];
  List _resultsList = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = getUsersPastTripsStreamSnapshots();
  }


  _onSearchChanged() {
    searchResultsList();
  }

  searchResultsList() {
    var showResults = [];

    if(_searchController.text != "") {
      for(var element in _allResults){
        var title = element.title.toLowerCase();
        if(title.contains(_searchController.text.toLowerCase())) {
          showResults.add(element);
        }
      }

    } else {
      showResults = List.from(_allResults);
    }
    setState(() {
      _resultsList = showResults;
    });
  }

  getUsersPastTripsStreamSnapshots() async {
    setState(() {
      _allResults = demoProducts;
    });
    searchResultsList();
    return "complete";
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search)
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                itemCount: _resultsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductSearchCard(product: _resultsList[index]);
                }
              )

          ),
        ],
      ),
    );
  }



  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Search screen",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}