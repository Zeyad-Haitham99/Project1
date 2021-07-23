import 'package:flutter/material.dart';

class EventBooking extends StatelessWidget {
  EventBooking(
      {this.description,
        this.image_link,
        this.artist_names,
        this.name,
        this.end_time,
        this.price,
        this.start_time,
        this.onPress,
        this.id,
        this.theatre_map,
        this.mapped_free_seats,});
  final description;
  final image_link;
  final name;
  final price;
  final start_time;
  var artist_names;
  final end_time;
  final onPress;
  final id;
  final theatre_map;
  final mapped_free_seats;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: Container(
          height: MediaQuery.of(context).size.height / 2.3,
          width: MediaQuery.of(context).size.width,
          child: Card(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
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
                        // child:Image(
                        //   image: NetworkImage(image_link),
                        //   fit: BoxFit.cover,
                        // )
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
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 7.0),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      price + " " + start_time + " " + end_time,
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                SizedBox(height: 7.0),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      description,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                SizedBox(height: 7.0),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      artist_names,
                      style: TextStyle(
                        fontSize: 12.0,
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
    );
  }
}
// Scaffold(
// key: scaffoldKey,
// appBar: AppBar(
// backgroundColor: Colors.white,
// automaticallyImplyLeading: true,
// leading: InkWell(
// onTap: () async {
// Navigator.pop(context);
// },
// child: Icon(
// Icons.arrow_back,
// color: Colors.black,
// size: 24,
// ),
// ),
// title: Text(
// getJsonField(widget.artPiece, r'$.title').toString(),
// style: FlutterFlowTheme.bodyText2.override(
// fontFamily: 'Playfair Display',
// fontSize: 18,
// fontWeight: FontWeight.bold,
// ),
// ),
// actions: [
// ToggleIcon(
// onPressed: () async {
// final favoritesElement =
// getJsonField(widget.artPiece, r'$.objectID');
// final favoritesUpdate = artPiecePageUsersRecord.favorites
//     .contains(favoritesElement)
//     ? FieldValue.arrayRemove([favoritesElement])
//     : FieldValue.arrayUnion([favoritesElement]);
// final usersRecordData = {
//   'favorites': favoritesUpdate,
// };
//
// await artPiecePageUsersRecord.reference
//     .update(usersRecordData);
// },
// value: artPiecePageUsersRecord.favorites
//     .contains(getJsonField(widget.artPiece, r'$.objectID')),
// onIcon: Icon(
// Icons.favorite,
// color: FlutterFlowTheme.primaryColor,
// size: 25,
// ),
// offIcon: Icon(
// Icons.favorite_border,
// color: FlutterFlowTheme.tertiaryColor,
// size: 25,
// ),
// )
// ],
// centerTitle: true,
// elevation: 0,
// ),
// backgroundColor: FlutterFlowTheme.secondaryColor,
// body: SafeArea(
// child: Column(
// mainAxisSize: MainAxisSize.max,
// children: [
// Expanded(
// child: SingleChildScrollView(
// child: Column(
// mainAxisSize: MainAxisSize.max,
// children: [
// Image.network(
// getJsonField(widget.artPiece, r'$.primaryImage'),
// width: double.infinity,
// height: 400,
// fit: BoxFit.fitWidth,
// ),
// Padding(
// padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
// child: Column(
// mainAxisSize: MainAxisSize.max,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// getJsonField(widget.artPiece, r'$.title')
// .toString(),
// style: FlutterFlowTheme.title1.override(
// fontFamily: 'Playfair Display',
// fontSize: 24,
// fontWeight: FontWeight.bold,
// ),
// ),
// Padding(
// padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
// child: Row(
// mainAxisSize: MainAxisSize.max,
// children: [
// Padding(
// padding: EdgeInsets.fromLTRB(0, 0, 6, 0),
// child: Text(
// getJsonField(widget.artPiece,
// r'$.artistDisplayName')
// .toString(),
// style:
// FlutterFlowTheme.bodyText2.override(
// fontFamily: 'Playfair Display',
// color: FlutterFlowTheme.tertiaryColor,
// fontSize: 15,
// fontWeight: FontWeight.normal,
// ),
// ),
// ),
// Expanded(
// child: AutoSizeText(
// getJsonField(widget.artPiece,
// r'$.artistDisplayName')
// .toString(),
// style:
// FlutterFlowTheme.bodyText2.override(
// fontFamily: 'Playfair Display',
// color: Colors.black,
// fontSize: 15,
// fontWeight: FontWeight.bold,
// ),
// ),
// )
// ],
// ),
// ),
// Column(
// mainAxisSize: MainAxisSize.max,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Divider(
// height: 30,
// thickness: 0.5,
// color: FlutterFlowTheme.tertiaryColor,
// ),
// Text(
// 'Title',
// style: FlutterFlowTheme.bodyText2.override(
// fontFamily: 'Playfair Display',
// color: Color(0xFF1E2429),
// fontSize: 12,
// fontWeight: FontWeight.bold,
// ),
// ),
// Padding(
// padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
// child: Text(
// getJsonField(widget.artPiece, r'$.title')
// .toString(),
// style:
// FlutterFlowTheme.bodyText1.override(
// fontFamily: 'Playfair Display',
// fontSize: 16,
// ),
// ),
// )
// ],
// ),
// Column(
// mainAxisSize: MainAxisSize.max,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Divider(
// height: 30,
// thickness: 0.5,
// color: FlutterFlowTheme.tertiaryColor,
// ),
// Text(
// 'Maker',
// style: FlutterFlowTheme.bodyText2.override(
// fontFamily: 'Playfair Display',
// color: Color(0xFF1E2429),
// fontSize: 12,
// fontWeight: FontWeight.bold,
// ),
// ),
// Padding(
// padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
// child: Text(
// getJsonField(widget.artPiece,
// r'$.artistDisplayName')
// .toString(),
// style:
// FlutterFlowTheme.bodyText1.override(
// fontFamily: 'Playfair Display',
// fontSize: 16,
// ),
// ),
// )
// ],
// ),
// Column(
// mainAxisSize: MainAxisSize.max,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Divider(
// height: 30,
// thickness: 0.5,
// color: FlutterFlowTheme.tertiaryColor,
// ),
// Text(
// 'Department',
// style: FlutterFlowTheme.bodyText2.override(
// fontFamily: 'Playfair Display',
// color: Color(0xFF1E2429),
// fontSize: 12,
// fontWeight: FontWeight.bold,
// ),
// ),
// Padding(
// padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
// child: Text(
// getJsonField(
// widget.artPiece, r'$.department')
// .toString(),
// style:
// FlutterFlowTheme.bodyText1.override(
// fontFamily: 'Playfair Display',
// fontSize: 16,
// ),
// ),
// )
// ],
// ),
// Column(
// mainAxisSize: MainAxisSize.max,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Divider(
// height: 30,
// thickness: 0.5,
// color: FlutterFlowTheme.tertiaryColor,
// ),
// Text(
// 'Accesion Number',
// style: FlutterFlowTheme.bodyText2.override(
// fontFamily: 'Playfair Display',
// color: Color(0xFF1E2429),
// fontSize: 12,
// fontWeight: FontWeight.bold,
// ),
// ),
// Padding(
// padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
// child: Text(
// getJsonField(widget.artPiece,
// r'$.accessionNumber')
// .toString(),
// style:
// FlutterFlowTheme.bodyText1.override(
// fontFamily: 'Playfair Display',
// fontSize: 16,
// ),
// ),
// )
// ],
// ),
// Align(
// alignment: Alignment(0, 0),
// child: Padding(
// padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
// child: InkWell(
// onTap: () async {
// await launchURL(getJsonField(
// widget.artPiece, r'$.objectURL')
// .toString());
// },
// child: Text(
// 'View on Met Website',
// style:
// FlutterFlowTheme.bodyText1.override(
// fontFamily: 'Playfair Display',
// color: Colors.black,
// fontSize: 16,
// fontWeight: FontWeight.w600,
// ),
// ),
// ),
// ),
// )
// ],
// ),
// )
// ],
// ),
// ),
// ),
// Container(
// width: double.infinity,
// height: 84,
// decoration: BoxDecoration(
// color: FlutterFlowTheme.secondaryColor,
// ),
// child: Align(
// alignment: Alignment(0, 0),
// child: FFButtonWidget(
// onPressed: () async {
// final usersRecordData = {
//   'favorites': FieldValue.arrayUnion(
//       [getJsonField(widget.artPiece, r'$.objectID')]),
// };
//
// await currentUserReference.update(usersRecordData);
// await Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) =>
// NavBarPage(initialPage: 'MyCollection'),
// ),
// );
// },
// text: 'Add to Collection',
// icon: Icon(
// Icons.favorite_border,
// color: Colors.white,
// size: 15,
// ),
// options: FFButtonOptions(
// width: 200,
// height: 50,
// color: FlutterFlowTheme.primaryColor,
// textStyle: FlutterFlowTheme.subtitle1.override(
// fontFamily: 'Playfair Display',
// color: Colors.white,
// fontSize: 14,
// fontWeight: FontWeight.bold,
// ),
// borderSide: BorderSide(
// color: Colors.transparent,
// width: 1,
// ),
// borderRadius: 6,
// ),
// ),
// ),
// )
// ],
// ),
// ),
// );
// },
// );
// }
// }

