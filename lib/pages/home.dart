import 'package:belajar_flutter/pages/pertemuan_01/main.dart';
import 'package:belajar_flutter/pages/pertemuan_02/main.dart';
import 'package:belajar_flutter/pages/pertemuan_03/main.dart';
import 'package:belajar_flutter/pages/pertemuan_04/main.dart';
import 'package:belajar_flutter/pages/pertemuan_05/main.dart';
import 'package:belajar_flutter/pages/pertemuan_06/main.dart';
import 'package:belajar_flutter/pages/pertemuan_07/login_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: ListView(
          children: const [
            CardItem(
              title: "Pertemuan 1",
              description:
                  "Cupidatat non nostrud consequat qui qui cupidatat sunt ipsum ullamco consequat.",
              destination: Pertemuan01(title: "Pertemuan 1"),
            ),
            CardItem(
              title: "Pertemuan 2",
              description:
                  "Cupidatat non nostrud consequat qui qui cupidatat sunt ipsum ullamco consequat.",
              destination: Pertemuan02(),
            ),
            CardItem(
              title: "Pertemuan 3",
              description:
                  "Cupidatat non nostrud consequat qui qui cupidatat sunt ipsum ullamco consequat.",
              destination: Pertemuan03(),
            ),
            CardItem(
              title: "Pertemuan 4",
              description:
                  "Cupidatat non nostrud consequat qui qui cupidatat sunt ipsum ullamco consequat.",
              destination: Pertemuan04(),
            ),
            CardItem(
              title: "Pertemuan 5",
              description:
                  "Cupidatat non nostrud consequat qui qui cupidatat sunt ipsum ullamco consequat.",
              destination: Pertemuan05(),
            ),
            CardItem(
              title: "Pertemuan 6",
              description:
                  "Cupidatat non nostrud consequat qui qui cupidatat sunt ipsum ullamco consequat.",
              destination: Pertemuan06(),
            ),
            CardItem(
              title: "Pertemuan 7",
              description:
                  "Cupidatat non nostrud consequat qui qui cupidatat sunt ipsum ullamco consequat.",
              destination: Pertemuan07(),
            ),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.title,
    required this.description,
    required this.destination,
  });

  final String title;
  final String description;
  final Widget destination;

  @override
  Widget build(BuildContext context) {
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
