import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:opera_house/Artist.dart';
import 'package:opera_house/Event_Status.dart';

class ArtistEvent extends StatelessWidget {
  final List events;

  ArtistEvent({this.events});

  @override
  Widget build(BuildContext context) {
    print("test ${events[0][0]["description"]}");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text(
            "Artist Event",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArtistPage(),
                ),
              );
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: ListView(
          children: [
            for (var event in events)
              for(var singleEvent in event)
                Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Container(
                    // height: MediaQuery.of(context).size.height / 2.3,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      elevation: 3.0,
                      child: Column(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              InkWell(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EventStatus(eventstatus: singleEvent),
                                    ),
                                  );
                                },
                                child:  Container(
                                  // height: MediaQuery.of(context).size.height / 3.5,
                                  width: MediaQuery.of(context).size.width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    child: Image(
                                      image: NetworkImage(
                                          "${singleEvent["image_link"]}"
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
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
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "Event: ${singleEvent["name"]}",
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
                                "Price: ${singleEvent["price"]}",
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
                                "Start Time:${singleEvent["start_time"]}",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w800,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "End Time:${singleEvent["end_time"]}",
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
                                "BY:${singleEvent["artist_names"][0]}",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}