import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: TempApp(),
    );
  }
}

class TempApp extends StatefulWidget {
  @override
  TempState createState() => TempState();
}

class TempState extends State<TempApp> {
  late double input;
  late double output;
  late bool fOrC;

  @override
  void initState() {
    super.initState();
    input = 0.0;
    output = 0.0;
    fOrC = true;
  }

  @override
  Widget build(BuildContext context) {
    TextField inputField = TextField(
      keyboardType: TextInputType.number,
      onChanged: (str) {
        //Run everytime user trys to type in a string instead of a number
        try {
          input = double.parse(str);
        } catch (e) {
          input = 0.0; //Input set if the user dose use a string over a number
        }
      },
      decoration: InputDecoration(
          labelText:
              "Input a value in ${fOrC == false ? "Fahrenheit" : "Celsius"}"),
    );
    
    AppBar appBar = AppBar(
      title: Text("Temprature Calculator"),
    );

    Container fahrenheitRadioButton = Container(
      child: Column(
        children: <Widget>[
          // Text("Choose Fahrenheit or Celsius"),
          //       Switch(
          //         value: fOrC, //What we want it bound to
          //         onChanged:  (e) { //What we want to change when button is clicked
          //           setState(() {
          //             fOrC = !fOrC;
          //           });
          //         },
          //       )
          // Checkbox(
          //   value: fOrC,
          //   onChanged: (e) {
          //     setState(() {
          //       fOrC = !fOrC;
          //     });
          //   },
          // ),
          Text("F"),
          Radio<bool>(
              groupValue: fOrC,
              value: false,
              onChanged: (v) {
                setState(() {
                  fOrC = !fOrC;
                });
              }),
        ],
      ),
    );

    Container celsiusRadioButton = Container(
      child: Column(
        children: <Widget>[
          Text("C"),
          Radio<bool>(
              groupValue: fOrC,
              value: true,
              onChanged: (v) {
                setState(() {
                  fOrC = !fOrC;
                });
              }),
        ],
      ),
    );

    Container containerForRadioButtons = Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[fahrenheitRadioButton, celsiusRadioButton]),
    );
    
    return Scaffold(
      appBar: appBar,
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            inputField,
            Text("Choose Fahrenheit or Celsius"),
            containerForRadioButtons
          ],
        ),
      ),
    );
  }
}
