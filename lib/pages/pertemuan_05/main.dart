import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Pertemuan05 extends StatefulWidget {
  const Pertemuan05({super.key});

  @override
  State<Pertemuan05> createState() => _Pertemuan05State();
}

class _Pertemuan05State extends State<Pertemuan05> {
  int _counter = 0;
  final double _width = 400;
  final double _height = 50;

  String _message = '';

  double _hasil = 0;
  final panjangCtrl = TextEditingController();
  final lebarCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Pertemuan 05 - Stateless vs Stateful"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            Column(
              children: [
                Row(
                  children: [
                    const Text(
                      "Counter : ",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      _counter.toString(),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.green, minimumSize: Size(_width, _height)),
                  onPressed: () {
                    setState(() {
                      _counter++;
                    });
                  },
                  child: const Text("Tambah"),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.red, minimumSize: Size(_width, _height)),
                  onPressed: () {
                    setState(() {
                      _counter--;
                    });
                  },
                  child: const Text("Kurang"),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Column(
              children: [
                TextFormField(
                  minLines: 3,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Pesan",
                  ),
                  onChanged: (value) {
                    _message = value;
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.orange,
                    minimumSize: Size(_width, _height),
                  ),
                  onPressed: () {
                    Fluttertoast.showToast(
                      msg: _message,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                    );
                  },
                  child: const Text("Tampilkan Pesan"),
                )
              ],
            ),
            const SizedBox(height: 50),
            Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  controller: panjangCtrl,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Panjang",
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  controller: lebarCtrl,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Lebar",
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    minimumSize: Size(_width, _height),
                  ),
                  onPressed: () {
                    setState(() {
                      _hasil = double.parse(panjangCtrl.text) + double.parse(lebarCtrl.text);
                      // print(panjangCtrl.text);
                      // print(lebarCtrl.text);
                      // print(_hasil);
                    });
                  },
                  child: const Text("Hasil"),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      "Hasil : ",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      _hasil.toString(),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
