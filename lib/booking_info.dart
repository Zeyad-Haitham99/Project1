import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opera_house/homepage.dart';

class TicketInfo extends StatefulWidget {
  final List events;
  final username;

  const TicketInfo({Key key, this.events, this.username}) : super(key: key);

  @override
  _TicketInfoState createState() => _TicketInfoState();
}

class _TicketInfoState extends State<TicketInfo> {
  @override
  void initState() {
    super.initState();
    print(" Data fetch \\\\\\\\\\\\");
    print("test ${widget.events}");

    // for(var ticket in widget.events)
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text(
            "Tickets Information",
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.events[0].length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          child: Card(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              child: Image(
                                image: NetworkImage(
                                    "${widget.events[0][index]["image_link"].toString()}"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "Event Name: ${widget.events[0][index]["event_name"]}" +
                                    "\n",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w800,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "Price: ${widget.events[0][index]["price"]}" +
                                    "\n",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w800,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "Your Seats: ${widget.events[0][index]["seats"]}" +
                                    "\n",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w800,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "Start Time: ${widget.events[0][index]["start_time"]}" +
                                    "\n",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w800,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
