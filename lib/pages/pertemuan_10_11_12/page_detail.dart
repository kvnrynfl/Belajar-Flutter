import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'page_edit.dart';
import 'model_artikel.dart';

class PageDetail extends StatefulWidget {
  final int artikelId;
  const PageDetail({super.key, required this.artikelId});

  @override
  State<PageDetail> createState() => _PageDetailState();
}

class _PageDetailState extends State<PageDetail> {
  late Artikel _artikelData = Artikel(id: 0, title: '', image: '', description_short: '', description_long: '', created_by: '', created_at: '');
  // late Artikel _artikelData;

  // String _convertDate(String dateString) {
  //   DateTime parseDate = new DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateString);
  //   var inputDate = DateTime.parse(parseDate.toString());
  //   var outputFormat = DateFormat('EEEE, dd MMMM yyyy - hh:mm:ss');
  //   var outputDate = outputFormat.format(inputDate);
  //   return outputDate;
  // }

  void _getById() {
    Artikel.getById(widget.artikelId.toString()).then((value) {
      setState(() {
        if (value != null) {
          _artikelData = value;
        }
      });
    });
  }

  void _deleteById() {
    Artikel.deleteById(widget.artikelId.toString()).then((value) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Informasi"),
            content: const Text("Data berhasil dihapus."),
            actions: [
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _getById();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Halaman Detail"),
          actions: [
            ElevatedButton(
              onPressed: () {},
              child: const Icon(Icons.refresh),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return PageEdit(artikelId: widget.artikelId);
                  }),
                );
              },
              child: const Icon(Icons.edit),
            ),
            ElevatedButton(
              onPressed: () {
                _deleteById();
                Navigator.pop(context);
              },
              child: const Icon(Icons.delete),
            )
          ],
        ),
        body: _artikelData.id > 0
            ? ListView(
                padding: const EdgeInsets.all(10),
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Image.network(
                      _artikelData.image,
                      width: 100,
                      height: 200,
                      fit: BoxFit.none,
                    ),
                  ),
                  Text(
                    _artikelData.title,
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
                    'Penulis : ${_artikelData.created_by}',
                    style: const TextStyle(
                      color: Colors.green,
                      fontFamily: "Poppins",
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    _artikelData.description_long,
                    softWrap: true,
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 12,
                    ),
                  )
                ],
              )
            : const Text(""),
      ),
    );
  }
}
