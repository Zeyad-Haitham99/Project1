import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResusableCard extends StatelessWidget {
  // const ResusableCard({Key key}) : super(key: key);
  ResusableCard(
      {this.lname,
      this.fname,
      this.image_link,
      this.onPress,
      this.id});
  final fname;
  final lname;
  final image_link;
  final onPress;
  final id;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: onPress,
        child: Card(
          child: Row(
            children: <Widget>[
              Container(
                  width: 50,
                  height: 50,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(image_link),
                  )),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      fname + "" + lname,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
