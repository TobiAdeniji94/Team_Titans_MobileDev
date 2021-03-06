import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:recipe/pages/detail.dart';
import 'package:recipe/utils/data.dart';

class ListGridView extends StatefulWidget {
  @override
  _ListGridViewState createState() => _ListGridViewState();
}

class _ListGridViewState extends State<ListGridView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: new Padding(
          padding: const EdgeInsets.all(4.0),
          child: new StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemCount: Data.recipes.length,
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.all(1.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsPage(
                                recipe: Data.recipes[index],
                              )));
                },
                child: Expanded(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          width: 160,
                          decoration: BoxDecoration(
                              color: Data.recipes[index].color,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "${Data.recipes[index].imageUrl}"),
                                  fit: BoxFit.fitHeight),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text("${Data.recipes[index].title}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black))),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, left: 10),
                              child: Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                      "${Data.recipes[index].time} Minutes",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ))),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            staggeredTileBuilder: (int index) =>
                new StaggeredTile.count(2, index.isEven ? 3 : 4),
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
          ),
        ),
      ),
    );
  }
}
