import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:opera_house/Artist.dart';
import 'package:opera_house/Event.dart';
import 'package:opera_house/Event_Status.dart';
import 'package:opera_house/EventsCard.dart';
import 'package:opera_house/booking_info.dart';
import 'package:opera_house/categorycard.dart';
import 'package:opera_house/globals.dart';
import 'package:opera_house/screens/sign_in/sign_in_screen.dart';
import '../../../size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants.dart';
import 'package:http/http.dart' as http;
import 'Category_Events.dart';
import 'category.dart';
import 'package:opera_house/category.dart';

class HomePage extends StatefulWidget {
  static String routeName = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "Home Page",
            style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)
          ),
        ),
        body: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            Category1(),
            SizedBox(height: getProportionateScreenWidth(30)),
            Event1(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}

class Category1 extends StatefulWidget {
  static String routeName = "/event";

  @override
  _Category1State createState() => _Category1State();
}

class _Category1State extends State<Category1> {
  List category = [];

  fetchcategory() async {
    Map<String, dynamic> categoryJson;
    print('fetch notes here...');
    var url = 'https://cairo-opera.herokuapp.com/show_categorys';
    var response = await http.get(url);

    print('response = ' + response.toString());
    if (response.statusCode == 200) {
      categoryJson = json.decode(response.body);
      print('categoryJson = ' + categoryJson.toString());
      // for (var noteJson in notesJson){
      //   notes.add(Artist.fromJson(noteJson));
      //   print (response.body);
      //
      // }
    }
    setState(() {
      categoryJson.forEach((key, value) {
        category = value;
      });
    });

    print('notes = $category');
    return categoryJson;
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

    // fetchNote().then((value) {
    //   setState(() {
    //     _notes.addAll(value);
    //   });
    // });
  }

  List categoryEvent = [];
  Future<List> category_event(int categoryID) async {
    var CategorytEventJson;
    List<dynamic> events = [];
    print('fetch Artist here...');
    var url = 'https://cairo-opera.herokuapp.com/category_event/$categoryID';

    var response = await http.get(url);

    print('response = ' + response.toString());
    if (response.statusCode == 200) {
      CategorytEventJson = json.decode(response.body);
      print('notesJson = ' + CategorytEventJson.toString());
      CategorytEventJson.forEach((key, value) {
        events.add(value);
      });

      // for (var noteJson in notesJson){
      //   notes.add(Artist.fromJson(noteJson));
      //   print (response.body);
      //
      // }

    }
    log('category = $events');
    return events;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Category",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Category(),
                ),
              );
            },
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var note in category)
                CategoryCard(
                  name: note['name'].toString(),
                  image_link: note['image_link'].toString(),
                  onPress: () async {
                    List events = await category_event(note['id']);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryEvent(category: events),
                      ),
                    );

                    // int ids = note['id'];
                    // print (ids);
                  },
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  List artistEvent = [];
  singleEvent(int customerID) async {
    var artistEventJson;
    List<dynamic> events = [];
    print('fetch Artist here...');
    var url =
        'https://cairo-opera.herokuapp.com/show_cutomer_booking/$customerID';
    var response = await http.get(url);
    print('response = ' + response.toString());
    if (response.statusCode == 200) {
      artistEventJson = json.decode(response.body);
      print('notesJson = ' + artistEventJson.toString());
      artistEventJson.forEach((key, value) {
        events.add(value);
      });
    }
    log('notes = $events');
    return events;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox.fromSize(
            size: Size(60, 60), // button width and height
            child: ClipOval(
              child: Material(
                color: Colors.white, // button color
                child: InkWell(
                  splashColor: Colors.green, // splash color
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ArtistPage();
                    }));
                  }, // button pressed
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.person), // icon
                      Text("Artist"), // text
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox.fromSize(
            size: Size(60, 60), // button width and height
            child: ClipOval(
              child: Material(
                color: Colors.white, // button color
                child: InkWell(
                  splashColor: Colors.green, // splash color
                  onTap: () async {
                    List events = await singleEvent(customer_id);
                    print(events);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TicketInfo(events: events)),
                    );
                  },

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.event), // icon
                      Text("T.Info"), // text
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox.fromSize(
            size: Size(60, 60), // button width and height
            child: ClipOval(
              child: Material(
                color: Colors.white, // button color
                child: InkWell(
                  splashColor: Colors.green, // splash color
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SignInScreen();
                    }));
                  }, // button pressed
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.logout), // icon
                      Text("Log Out"), // text
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    Key key,
    @required this.svgSrc,
    this.numOfitem = 0,
    @required this.press,
  }) : super(key: key);

  final String svgSrc;
  final int numOfitem;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(12)),
            height: getProportionateScreenWidth(46),
            width: getProportionateScreenWidth(46),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(svgSrc),
          ),
          if (numOfitem != 0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                height: getProportionateScreenWidth(16),
                width: getProportionateScreenWidth(16),
                decoration: BoxDecoration(
                  color: Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "$numOfitem",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(10),
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

class Event1 extends StatefulWidget {
  static String routeName = "/event";

  @override
  _Event1State createState() => _Event1State();
}

class _Event1State extends State<Event1> {
  List notes = List();

  fetchNote() async {
    Map<String, dynamic> notesJson;
    print('fetch notes here...');
    var url = 'https://cairo-opera.herokuapp.com/landing';
    var response = await http.get(url);

    print('response = ' + response.toString());
    if (response.statusCode == 200) {
      notesJson = json.decode(response.body);
      print('notesJson = ' + notesJson.toString());
      // for (var noteJson in notesJson){
      //   notes.add(Artist.fromJson(noteJson));
      //   print (response.body);
      //
      // }
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
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Events",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Event()),
              );
            },
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
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
      ],
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.6,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) => print(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search product",
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    @required this.title,
    @required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            "See More",
            style: TextStyle(color: Color(0xFFBBBBBB)),
          ),
        ),
      ],
    );
  }
}
