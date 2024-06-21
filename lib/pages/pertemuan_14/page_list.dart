import 'package:belajar_flutter/pages/pertemuan_14/model_artikel.dart';
import 'package:flutter/material.dart';

class Pertemuan14 extends StatefulWidget {
  const Pertemuan14({super.key});

  @override
  State<Pertemuan14> createState() => _Pertemuan14State();
}

class _Pertemuan14State extends State<Pertemuan14> {
  List<Artikel> _artikelData = [];

  void _getAllData() {
    Artikel.getAll().then((value) {
      setState(() {
        if (value != null) {
          _artikelData = value;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Pertemuan 14"),
          actions: [
            ElevatedButton(
              onPressed: () {
                _artikelData.clear();
                _getAllData();
              },
              child: const Icon(Icons.refresh),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: _artikelData.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 5,
              margin: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  // ...
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Image.network(
                        _artikelData[index].thumbnail,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _artikelData[index].title,
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                            softWrap: true,
                            style: const TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            _artikelData[index].pubDate,
                            style: const TextStyle(
                              color: Colors.green,
                              fontFamily: "Poppins",
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            _artikelData[index].description,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () {
              // ...
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
