import 'package:belajar_flutter/pages/pertemuan_08/tab_bottom.dart';
import 'package:belajar_flutter/pages/pertemuan_08/tab_top.dart';
import 'package:flutter/material.dart';

class Pertemuan08 extends StatefulWidget {
  const Pertemuan08({super.key});

  @override
  State<Pertemuan08> createState() => _Pertemuan08State();
}

class _Pertemuan08State extends State<Pertemuan08> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pertemuan 8"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                child: const Text("Tab Atas"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const TabTop();
                    }),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const TabBottom();
                    }),
                  );
                },
                child: const Text("Tab Bawah"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
