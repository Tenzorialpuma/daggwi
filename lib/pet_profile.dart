import 'package:dawggi/assets/mainColors.dart';
import 'package:flutter/material.dart';
import 'package:dawggi/models/Dog.dart';
import 'package:google_fonts/google_fonts.dart';

class PetsDetails extends StatelessWidget {
  final Dog dog;

  PetsDetails(this.dog);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      centerTitle: false,
      title: Text(
        dog.title,
        style: GoogleFonts.pacifico(),
      ),
    );
    return Scaffold(
      appBar: AppBar(
          title: Text(
        dog.title,
        style: GoogleFonts.pacifico(),
      )),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 1.00,
            height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                .24,
            decoration: BoxDecoration(
                color: MainColors.mainBlue,
                borderRadius: new BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                )),
          ),
          Container(
            height: 10,
          ),
          Container(
            child: Text(
              'Dog\'s Card',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Container(
            height: 10,
          ),
          Center(
            child: Container(
                padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width * 0.90,
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    .68,
                child: Text(
                  "The Selected Amount Is: " + dog.amount.toString(),
                  style: TextStyle(fontSize: 21.0, color: Colors.white),
                ),
                decoration: BoxDecoration(
                  color: MainColors.mainBlue,
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
        ],
      ),
    );
  }
}
