// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'model_picture.dart';

class PagePicture extends StatefulWidget {
  const PagePicture({super.key});

  @override
  State<PagePicture> createState() => _PagePictureState();
}

class _PagePictureState extends State<PagePicture> {
  List<Picture> _PictureData = [];

  void _getAllData() {
    Picture.getAll().then((value) {
      setState(() {
        if (value != null) {
          _PictureData = value;
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
          title: const Text("Pertemuan 13"),
          actions: [
            ElevatedButton(
              onPressed: () {
                _PictureData.clear();
                _getAllData();
              },
              child: const Icon(Icons.refresh),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: _PictureData.length,
          itemBuilder: (BuildContext context, index) {
            return Card(
              elevation: 5,
              margin: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Image.network(
                        _PictureData[index].download_url,
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
                            _PictureData[index].author,
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
                            '${_PictureData[index].width} x ${_PictureData[index].height}',
                            style: const TextStyle(
                              color: Colors.green,
                              fontFamily: "Poppins",
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            _PictureData[index].url,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
