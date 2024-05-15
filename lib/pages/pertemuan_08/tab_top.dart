import 'package:belajar_flutter/pages/pertemuan_08/tab1.dart';
import 'package:belajar_flutter/pages/pertemuan_08/tab2.dart';
import 'package:belajar_flutter/pages/pertemuan_08/tab3.dart';
import 'package:flutter/material.dart';

class TabTop extends StatefulWidget {
  const TabTop({super.key});

  @override
  State<TabTop> createState() => _TabTopState();
}

class _TabTopState extends State<TabTop> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Tab Atas'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                  text: "Home",
                ),
                Tab(
                  icon: Icon(Icons.settings),
                  text: "Settings",
                ),
                Tab(
                  icon: Icon(Icons.people),
                  text: "User",
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Tab1(),
              Tab2(),
              Tab3()
            ],
          ),
        ),
      ),
    );
  }
}
