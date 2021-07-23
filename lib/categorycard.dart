import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({this.image_link, this.name, this.id, this.onPress});
  final image_link;
  final name;
  final onPress;
  final id;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: onPress,
        child: Padding(
          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
          child: Container(
            height: MediaQuery.of(context).size.height / 2.6,
            width: MediaQuery.of(context).size.width,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 3.0,
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height / 3.5,
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image(
                              image: NetworkImage(image_link),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Positioned(
                        top: 6.0,
                        left: 6.0,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.0)),
                          child: Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Text(
                              "open",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7.0),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        name,
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
