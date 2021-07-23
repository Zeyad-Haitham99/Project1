import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opera_house/ArtistCard.dart';
import 'package:http/http.dart' as http;
import 'package:opera_house/HomeScreen.dart';
import 'package:opera_house/artistevent.dart';

class ArtistPage extends StatefulWidget {
  static String routeName = "/home";

  @override
  _ArtistPageState createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  List artist = [];

  fetchArtist() async {
    Map<String, dynamic> artistJson;
    print('fetch Artist here...');
    var url = 'https://cairo-opera.herokuapp.com/show_artist';

    var response = await http.get(url);

    print('response = ' + response.toString());
    if (response.statusCode == 200) {
      artistJson = json.decode(response.body);
      print('notesJson = ' + artistJson.toString());

    }
    setState(() {
      artistJson.forEach((key, value) {
        artist = value;
      });
    });

    print('notes = $artist');
    return artistJson;
  }

  var result1;
  getData() async {
    print('getdata here...');
    print(result1 = await fetchArtist());
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
  }

  List artistEvent = [];
  Future<List> singleEvent(int artistID) async {
    var artistEventJson;
    List<dynamic> events = [];
    print('fetch Artist here...');
    var url = 'https://cairo-opera.herokuapp.com/artist_event/$artistID';
    var response = await http.get(url);
    print('response = ' + response.toString());
    if (response.statusCode == 200) {
      artistEventJson = json.decode(response.body);
      print('notesJson = ' + artistEventJson.toString());
      artistEventJson.forEach((key, value) {
        events.add(value);
      });

      // for (var noteJson in notesJson){
      //   notes.add(Artist.fromJson(noteJson));
      //   print (response.body);
      //
      // }

    }
    log('notes = $events');
    return events;
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text(
            "Artist",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        //Getting Data For Artist From Data Base ......
        body: ListView(
          children: <Widget>[
            for (var artistes in artist)
              ResusableCard(
                fname: artistes['fname'].toString(),
                lname: artistes['lname'].toString(),
                image_link: artistes['image_link'].toString(),
                id: artistes['id'].toString(),
                onPress: () async {
                  List events = await singleEvent(artistes['id']);
                  if (events.length > 1 && !events[1]){
                    AlertDialog alert = AlertDialog(
                      title: Text("No event"),
                    );
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                      return alert;
                    });
                  }else{
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArtistEvent(events: events),
                      ),
                    );
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}
