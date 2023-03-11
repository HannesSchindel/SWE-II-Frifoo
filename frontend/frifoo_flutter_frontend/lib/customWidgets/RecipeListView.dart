import 'package:flutter/material.dart';
import 'package:frifoo_flutter_frontend/customWidgets/ImageBox.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RecipeListScreen extends StatelessWidget {
  final String apiEndpoint;

  RecipeListScreen({required this.apiEndpoint});

  Future<Map<String, dynamic>> getDataFromAPI() async {
    http.Response response = await http.get(Uri.parse(apiEndpoint));

    if (response.statusCode == 200) {
      Map<String, dynamic> data;
      data = jsonDecode(response.body);
      
      print(data);
      return data;
    } else {
      throw Exception('Failed to load data from API');
    }
  }


@override
Widget build(BuildContext context) {
  return FutureBuilder<Map<String, dynamic>>(
    future: getDataFromAPI(),
    builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
      if (snapshot.hasData) {
        final List<dynamic> recipes = snapshot.data!['recipes'];
        return Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: recipes.length,
            itemBuilder: (BuildContext context, int index) {
              final Map<String, dynamic> entry = recipes.elementAt(index);
              final String name = entry['name'];
              final String imageUrl = entry['image_url'];

              return Container(
                margin: EdgeInsets.only(right: 25),
                child: ImageBox(
                  title: name,
                  height: 200,
                  width: 150,
                  isFavorite: false,
                  imageSource: imageUrl,
                ),
              );
            },
          ),
        );
      } else if (snapshot.hasError) {
        return Center(child: Text("${snapshot.error}"));
      } else {
        return Center(child: CircularProgressIndicator());
      }
    },
  );
}


}
