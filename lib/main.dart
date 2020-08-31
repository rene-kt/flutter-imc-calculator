import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                Text('The result is: $_imc'),
              ],
            ),
          ),
        );
      },
    );
  }

  String _imc = "0.0";

  void _resetFields() {
    weightController.text = "";
    heightController.text = "";
    _formKey = GlobalKey<FormState>();
  }

  void _calcImc() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100;
    _imc = (weight / (height * height)).toStringAsPrecision(4);
  }

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
                _resetFields();
              },
            )
          ],
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10, 5.0, 10, 5.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(Icons.person_pin_circle,
                      size: 100, color: Colors.deepPurple),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Weight',
                        ),
                        controller: weightController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please, fill out all the fields";
                          }
                        }),
                  ),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Height',
                      ),
                      controller: heightController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please, fill out all the fields";
                        } else if (value.length > 3) {
                          return "Plase, put a valid height";
                        }
                      }),
                  Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Container(
                          height: 50.0,
                          child: RaisedButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _calcImc();
                                _showDialog();
                              }
                            },
                            child: Text(
                              "Calc",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 25.0),
                            ),
                            color: Colors.deepPurple,
                          )))
                ],
              ),
            )));
  }
}
