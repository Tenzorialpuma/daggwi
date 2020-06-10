import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewPet extends StatefulWidget {
  final Function addPet;

  NewPet(this.addPet);

  @override
  _NewPetState createState() => _NewPetState();
}

class _NewPetState extends State<NewPet> {
  final _dogNameController = TextEditingController();

  static var dropdownValue = '100';
  var integerAmount = int.parse(dropdownValue);

  DateTime _selectedArrivalDate;
  DateTime _selectedDepartureDate;

  void _submitData() {
    if (_dogNameController.text.isEmpty) {
      return;
    }

    final enteredName = _dogNameController.text;
    var amount = integerAmount;

    if (enteredName.isEmpty ||
        _selectedArrivalDate == null ||
        _selectedDepartureDate == null) {
      return;
    }

    widget.addPet(
      enteredName,
      amount,
      _selectedArrivalDate,
      _selectedDepartureDate,
    );

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
                          : 'Picked Date: ${DateFormat.yMd().format(_selectedArrivalDate)}',
                    ),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Choose Arrival Date',
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
                          : 'Picked Date: ${DateFormat.yMd().format(_selectedDepartureDate)}',
                    ),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Choose Departure Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _presentDepartureDatePicker,
                  ),
                ],
              ),
            ),
            Center(
              child: RaisedButton(
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: _submitData,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
