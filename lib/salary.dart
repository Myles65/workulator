import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneytextformfield/moneytextformfield.dart';
import'size_config.dart';
class Salary extends StatefulWidget {
  @override
  _SalaryState createState() => _SalaryState();
}

class _SalaryState extends State<Salary> {

  double num1 = 0.0, num2 = 0.0;
  TextEditingController controllerNum1 = TextEditingController(text: '');
  TextEditingController controllerNum2 = TextEditingController(text: '');

  double result;
  double result2;
  double result3;
  double result4;
  double x;
  double x2;
  double x3;
  double x4;

  void divideNumbers() {
    setState(() {
      num1 = double.parse(controllerNum1.text);
      num2 = double.parse(controllerNum2.text);
      x = (num2 / 365.2422);
      x2 = (num2 / 52.178);
      x3 = (num2 / 12);
      x4 = (num2 / 1);
      result = (num1 / x). ceilToDouble();
      result2 = (num1 / x2).ceilToDouble();
      result3 = (num1 / x3).ceilToDouble();
      result4 = (num1 / x4).ceilToDouble();
      result4 = (num1 / x4).ceilToDouble();
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
    if (result == null) {
      result = 0;
    }
    if (result2 == null) {
      result2 = 0;
    }
    if (result3 == null) {
      result3 = 0;
    }
    if (result4 == null) {
      result4 = 0;
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Text(
                  'Finacial Goal',
                  style: GoogleFonts.breeSerif(fontSize: SizeConfig.safeBlockHorizontal * 8),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                    child:
//                TextField(
//                  keyboardType: TextInputType.number,
//                  textAlign: TextAlign.center,
//                  style: GoogleFonts.breeSerif(),
//                  decoration: InputDecoration(hintText: '500'),
//                  controller: controllerNum1,
//                ),

                    MoneyTextFormField(
                        settings: MoneyTextFormFieldSettings(
                          controller: controllerNum1,
                        )
                    )
                ),
                Text(
                  'Salary',
                  style: GoogleFonts.breeSerif(fontSize: SizeConfig.safeBlockHorizontal * 8,),
                ),
                Text(
                  'Annual',
                  style: GoogleFonts.breeSerif(fontSize: SizeConfig.safeBlockHorizontal * 4,),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                    child:
//                TextField(
//                  keyboardType: TextInputType.number,
//                  textAlign: TextAlign.center,
//                  style: GoogleFonts.breeSerif(),
//                  decoration: InputDecoration(hintText: '500'),
//                  controller: controllerNum2,
//                ),
                    Container(
                      child: MoneyTextFormField(
                          settings: MoneyTextFormFieldSettings(
                            controller: controllerNum2,
                          )
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    'Time Needed:',
                    style: GoogleFonts.breeSerif(fontSize: SizeConfig.safeBlockHorizontal * 8,),
                  ),
                ),
                Text(
                  'Days:$result',
                  style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5,),
                ),
                Text(
                  'Weeks:$result2',
                  style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5,),
                ),
                Text(
                  'Months:$result3',
                  style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5,),
                ),
                Text(
                  'Years:$result4',
                  style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5,),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 10),
                  child: RaisedButton(
                    color: Color(0xFF85bb65),
                    splashColor: Colors.white,
                    child: Text('Workulate',
                        style: GoogleFonts.breeSerif(fontSize: SizeConfig.safeBlockHorizontal * 8,textStyle: TextStyle(color: Colors.white))),
                    onPressed: () {
                      divideNumbers();
                    },
                  ),
                ),
                OutlineButton(
                  color: Colors.white,
                  splashColor: Color(0xFF85bb65),
                  child: Text('Clear', style: GoogleFonts.breeSerif(fontSize: SizeConfig.safeBlockHorizontal * 4,)),
                  onPressed: () {
                    clearNumbers();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
