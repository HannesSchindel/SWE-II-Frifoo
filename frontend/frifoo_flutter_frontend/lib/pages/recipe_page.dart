import 'package:flutter/material.dart';
import 'package:frifoo_flutter_frontend/constants.dart';
import 'package:frifoo_flutter_frontend/customWidgets/ImageBox.dart';
import 'package:frifoo_flutter_frontend/customWidgets/MainFloatingButton.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(MAIN_CONTAINER_MARGIN),
        child: SingleChildScrollView(
          //margin: const EdgeInsets.all(MAIN_CONTAINER_MARGIN),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      MainFloatingButton(
                          icon: const Icon(Icons.chevron_left),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      const SizedBox(width: 20),
                      DefaultTextStyle(
                          style: FONT_LOGO_BLACK_HEADING,
                          child: Text("Recipe name",
                              style: FONT_LOGO_BLACK_HEADING)),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageBox(
                      width: MediaQuery.of(context).size.width / WIDTH_DIVIDER,
                      height: 400,
                      imageSource:
                          "https://images.pexels.com/photos/2641886/pexels-photo-2641886.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                      title: "",
                      isFavorite: false),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultTextStyle(
                      style: FONT_FIRST_HEADING,
                      child: const Text("Ingredients"))
                ],
              ),
              DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text('Name'),
                  ),
                  DataColumn(
                    label: Text('Menge'),
                  ),
                ],
                rows: const <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('tomate')),
                      DataCell(Text('3')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('kartoffel')),
                      DataCell(Text('5kg')),
                    ],
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultTextStyle(
                      style: FONT_FIRST_HEADING,
                      child: const Text("Description"))
                ],
              ),
              DefaultTextStyle(
                  style: FONT_PARAGRAPH,
                  child: const Text(
                      "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue"))
            ],
          ),
        ));
  }
}
