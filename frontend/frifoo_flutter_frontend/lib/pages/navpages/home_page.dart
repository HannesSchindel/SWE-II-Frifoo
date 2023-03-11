import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frifoo_flutter_frontend/constants.dart';
import 'package:frifoo_flutter_frontend/customWidgets/CircleHeader.dart';
import 'package:frifoo_flutter_frontend/customWidgets/ImageBox.dart';
import 'package:frifoo_flutter_frontend/customWidgets/IngredientBox.dart';
import 'package:frifoo_flutter_frontend/customWidgets/MainButton.dart';

import 'package:http/http.dart' as http;

import '../../customWidgets/RecipeListView.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          CircleHeader(),
          Container(
            margin: const EdgeInsets.only(
                left: MAIN_CONTAINER_MARGIN,
                //right: MAIN_CONTAINER_MARGIN,
                bottom: MAIN_CONTAINER_MARGIN),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Featured', style: FONT_FIRST_HEADING),
                Text('Check out these featured Recipes', style: FONT_PARAGRAPH),
                Container(
                  height: 200,
                  child: RecipeListScreen(apiEndpoint: 'http://10.0.2.2:8000/frifoo-api/recipes'),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
                left: MAIN_CONTAINER_MARGIN,
                //right: MAIN_CONTAINER_MARGIN,
                bottom: MAIN_CONTAINER_MARGIN),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Favorites', style: FONT_FIRST_HEADING),
                Text('Some of your favorite Recipes', style: FONT_PARAGRAPH),
                Container(
                  height: 200,
                  child: RecipeListScreen(apiEndpoint: 'http://10.0.2.2:8000/frifoo-api/recipes'),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }


}