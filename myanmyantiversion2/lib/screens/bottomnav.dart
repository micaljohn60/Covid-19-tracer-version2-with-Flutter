import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:myanmyanti/screens/calls.dart';
import 'package:myanmyanti/screens/dashboard.dart';
import 'package:myanmyanti/screens/doctor.dart';
import 'package:myanmyanti/screens/howtoprevent.dart';
import 'package:myanmyanti/screens/network_sensitive.dart';
import 'package:myanmyanti/screens/news.dart';

class BottomNav extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BottomNavSate();
  }
}

class BottomNavSate extends State<BottomNav>{

  int _selectedIndex = 0;
  PageController _pageController;

  final _pageOpition = [
    NetworkSensitive(
      child: Dashboard(),
    ),
    NetworkSensitive(
        child: howtoprevent(),
    ),
    NetworkSensitive(
        child: Doctor(),
    ),
    NetworkSensitive(
        child: News()
    ),
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _pageOpition[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.ease,
          backgroundColor: Color.fromARGB(150, 99, 178, 158),
        index: 0,
        height: 50,
        items: [
          Icon(Icons.dashboard, size: 30,color: Color.fromRGBO(128, 165, 156, 1),),
          Icon(Icons.pan_tool, size: 30,color: Color.fromRGBO(128, 165, 156, 1)),
          Icon(Icons.local_hospital, size: 30,color: Color.fromRGBO(128, 165, 156, 1)),
          Icon(Icons.new_releases, size: 30,color: Color.fromRGBO(128, 165, 156, 1)),
        ],
        onTap: (int index){
          setState(() {
            _selectedIndex = index;
          });
        }
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Calls()));
      },
      child: Icon(Icons.phone,color: Colors.red,),
      backgroundColor: Colors.white,
    ),
    );

  }

}