import 'dart:convert';
import 'dart:core';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:opera_house/booking_info.dart';
import 'globals.dart' as globals;
import 'homepage.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class Bookingpage extends StatefulWidget {
  final events;
  Bookingpage({this.events});

  @override
  _BookingpageState createState() => _BookingpageState();
}

class _BookingpageState extends State<Bookingpage> {
  double displayprice;
  double price_event;
  int itemCount = 1;
  String theatre_map;
  String dropdownvalue = 'Economy';
  var items = ['Economy', 'Business', 'First Class'];
  String dropdownValue = "Economy";
  int first_seats;

  @override
  void initState() {
    for (var seat in widget.events[1]) {
      if (!seat["state"]) {
        first_seats = seat["seat"];
        break;
      }
    }
    print(widget.events[1]);
    print(widget.events[2]);

    price_event = widget.events[2].toDouble();
    displayprice = price_event;
    theatre_map = widget.events[3];
    print(widget.events);
    super.initState();
  }

  void _economy() {
    setState(() {
      print(dropdownValue);
      if (dropdownValue == "Economy") {
        displayprice = price_event * 1 * itemCount;
      } else if (dropdownValue == "Business") {
        displayprice = price_event * 1.5 * itemCount;
      } else {
        displayprice = price_event * 2 * itemCount;
      }

      print(displayprice);
    });
  }

  Future<dynamic> ticketdata() async {
    List<int> booked_seats = [];
    print(first_seats);
    for (int i = 0; i < itemCount; i++) {
      booked_seats.add(first_seats + i);
    }
    print(booked_seats);
    var req_body = {
      "event_id": widget.events[0],
      "customer_id": globals.customer_id,
      "price": displayprice,
      "customer_seats": booked_seats
    };

    http.Response response = await http.post(
      Uri.encodeFull("https://cairo-opera.herokuapp.com/booking"),
      headers: {
        "Accept": "opera_house/json",
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(req_body),
    );
    print(response);

    return jsonDecode(response.body);
  }

  List userEvent = [];

  Future<List> ticketEvent(int customerID) async {
    var ticktEventJson;
    List<dynamic> events = [];
    print('fetch Artist here...');
    var url =
        'https://cairo-opera.herokuapp.com/show_customer_booking/$customerID';
    var response = await http.get(url);
    print('response = ' + response.toString());
    if (response.statusCode == 200) {
      ticktEventJson = json.decode(response.body);
      print('notesJson = ' + ticktEventJson.toString());
      ticktEventJson.forEach((key, value) {
        events.add(value);
      });
    }
    log('notes = $events');
    return events;
  }

  var result2;

  getArtistEvent() async {
    print('getdata here...');
    // print( result2 = await singleEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text(
            "Book Event",
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
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 15.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.3,
                width: MediaQuery.of(context).size.width,
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
                            child: Image(
                              image: NetworkImage("${theatre_map}"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: [
                          Text(
                            "Price:" + displayprice.toString(),
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        itemCount != 1
                            ? new IconButton(
                                icon: new Icon(Icons.remove),
                                onPressed: () =>
                                    setState(() => {itemCount--, _economy()}),
                              )
                            : new Container(),
                        new Text(itemCount.toString()),
                        itemCount != 5
                            ? new IconButton(
                                icon: new Icon(Icons.add),
                                onPressed: () =>
                                    setState(() => {itemCount++, _economy()}),
                              )
                            : new Container(),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      // width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: DropdownButton(
                        value: dropdownValue,
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                              value: items, child: Text(items));
                        }).toList(),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                            print(newValue);
                            _economy();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
             SafeArea(
               child: Container(
                  child: ElevatedButton(
                    onPressed: () async {
                      var response = await ticketdata();
                      print(response);
                      if (response['success'] == false) {
                        showAlertDialog(context);
                      } else {
                        showAlertDialogSuccess(context);
                      }
                    },
                    child: new Text('Confirm',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
             ),

          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Ticket Information"),
      content: Text("you can't book more then one time" "\n" + "Please Checkyour T.Info"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  showAlertDialogSuccess(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Ticket Information"),
      content: Text("you Have Booked SuccessFully" "\n" + "Please Check your T.Info"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
