import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EventCard extends StatelessWidget {

  EventCard(
      {
      this.lname,
      this.fname,
      this.title,
      this.image_link,
      this.artist_names,
      this.name,
      this.end_time,
      this.price,
      this.start_time,
      this.onPress,
      this.id,
      this.theatre_map,
      this.mapped_free_seats,
      });
  final fname;
  final lname;
  final image_link;
  final name;
  final price;
  final start_time;
  final title;
  final artist_names;
  final end_time;
  final onPress;
  final id;
  final theatre_map;
  final mapped_free_seats;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: onPress,
        child: Padding(
          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
          child: Container(
            height: MediaQuery.of(context).size.height / 2.0,
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
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              " OPEN ",
                              style: TextStyle(
                                fontSize: 10.0,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        name,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Price : " + price + " L.E" +"\n" + "Start Time : " + start_time + "\n" + "End Time : " + end_time,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "By : " + artist_names,
                        style: TextStyle(
                          fontSize: 15.0,
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
