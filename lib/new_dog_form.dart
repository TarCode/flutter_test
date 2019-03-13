import 'package:flutter/material.dart';

class AddDogFormPage extends StatefulWidget {
  @override
  _AddDogFormPageState createState() => _AddDogFormPageState();
}

class _AddDogFormPageState extends State<AddDogFormPage> {
  @override
  Widget build(BuildContext context) {
    // new page needs scaffolding!
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new Dog'),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        color: Colors.black54,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 32.0,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                // Text Field is the basic input widget for Flutter.
                // It comes built in with a ton of great UI and
                // functionality, such as the labelText field you see below.
                child: TextField(
                    decoration: InputDecoration(
                  labelText: 'Name the Pup',
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                    decoration: InputDecoration(
                  labelText: "Pup's location",
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'All about the pup',
                  ),
                ),
              ),
              // A Strange situation.
              // A piece of the app that you'll add in the next
              // section *needs* to know its context,
              // and the easiest way to pass a context is to
              // use a builder method. So I've wrapped
              // this button in a Builder as a sort of 'hack'.
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Builder(
                  builder: (context) {
                    // The basic Material Design action button.
                    return RaisedButton(
                      // If onPressed is null, the button is disabled
                      // this is my goto temporary callback.
                      onPressed: () => print('PRESSED'),
                      color: Colors.indigoAccent,
                      child: Text('Submit Pup'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}