import 'package:epicesindiennes/global.dart';
import 'package:flutter/material.dart';

import '../database.dart';
import '../pages/search.dart';

Widget detailAppBar(String name, BuildContext context){
  return Container(
    width: double.infinity,
    height: width(context) / 4,
    decoration: BoxDecoration(
      color: primaryColor
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: width(context) / 10,
              )
          ),


          Text(
            name,
            style: TextStyle(
              fontSize: width(context) / 15,
              color: Colors.white
            ),
          ),

          IconButton(
              onPressed: (){
                showSearch(
                  context: context,
                  delegate: SpiceSearchDelegate(indianSpices), // Pass your spices list
                );
              },
              icon: Icon(
                  Icons.search,
                color: Colors.white,
                size: width(context) / 10,
              )
          )
        ],
      ),
    ),
  );
}