import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("IMC Calculator"),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _showDialog();
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 5.0, 10, 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person_pin_circle,
                  size: 100, color: Colors.deepPurple),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Weight',
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Height',
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Container(
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () {
                          _showDialog();
                        },
                        child: Text(
                          "Calc",
                          style: TextStyle(color: Colors.white, fontSize: 25.0),
                        ),
                        color: Colors.deepPurple,
                      )))
            ],
          ),
        ));
  }

  Future<void> _showDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('IMC Calc'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('The result is: '),
              ],
            ),
          ),
        );
      },
    );
  }

  double _calcImc() {
    return 0.0;
  }
}
