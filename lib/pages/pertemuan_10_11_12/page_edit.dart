import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'model_artikel.dart';

class PageEdit extends StatefulWidget {
  final int artikelId;
  const PageEdit({super.key, required this.artikelId});

  @override
  State<PageEdit> createState() => _PageEditState();
}

class _PageEditState extends State<PageEdit> {
  final format = DateFormat("yyyy-MM-dd");
  final titleCtrl = TextEditingController();
  final descriptionShortCtrl = TextEditingController();
  final descriptionLongCtrl = TextEditingController();
  final createdByCtrl = TextEditingController();
  final createdAtCtrl = TextEditingController();

  late Artikel _artikelData = Artikel(id: 0, title: '', image: '', description_short: '', description_long: '', created_by: '', created_at: '');
  // late Artikel _artikelData;

  void _getById() {
    Artikel.getById(widget.artikelId.toString()).then((value) {
      setState(() {
        if (value != null) {
          _artikelData = value;
          titleCtrl.text = _artikelData.title;
          descriptionShortCtrl.text = _artikelData.description_short;
          descriptionLongCtrl.text = _artikelData.description_long;
          createdAtCtrl.text = _artikelData.created_at;
          createdByCtrl.text = _artikelData.created_by;
        }
      });
    });
  }

  void _putData() {
    Artikel.putData(widget.artikelId.toString(), titleCtrl.text, descriptionShortCtrl.text, descriptionLongCtrl.text, createdByCtrl.text, createdAtCtrl.text).then((value) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Informasi"),
            content: const Text("Data berhasil disimpan."),
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
          title: const Text("Halaman Edit"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Judul Artikel",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Contoh: Judul Artikel ...",
                  ),
                  controller: titleCtrl,
                )
              ],
            ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Deskripsi Singkat",
                  style: TextStyle(fontSize: 16),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Contoh: Deskripsi singkat artikel ...",
                  ),
                  controller: descriptionShortCtrl,
                  maxLines: null,
                  minLines: 3,
                  keyboardType: TextInputType.multiline,
                )
              ],
            ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Isi Artikel",
                  style: TextStyle(fontSize: 16),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Contoh: Isi artkel ...",
                  ),
                  controller: descriptionLongCtrl,
                  maxLines: null,
                  minLines: 10,
                  keyboardType: TextInputType.multiline,
                )
              ],
            ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Penulis",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Contoh: Penulis Artikel ...",
                  ),
                  controller: createdByCtrl,
                )
              ],
            ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Tanggal Rilis",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                DateTimeField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Contoh: 2022-01-31",
                  ),
                  controller: createdAtCtrl,
                  format: format,
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(context: context, firstDate: DateTime(1900), initialDate: currentValue ?? DateTime.now(), lastDate: DateTime(2100));
                  },
                ),
              ],
            ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _putData();
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    maximumSize: MaterialStateProperty.all(const Size.fromHeight(40)),
                    fixedSize: MaterialStateProperty.all(const Size.fromWidth(350)),
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  child: const Text("Simpan"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
