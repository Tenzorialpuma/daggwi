import 'package:dawggi/widgets/dog_list.dart';
import 'package:dawggi/widgets/new_pet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './assets/mainColors.dart';
import './models/Dog.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dawggi',
      theme: ThemeData(
        primarySwatch: MainColors.mainPurple,
        accentColor: MainColors.mainPurple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Dog> _listOfDogs = [];

  List<Dog> get _recentDogsStaying {
    return _listOfDogs.where((dogName) {
      return dogName.arrivalDate.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewDog(
    String dogName,
    int dogAmount,
    DateTime firstChosenDate,
    DateTime secondChosenDate,
    String observations,
  ) {
    final newDog = Dog(
      title: dogName,
      amount: dogAmount,
      observations: observations,
      arrivalDate: firstChosenDate,
      departureDate: secondChosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _listOfDogs.add(newDog);
    });
  }

  void _startAddNewDog(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewPet(_addNewDog),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteDogs(String id) {
    setState(() {
      _listOfDogs.removeWhere((dog) => dog.id == id);
    });
  }
  

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      centerTitle: true,
      title: Text(
        'Dawggi',
        style: GoogleFonts.pacifico(),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              MainColors.mainPurple,
              MainColors.mainBlue,
            ],
          ),
        ),
      ),
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    .28,
                child: Chart(_recentDogsStaying)),
            Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    .72,
                child: Doglist(_listOfDogs, _deleteDogs)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewDog(context),
      ),
    );
  }
}
