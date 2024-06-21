import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'model_artikel.dart';

class PageAdd extends StatefulWidget {
  const PageAdd({super.key});

  @override
  State<PageAdd> createState() => _PageAddState();
}

class _PageAddState extends State<PageAdd> {
  final format = DateFormat("yyyy-MM-dd");
  final titleCtrl = TextEditingController();
  final descriptionShortCtrl = TextEditingController();
  final descriptionLongCtrl = TextEditingController();
  final createdByCtrl = TextEditingController();
  final createdAtCtrl = TextEditingController();

  void _postData() {
    Artikel.postData(titleCtrl.text, descriptionShortCtrl.text, descriptionLongCtrl.text, createdByCtrl.text, createdAtCtrl.text).then((value) {
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
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Halaman Tambah"),
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
                    _postData();
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
