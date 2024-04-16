import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:easy_debounce/easy_debounce.dart';

class Pertemuan06 extends StatefulWidget {
  const Pertemuan06({super.key});

  @override
  State<Pertemuan06> createState() => _Pertemuan06State();
}

class _Pertemuan06State extends State<Pertemuan06> {
  // data global
  double tinggiButton = 50;
  double lebarButton = 350;

  // data counter
  int angka = 0;

  // data kalkulator
  final List<DropdownMenuItem<String>> operatorItem = [
    const DropdownMenuItem(value: "+", child: Text("Tambah")),
    const DropdownMenuItem(value: "-", child: Text("Kurang")),
    const DropdownMenuItem(value: "*", child: Text("Kali")),
    const DropdownMenuItem(value: "/", child: Text("Bagi")),
  ];
  final panjangCtrl = TextEditingController();
  final lebarCtrl = TextEditingController();
  String operatorSymbol = "";
  double hasil = 0;

  // data news
  int counterNews = 1;
  List<Widget> dataNews = [];

  void funcTambah() {
    setState(() {
      angka++;
    });
  }

  void funcKurang() {
    setState(() {
      angka--;
    });
  }

  void funcTampilPesan(String pesanTampil) {
    Fluttertoast.showToast(
        msg: pesanTampil,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }

  void funcHitung() {
    setState(() {
      switch (operatorSymbol) {
        case "+":
          hasil = double.parse(panjangCtrl.text) + double.parse(lebarCtrl.text);
          break;

        case "-":
          hasil = double.parse(panjangCtrl.text) - double.parse(lebarCtrl.text);
          break;

        case "*":
          hasil = double.parse(panjangCtrl.text) * double.parse(lebarCtrl.text);
          break;

        case "/":
          hasil = double.parse(panjangCtrl.text) / double.parse(lebarCtrl.text);
          break;

        default:
          hasil = 0;
      }

      print(panjangCtrl.text);
      print(lebarCtrl.text);
      print(hasil);
    });
  }

  void funcTambahNews() {
    setState(() {
      dataNews.add(
        Card(
          elevation: 5,
          margin: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: const Image(
                  image: AssetImage("assets/images/gilbert_meninggoy.png"),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ini adalah judul ke - $counterNews",
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      softWrap: true,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const Text(
                      "1 Maret 2022",
                      style: TextStyle(
                        color: Colors.green,
                        fontFamily: "Poppins",
                        fontSize: 10,
                      ),
                    ),
                    const Text(
                      "Nisi commodo consequat velit Lorem ad enim ullamco Lorem duis officia veniam dolor quis. Officia minim mollit quis id tempor ad. Exercitation velit eiusmod reprehenderit irure cupidatat cillum tempor veniam reprehenderit ullamco aute.",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: TextStyle(
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
      counterNews++;
    });
  }

  void funcHapusNews() {
    setState(() {
      dataNews.removeLast();
      counterNews--;
    });
  }

  Column widgetTambahKurang() {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              "Counter : ",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              angka.toString(),
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            funcTambah();
          },
          style: ElevatedButton.styleFrom(
              minimumSize: Size(lebarButton, tinggiButton),
              foregroundColor: Colors.white,
              backgroundColor: Colors.green),
          child: const Text(
            "Tambah",
            style: TextStyle(fontSize: 18),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            funcKurang();
          },
          style: ElevatedButton.styleFrom(
              minimumSize: Size(lebarButton, tinggiButton),
              foregroundColor: Colors.white,
              backgroundColor: Colors.red),
          child: const Text(
            "Kurang",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

  Column widgetTampilPesan() {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            label: Text("Pesan"),
          ),
          minLines: 3,
          maxLines: 10,
          onChanged: (value) {
            EasyDebounce.debounce(
              "my-debouncer",
              const Duration(milliseconds: 500),
              () => funcTampilPesan(value),
            );
          },
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            funcTampilPesan("Halo ini pesan statis");
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(lebarButton, tinggiButton),
            foregroundColor: Colors.white,
            backgroundColor: Colors.orange,
          ),
          child: const Text(
            "Tampilkan Pesan",
            style: TextStyle(fontSize: 18),
          ),
        )
      ],
    );
  }

  Column widgetKalkulator() {
    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
          ],
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            label: Text("Panjang"),
          ),
          controller: panjangCtrl,
        ),
        const SizedBox(height: 10),
        TextField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
          ],
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            label: Text("Lebar"),
          ),
          controller: lebarCtrl,
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField(
          items: operatorItem,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Operator",
          ),
          onChanged: (String? value) {
            operatorSymbol = value!;
          },
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            funcHitung();
          },
          style: ElevatedButton.styleFrom(
              minimumSize: Size(lebarButton, tinggiButton),
              foregroundColor: Colors.white,
              backgroundColor: Colors.lightBlue),
          child: const Text(
            "Hitung",
            style: TextStyle(fontSize: 18),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Text(
              "Hasilnya adalah : ",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              hasil.toString(),
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ],
    );
  }

  Column widgetNews() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                funcTambahNews();
              },
              child: const Text("Tambah Berita"),
            ),
            ElevatedButton(
              onPressed: () {
                funcHapusNews();
              },
              child: const Text("Hapus Berita"),
            )
          ],
        ),
        const SizedBox(height: 10),
        Column(
          children: dataNews,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Pertemuan 6 - Method"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            widgetTambahKurang(),
            const SizedBox(height: 50),
            widgetTampilPesan(),
            const SizedBox(height: 50),
            widgetKalkulator(),
            const SizedBox(height: 50),
            widgetNews(),
          ],
        ),
      ),
    );
  }
}
