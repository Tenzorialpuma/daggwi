import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/Dog.dart';

class Chart extends StatelessWidget {
  final List<Dog> recentDogsProfit;

  Chart(this.recentDogsProfit);

  List<Map<String, Object>> get groupedDogData {
    return List.generate(7, (index) {
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
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedDogData.map((data) {
              return Flexible(child: Container(color: Colors.amberAccent,));
            }).toList(),
          ),
        ));
  }
}
