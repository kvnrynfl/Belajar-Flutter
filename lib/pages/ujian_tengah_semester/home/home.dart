import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> articles = List.generate(3, (index) => 'Article ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return Card(
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
                  width: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        articles[index],
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
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new article
          setState(() {
            articles.add('New Article ${articles.length + 1}');
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
