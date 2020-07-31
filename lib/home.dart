import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tietactoe/home_page.dart';
import 'package:tietactoe/home_page1.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final tabs = [
    Center(
      child: HomePage(),
    ),
    Center(
      child: HomePage1(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(),
        home: new Scaffold(
            appBar: AppBar(
              title: Text("Tic Tac Toe"),
              backgroundColor: Colors.lightBlueAccent,
            ),
            body: Center(
                child: SafeArea(
              child: tabs[_currentIndex],
            )),
            bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Colors.lightBlueAccent,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.black,
                iconSize: 30,
                currentIndex: _currentIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.computer),
                    title: Text("Play with Computer"),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.wc),
                    title: Text("Play with Friend"),
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                })));
  }
}
