import 'package:dawggi/pet_profile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/Dog.dart';

class Doglist extends StatelessWidget {
  final List<Dog> dogs;
  final Function deleteDog;

  Doglist(this.dogs, this.deleteDog);

  @override
  Widget build(BuildContext context) {
    return dogs.isEmpty
        ? Column(
            children: <Widget>[
              Text(
                'No Pets Registered Yet!',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => PetsDetails(this.dogs[index]),
                    ));
                  },
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: FittedBox(
                        child: Text('\$${dogs[index].amount}'),
                      ),
                    ),
                  ),
                  title: Text(
                    dogs[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(dogs[index].arrivalDate) +
                        '  -  ' +
                        DateFormat.yMMMd().format(dogs[index].departureDate),
                  ),
                  trailing: IconButton(
                      icon: Icon(Icons.delete_outline),
                      onPressed: () => deleteDog(dogs[index].id)),
                ),
              );
            },
            itemCount: dogs.length,
          );
  }
}
