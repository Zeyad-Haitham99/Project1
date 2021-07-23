import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:opera_house/Event_Status.dart';
import 'package:opera_house/EventsCard.dart';
import 'package:http/http.dart' as http;
import 'HomeScreen.dart';

class Event extends StatefulWidget {
  static String routeName = "/event";

  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<Event> {
  List notes = [];

  fetchNote() async {
    Map<String, dynamic> notesJson;
    print('fetch notes here...');
    var url = 'https://cairo-opera.herokuapp.com/landing';
    var response = await http.get(url);

    print('response = ' + response.toString());
    if (response.statusCode == 200) {
      notesJson = json.decode(response.body);
      print('notesJson = ' + notesJson.toString());
    }
    setState(() {
      notesJson.forEach((key, value) {
        notes = value;
      });
    });

    print('notes = $notes');
    return notesJson;
  }

  var result1;
  getData() async {
    print('getdata here...');
    print(result1 = await fetchNote());
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();

    // fetchNote().then((value) {
    //   setState(() {
    //     _notes.addAll(value);
    //   });
    // });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          "Events",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
      body: SafeArea(
        child: Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              for (var note in notes)
                EventCard(
                  fname: note['fname'].toString(),
                  artist_names: note['artist_names'].toString(),
                  name: note['name'].toString(),
                  lname: note['lname'].toString(),
                  title: note['title'].toString(),
                  price: note['price'].toString(),
                  image_link: note['image_link'].toString(),
                  start_time: note['start_time'].toString(),
                  end_time: note['end_time'].toString(),
                  onPress: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventStatus(eventstatus: note),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
