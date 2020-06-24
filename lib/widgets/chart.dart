import 'package:dawggi/assets/mainColors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/Dog.dart';
import 'package:google_fonts/google_fonts.dart';

class Chart extends StatelessWidget {
  final List<Dog> recentDogsProfit;

  Chart(this.recentDogsProfit);

  List<Map<String, Object>> get groupedDogData {
    return List.generate(1, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      var totalSum = 0.0;

      for (var i = 0; i < recentDogsProfit.length; i++) {
        if (recentDogsProfit[i].arrivalDate.day == weekDay.day &&
            recentDogsProfit[i].arrivalDate.month == weekDay.month &&
            recentDogsProfit[i].arrivalDate.year == weekDay.year) {
          totalSum += recentDogsProfit[i].amount;
          //it should work now
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalProfit {
    return groupedDogData.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: MainColors.mainPurple,
        elevation: 15,
        margin: EdgeInsets.all(20),
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              child: Row(
                children: [
                  Text(
                    'Today\'s Profit: $totalProfit',
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 24.0, 
                    ),
                  )
                ],
              ),
            )));
  }
}
