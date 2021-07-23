import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:opera_house/Category_Events.dart';
import 'package:http/http.dart' as http;
import 'package:opera_house/categorycard.dart';
import 'package:opera_house/homepage.dart';


class Category extends StatefulWidget {
  static String routeName = "/event";

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List category = [];

  fetchcategory() async {
    Map<String, dynamic> categoryJason;
    print('fetch notes here...');
    var url = 'https://cairo-opera.herokuapp.com/show_categorys';
    var response = await http.get(url);

    print('response = ' + response.toString());
    if (response.statusCode == 200) {
      categoryJason = json.decode(response.body);
      print('notesJson = ' + categoryJason.toString());
      // for (var noteJson in notesJson){
      //   notes.add(Artist.fromJson(noteJson));
      //   print (response.body);
      //
      // }
    }
    setState(() {
      categoryJason.forEach((key, value) {
        category = value;
      });
    });

    print('notes = $category');
    return categoryJason;
  }

  var result1;
  getData() async {
    print('getdata here...');
    print(result1 = await fetchcategory());
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
  }

  List categoryEvent = [];
  Future<List> singleEvent(int categoryID) async {
    var categoryJason;
    List<dynamic> events = [];
    print('fetch Artist here...');
    var url = 'https://cairo-opera.herokuapp.com/category_event/$categoryID';
    var response = await http.get(url);
    print('response = ' + response.toString());
    if (response.statusCode == 200) {
      categoryJason = json.decode(response.body);
      print('notesJson = ' + categoryJason.toString());
      categoryJason.forEach((key, value) {
        events.add(value);
      });

      // for (var noteJson in notesJson){
      //   notes.add(Artist.fromJson(noteJson));
      //   print (response.body);
      //
      // }

    }

    return events;
  }

  // var result2;
  // getArtistEvent() async {
  //   print('getdata here...');
  //   // print( result2 = await singleEvent());
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text(
            "Category",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
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
          scrollDirection: Axis.vertical,
          children: [
            for (var note in category)
              CategoryCard(
                name: note['name'].toString(),
                image_link: note['image_link'].toString(),
                onPress: () async {
                  List events = await singleEvent(note['id']);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryEvent(category: events),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
