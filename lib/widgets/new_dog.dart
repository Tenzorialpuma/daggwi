import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class NewDog extends StatefulWidget {
  final Function addPet;

  NewDog(this.addPet);

  @override
  _NewDogState createState() => _NewDogState();
}

class _NewDogState extends State<NewDog> {
  final _dogNameController = TextEditingController();
  final _dogsObservationsController = TextEditingController();

  File _imageFile;

  static var dropdownValue = '100';
  var integerAmount = int.parse(dropdownValue);

  DateTime _selectedArrivalDate;
  DateTime _selectedDepartureDate;

  Future<void> _pickImage(ImageSource source) async {
    print("photo icon pressed");
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

  void _submitData() {
    if (_dogNameController.text.isEmpty ||
        _dogsObservationsController.text.isEmpty) {
      return;
    }

    final enteredName = _dogNameController.text;
    final enteredObservations = _dogsObservationsController.text;

    File dogPhoto = _imageFile;
    var amount = integerAmount;

    if (enteredName.isEmpty ||
        _selectedArrivalDate == null ||
        _selectedDepartureDate == null ||
        dogPhoto == null) {
      return;
    }

    widget.addPet(enteredName, amount, _selectedArrivalDate,
        _selectedDepartureDate, enteredObservations, dogPhoto);

    Navigator.of(context).pop();
  }

  void _presentArrivalDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2050))
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedArrivalDate = pickedDate;
      });
    });
    print('...');
  }

  void _presentDepartureDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2050))
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDepartureDate = pickedDate;
      });
    });
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Dog Name'),
              controller: _dogNameController,
              onSubmitted: (_) => _submitData(),
            ),
            DropdownButton<String>(
              isExpanded: true,
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              onChanged: (var newSelectedValue) {
                print('the selected value was $newSelectedValue');
                setState(() {
                  dropdownValue = newSelectedValue;
                });
              },
              items: <String>[
                '100',
                '150',
                '250',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedArrivalDate == null
                          ? 'No Date Chosen'
                          : 'Arrival Date: ${DateFormat.yMd().format(_selectedArrivalDate)}',
                    ),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      _selectedArrivalDate == null
                          ? 'Choose Arrival Date'
                          : 'Choose Another Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _presentArrivalDatePicker,
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDepartureDate == null
                          ? 'No Date Chosen'
                          : 'Departure Date: ${DateFormat.yMd().format(_selectedDepartureDate)}',
                    ),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      _selectedArrivalDate == null
                          ? 'Choose Arrival Date'
                          : 'Choose Another Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _presentDepartureDatePicker,
                  ),
                ],
              ),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Observations'),
              controller: _dogsObservationsController,
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 10.0,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.camera_alt),
                    onPressed: () => _pickImage(ImageSource.camera),
                    color: Theme.of(context).primaryColor,
                    iconSize: 45.0,
                  ),
                  Text(
                    _imageFile == null
                        ? '<-- Take A Photo'
                        : 'Photo Taken Sucesfully!',
                    style: GoogleFonts.openSans(fontSize: 14),
                  ),
                  Expanded(child: Container()),
                  RaisedButton(
                    child: Text(
                      'Add Dog',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).textTheme.button.color,
                    onPressed: _submitData,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
