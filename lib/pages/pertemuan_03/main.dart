import 'package:flutter/material.dart';

class Pertemuan03 extends StatelessWidget {
  const Pertemuan03({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              Icon(Icons.android_rounded),
              SizedBox(
                width: 15,
              ),
              Text(
                "Pertemuan 3",
                style: TextStyle(fontFamily: "Poppins"),
              ),
            ],
          ),
          actions: [
            const IconButton(
              onPressed: null,
              icon: Icon(Icons.settings),
              color: Colors.black,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
              color: Colors.black,
            )
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.centerLeft,
                end: FractionalOffset.centerRight,
                colors: [
                  Color.fromARGB(255, 17, 130, 59),
                  Color(0xff91f086),
                ],
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            // !loop this card
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
                      image: AssetImage("assets/images/post/gilbert_meninggoy.png"),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: 250,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ini adalah judul yang cukup panjang supaya 2 baris",
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          softWrap: true,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "1 Maret 2022",
                          style: TextStyle(
                            color: Colors.green,
                            fontFamily: "Poppins",
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          "Ini adalah deskripsi berita isinya adalah asal aja yang penting panjang ya brooooooo. Tempor non mollit est sit aliqua minim mollit culpa veniam. Ad dolore ex adipisicing ea enim tempor id duis reprehenderit. Enim aliqua duis nostrud officia magna. Lorem enim magna cillum tempor occaecat dolor adipisicing non veniam consequat voluptate.",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: TextStyle(
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
          ],
        ),
      ),
    );
  }
}
