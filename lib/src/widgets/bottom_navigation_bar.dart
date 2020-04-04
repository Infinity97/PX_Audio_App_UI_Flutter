import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  @override
  _BottomNavigationBarWidgetState createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    int _cIndex = 0;

    void _incrementTab(index) {
      setState(() {
        _cIndex = index;
      });
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _cIndex,
        type: BottomNavigationBarType.shifting ,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit,color: Color.fromARGB(255, 0, 0, 0)),
              title: new Text('')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit,color: Color.fromARGB(255, 0, 0, 0)),
              title: new Text('')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit,color: Color.fromARGB(255, 0, 0, 0)),
              title: new Text('')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm,color: Color.fromARGB(255, 0, 0, 0)),
              title: new Text('')
          )
        ],
        onTap: (index){
          _incrementTab(index);
        },
      )
    );
  }
}