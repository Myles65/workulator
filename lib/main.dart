import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'calculator.dart';
//import 'info.dart';
import 'salary.dart';
import 'size_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.breeSerifTextTheme()
              .apply(bodyColor: Colors.black, displayColor: Colors.black),
        ),
        home: MyNavigationBar(),
        debugShowCheckedModeBanner: false);
  }
}

class MyNavigationBar extends StatefulWidget {
  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Calculator(),
    Salary(),
    //InfoPage(),
  ];
  TabController _tabController;

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
      _tabController.animateTo(_currentIndex);
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _children.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: _children[_currentIndex],
      appBar: AppBar(
        elevation: 0.0,
        title: Center(
          child: Text(
            'Workulator',
            style: GoogleFonts.breeSerif(
                fontSize: SizeConfig.safeBlockHorizontal * 8,
                textStyle: TextStyle(color: Color(0xFF85bb65))),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTappedBar,
        fixedColor: Color(0xFF85bb65),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time, color: Colors.black),
              title: Text(
                'Hourly',
                style: GoogleFonts.breeSerif(
                  fontSize: SizeConfig.safeBlockHorizontal * 4,
                ),
              )),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money, color: Colors.black),
            title: Text(
              'Salary',
              style: GoogleFonts.breeSerif(
                fontSize: SizeConfig.safeBlockHorizontal * 4,
              ),
            ),
          ),
//          **Info page tab in case I want to add later
//          BottomNavigationBarItem(
//              icon: Icon(
//                Icons.info_outline,
//                color: Colors.black,
//              ),
//              title: Text('Info')),
        ],
      ),
    );
  }
}
