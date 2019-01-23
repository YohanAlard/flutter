
import 'package:flutter/material.dart';

class DocumentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Document Screen"),
        backgroundColor: Color.fromRGBO(154, 195, 49, 1),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first screen when tapped!
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class Document extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
      return Row();
  }
}