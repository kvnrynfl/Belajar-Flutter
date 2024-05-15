import 'package:belajar_flutter/pages/pertemuan_08/tab1.dart';
import 'package:belajar_flutter/pages/pertemuan_08/tab2.dart';
import 'package:belajar_flutter/pages/pertemuan_08/tab3.dart';
import 'package:flutter/material.dart';

class TabBottom extends StatefulWidget {
  const TabBottom({super.key});

  @override
  State<TabBottom> createState() => _TabBottomState();
}

class _TabBottomState extends State<TabBottom> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Tab1(),
    Tab2(),
    Tab3()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Tab Bawah"),
          ),
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: 'People',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
