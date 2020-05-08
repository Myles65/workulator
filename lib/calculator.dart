import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneytextformfield/moneytextformfield.dart';
import'size_config.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  double num1 = 0.0, num2 = 0.0;
  TextEditingController controllerNum1 = TextEditingController(text: '');
  TextEditingController controllerNum2 = TextEditingController(text: '');

  double result;


  void divideNumbers() {
    setState(() {
      num1 = double.parse(controllerNum1.text);
      num2 = double.parse(controllerNum2.text);
      result = (num1 / num2) .roundToDouble();


    });
  }

  void clearNumbers() {
    num1 = 0.0;
    num2 = 0.0;
    controllerNum1.text = '';
    controllerNum2.text = '';
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if (result == null){
      result = 0;
    }
    return MaterialApp(
        home: Scaffold(

          body: Padding(
            padding: const EdgeInsets.fromLTRB(0,30,0,0),
            child: SingleChildScrollView(
              child:
              Column(
                children: <Widget>[
                  Text(
                    'Finacial Goal',
                    style: GoogleFonts.breeSerif(fontSize: SizeConfig.safeBlockHorizontal * 8),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(30,0,30,10),
                      child:
//                  TextField(
//                    keyboardType: TextInputType.number,
//                    textAlign: TextAlign.center,
//                    style: GoogleFonts.breeSerif(),
//                    decoration: InputDecoration(hintText: '500'),
//                    controller: controllerNum1,
//                  ),
                      MoneyTextFormField(
                          settings: MoneyTextFormFieldSettings(
                            controller: controllerNum1,
                          )
                      )
                  ),
                  Text(
                    'Earnings',
                    style: GoogleFonts.breeSerif(fontSize: SizeConfig.safeBlockHorizontal * 8,),
                  ),
                  Text(
                    'Per Hour',
                    style: GoogleFonts.breeSerif(fontSize: SizeConfig.safeBlockHorizontal * 4,),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                      child:
//                  TextField(
//                    keyboardType: TextInputType.number,
//                    textAlign: TextAlign.center,
//                    style: GoogleFonts.breeSerif(),
//                    decoration: InputDecoration(hintText: '7.25'),
//                    controller: controllerNum2,
//                  ),
                      MoneyTextFormField(
                          settings: MoneyTextFormFieldSettings(
                            controller: controllerNum2,
                          )
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,0,0),
                    child: Text(
                      'Hours needed: $result',
                      style: GoogleFonts.breeSerif(fontSize: SizeConfig.safeBlockHorizontal * 8,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 10),
                    child: RaisedButton(
                      color: Color(0xFF85bb65),
                      splashColor: Colors.black,
                      child: Text('Workulate',
                          style: GoogleFonts.breeSerif(fontSize: SizeConfig.safeBlockHorizontal * 8,textStyle: TextStyle(color: Colors.white))
                      ),
                      onPressed:divideNumbers ,
                    ),
                  ),
                  OutlineButton(
                    color: Colors.white,
                    splashColor: Color(0xFF85bb65),
                    child: Text('Clear',
                        style: GoogleFonts.breeSerif(fontSize: SizeConfig.safeBlockHorizontal * 4)
                    ),
                    onPressed:clearNumbers ,
                  ),
                ],
              ),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false);
  }
}
