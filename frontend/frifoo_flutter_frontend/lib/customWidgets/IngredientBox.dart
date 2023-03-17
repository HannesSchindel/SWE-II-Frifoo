import 'package:flutter/material.dart';
import 'package:frifoo_flutter_frontend/constants.dart';
import 'package:frifoo_flutter_frontend/databases/sqlite_helper.dart';


class IngredientBox extends StatefulWidget {
  final double _borderRadius = 30.0;
  final double width;
  final double height;
  final String imageSource;
  final String title;
  final SqliteHelper database;
  final String tableName;
  final int id;
  final VoidCallback onDelete;

  const IngredientBox({
    required this.width,
    required this.height,
    required this.imageSource,
    required this.title,
    required this.database,
    required this.tableName,
    required this.id,
    required this.onDelete,
  });

  @override
  _IngredientBoxState createState() => _IngredientBoxState();
}


class _IngredientBoxState extends State<IngredientBox> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: widget.width,
        height: widget.height,
        margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget._borderRadius),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              offset: Offset(4, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget._borderRadius),
                  image: DecorationImage(
                      image: NetworkImage(widget.imageSource), fit: BoxFit.cover)),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget._borderRadius),
                color: Colors.white,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color.fromARGB(0, 0, 0, 0),
                    Color.fromARGB(185, 0, 0, 0),
                  ],
                ),
              ),
            ),
            Container(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                  margin: const EdgeInsets.all(15),
                  child: DefaultTextStyle(
                      style: FONT_SECOND_WHITE_HEADING, child: Text(widget.title)),
                ),
              ]),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Container(
                  margin: EdgeInsets.all(15),
                  child: GestureDetector(
                    onTap: () {
                      delete();
                      widget.onDelete(); 
                      },
                    child: Container(
                      child: Icon(Icons.delete, color: Colors.white)
                      ),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }

  void delete() async {
    bool deletedItem = await widget.database.delete(widget.id, widget.tableName);
    if (deletedItem) {
      print('Deleted $widget.id');
      setState(() {}); // Rebuild aufrufen
    } else {
      print('Failed to delete $widget.id');
    }
  }
}