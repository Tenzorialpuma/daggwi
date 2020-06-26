import 'package:dawggi/assets/mainColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/Dog.dart';

class Chart extends StatelessWidget {
  final List<Dog> dogsList;

  Chart(this.dogsList);

  int get todaysPayment {
    final currentDate = DateTime.now();

    var totalSum = 0;

    for (var dogNumberX = 0; dogNumberX < dogsList.length; dogNumberX++) {
      if (dogsList[dogNumberX].departureDate.day == currentDate.day &&
          dogsList[dogNumberX].departureDate.month == currentDate.month &&
          dogsList[dogNumberX].departureDate.year == currentDate.year) {
        totalSum += dogsList[dogNumberX].amount *
                int.parse(dogsList[dogNumberX]
                    .departureDate
                    .difference(dogsList[dogNumberX].arrivalDate)
                    .inDays
                    .toString()) +
            dogsList[dogNumberX].amount;
      }
    }
    return totalSum;
  }

  int get currentDogsStaying {
    var dogCount = 0;

    for (var dogNumberX = 0; dogNumberX < dogsList.length; dogNumberX++) {
      if (dogsList[dogNumberX].arrivalDate.isBefore(DateTime.now()) ||
          dogsList[dogNumberX].arrivalDate == DateTime.now()) {
        dogCount++;
      }
    }

    return dogCount;
  }

  int get numberOfDogsLastDay {
    final currentDate = DateTime.now();

    var dogCount = 0;

    for (var dogNumberX = 0; dogNumberX < dogsList.length; dogNumberX++) {
      if (dogsList[dogNumberX].departureDate.day == currentDate.day &&
          dogsList[dogNumberX].departureDate.month == currentDate.month &&
          dogsList[dogNumberX].departureDate.year == currentDate.year) {
        dogCount++;
      }
    }

    return dogCount;
  }

  int get numberOfDogsFirstDay {
    final currentDate = DateTime.now();

    var dogCount = 0;

    for (var dogNumberX = 0; dogNumberX < dogsList.length; dogNumberX++) {
      if (dogsList[dogNumberX].arrivalDate.day == currentDate.day &&
          dogsList[dogNumberX].arrivalDate.month == currentDate.month &&
          dogsList[dogNumberX].arrivalDate.year == currentDate.year) {
        dogCount++;
      }
    }

    return dogCount;
  }

  // List<Map<String, Object>> get groupedData {
  //   return List.generate(1, (index) {
  //     final weekDay = DateTime.now().subtract(
  //       Duration(days: index),
  //     );

  //     var totalSum = 0.0;

  //     for (var i = 0; i < recentDogsProfit.length; i++) {
  //       if (true
  //           // recentDogsProfit[i].arrivalDate.day == weekDay.day &&
  //           //   recentDogsProfit[i].arrivalDate.month == weekDay.month &&
  //           //   recentDogsProfit[i].arrivalDate.year == weekDay.year
  //           ) {
  //         totalSum += recentDogsProfit[i].amount;
  //         //it should work now
  //       }
  //     }
  //     return {
  //       'day': DateFormat.E().format(weekDay).substring(0, 1),
  //       'amount': totalSum
  //     };
  //   }).reversed.toList();
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color: MainColors.mainPurple,
        elevation: 15,
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Total Dogs: ',
                                style: GoogleFonts.openSans(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            Text(
                              "$currentDogsStaying",
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Dogs Arriving: ',
                                style: GoogleFonts.openSans(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            Text(
                              '$numberOfDogsFirstDay',
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Dogs Leaving: ',
                                style: GoogleFonts.openSans(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            Text(
                              '$numberOfDogsLastDay',
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  // color: Colors.deepOrange,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'Today\'s Payment: ',
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "\$$todaysPayment MX",
                              style: GoogleFonts.openSans(
                                color: MainColors.mainPurple,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
