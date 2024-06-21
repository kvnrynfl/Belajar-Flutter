import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'page_add.dart';
import 'page_detail.dart';
import 'model_artikel.dart';

class PageList extends StatefulWidget {
  const PageList({super.key});

  @override
  State<PageList> createState() => _PageListState();
}

class _PageListState extends State<PageList> {
  List<Artikel> _artikelData = [];

  String _convertDate(String dateString) {
    DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateString);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('EEEE, dd MMMM yyyy - hh:mm:ss');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

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
          title: const Text("Pertemuan 10"),
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
          itemBuilder: (BuildContext context, index) {
            return Card(
              elevation: 5,
              margin: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return PageDetail(artikelId: _artikelData[index].id);
                    }),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Image.network(
                        _artikelData[index].image,
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
                            'Penulis : ${_artikelData[index].created_by}',
                            style: const TextStyle(
                              color: Colors.green,
                              fontFamily: "Poppins",
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            _convertDate(_artikelData[index].created_at),
                            style: const TextStyle(
                              color: Colors.green,
                              fontFamily: "Poppins",
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            _artikelData[index].description_short,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const PageAdd();
                }),
              );
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
