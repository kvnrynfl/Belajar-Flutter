import 'package:flutter/material.dart';

class Pertemuan02 extends StatelessWidget {
  const Pertemuan02({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Pertemuan 2"),
        ),
        body: Container(
          color: Colors.red,
          margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            // color: Colors.blue,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: <Color>[
                    Colors.white,
                    Colors.blue
                  ],
                ),
                borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text("Text 1"),
                const Text("Text 2"),
                const Text("Text 3"),
                const Row(
                  children: <Widget>[
                    Text("Text 4"),
                    Text("Text 5"),
                    Text("Text 6"),
                  ],
                ),
                Container(
                  color: Colors.blue,
                  width: 150,
                  height: 100,
                  child: const Text(
                    "Aute eiusmod ut veniam aliquip. Aliqua est consequat amet nisi. Et enim cillum quis laboris tempor incididunt magna esse. Laborum eiusmod labore eu occaecat in velit dolore.",
                    maxLines: 4,
                    overflow: TextOverflow.clip,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Masukan NIM",
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Masukan Nama",
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () => {},
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(
                        const Size.fromHeight(50),
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    child: const Text("Ini button"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
