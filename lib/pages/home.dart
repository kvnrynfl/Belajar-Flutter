import 'package:flutter/material.dart';
import 'package:belajar_flutter/pages/pertemuan_01/main.dart';
import 'package:belajar_flutter/pages/pertemuan_02/main.dart';
import 'package:belajar_flutter/pages/pertemuan_03/main.dart';
import 'package:belajar_flutter/pages/pertemuan_04/main.dart';
import 'package:belajar_flutter/pages/pertemuan_05/main.dart';
import 'package:belajar_flutter/pages/pertemuan_06/main.dart';
import 'package:belajar_flutter/pages/pertemuan_07/login_page.dart';
import 'package:belajar_flutter/pages/ujian_tengah_semester/main.dart';
import 'package:belajar_flutter/pages/ujian_tengah_semester/static_data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late StaticData userData;

  @override
  void initState() {
    super.initState();
    userData = StaticData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: ListView(
          children: [
            _buildCardItem(
              title: "Ujian Tengah Semester",
              description: "Cupidatat non nostrud consequat qui qui cupidatat sunt ipsum ullamco consequat.",
              destination: UjianTengahSemester(userData: userData),
            ),
            _buildCardItem(
              title: "Pertemuan 1",
              description: "Cupidatat non nostrud consequat qui qui cupidatat sunt ipsum ullamco consequat.",
              destination: const Pertemuan01(title: "Pertemuan 1"),
            ),
            _buildCardItem(
              title: "Pertemuan 2",
              description: "Cupidatat non nostrud consequat qui qui cupidatat sunt ipsum ullamco consequat.",
              destination: const Pertemuan02(),
            ),
            _buildCardItem(
              title: "Pertemuan 3",
              description: "Cupidatat non nostrud consequat qui qui cupidatat sunt ipsum ullamco consequat.",
              destination: const Pertemuan03(),
            ),
            _buildCardItem(
              title: "Pertemuan 4",
              description: "Cupidatat non nostrud consequat qui qui cupidatat sunt ipsum ullamco consequat.",
              destination: const Pertemuan04(),
            ),
            _buildCardItem(
              title: "Pertemuan 5",
              description: "Cupidatat non nostrud consequat qui qui cupidatat sunt ipsum ullamco consequat.",
              destination: const Pertemuan05(),
            ),
            _buildCardItem(
              title: "Pertemuan 6",
              description: "Cupidatat non nostrud consequat qui qui cupidatat sunt ipsum ullamco consequat.",
              destination: const Pertemuan06(),
            ),
            _buildCardItem(
              title: "Pertemuan 7",
              description: "Cupidatat non nostrud consequat qui qui cupidatat sunt ipsum ullamco consequat.",
              destination: const Pertemuan07(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardItem({
    required String title,
    required String description,
    required Widget destination,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Card(
        child: ListTile(
          title: Text(title),
          subtitle: Text(description),
          leading: const Icon(Icons.album),
        ),
      ),
    );
  }
}
