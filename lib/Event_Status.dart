import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:opera_house/Booking%20page.dart';
import 'Event.dart';
import 'package:http/http.dart' as http;

class EventStatus extends StatelessWidget {
  final eventstatus;

  EventStatus({this.eventstatus});
  List Bookevent = [];
  Future<List> sEvent(int eventID) async {
    var artistEventJson;
    List<dynamic> book = [];
    print('fetch Artist here...');
    var url = 'https://cairo-opera.herokuapp.com/free_seats/$eventID';
    var response = await http.get(url);
    print('response = ' + response.toString());
    if (response.statusCode == 200) {
      artistEventJson = json.decode(response.body);
      print('notesJson = ' + artistEventJson.toString());
      artistEventJson.forEach((key, value) {
        book.add(value);
      });

      // for (var noteJson in notesJson){
      //   notes.add(Artist.fromJson(noteJson));
      //   print (response.body);
      //
      // }

    }
    log('notes = $artistEventJson');

    return book;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text(
            "Event",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Event(),
                ),
              );
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 15.0),
              child: Container(
                // height: MediaQuery.of(context).size.height / 1.3,
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
                            // height: MediaQuery.of(context).size.height / 3.5,
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              child: Image.network(
                                "${eventstatus["image_link"]}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 6.0,
                            left: 6.0,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.0)),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            "Price: ${eventstatus["price"]}",
                            style: TextStyle(
                              fontSize: 13.0,
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
                            "Start_Time: ${eventstatus["start_time"]}",
                            style: TextStyle(
                              fontSize: 13.0,
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
                            "End_Time: ${eventstatus["end_time"]}",
                            style: TextStyle(
                              fontSize: 13.0,
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
                            "Description: ${eventstatus["description"]}",
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            "Artist Name:${eventstatus["artist_names"]}",
                            style: TextStyle(
                              fontSize: 13.0,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(

                child: ElevatedButton(
                  onPressed: () async {
                    var x = await sEvent(eventstatus["id"]);
                    print(x);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Bookingpage(events: x),
                      ),
                    );
                  },
                  child: const Text('Book Now',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
