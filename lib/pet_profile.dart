import 'package:dawggi/assets/mainColors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 0.90,
            height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                .68,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Per Day',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Text(
                        dog.amount.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'First Day',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Text(
                        DateFormat.yMMMEd().format(dog.arrivalDate).toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Last Day',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Text(
                        DateFormat.yMMMEd().format(dog.departureDate).toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
