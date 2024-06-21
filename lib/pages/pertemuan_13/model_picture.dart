// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;

class Picture {
  String id;
  String author;
  int width;
  int height;
  String url;
  String download_url;

  Picture({
    required this.id,
    required this.author,
    required this.width,
    required this.height,
    required this.url,
    required this.download_url,
  });

  factory Picture.mapping(Map<String, dynamic> object) {
    return Picture(
      id: object['id'],
      author: object['author'],
      width: object['width'],
      height: object['height'],
      url: object['url'],
      download_url: object['download_url'],
    );
  }

  static Future<List<Picture>?> getAll() async {
    try {
      var urlData = Uri.parse("https://picsum.photos/v2/list");
      var resultData = await http.get(urlData, headers: {
        'Content-Type': 'application/json',
      });
      if (resultData.statusCode == 200) {
        var jsonData = jsonDecode(resultData.body);
        var data = jsonData;
        List<Picture> datas = [];
        for (int i = 0; i < data.length; i++) {
          datas.add(Picture.mapping(data[i]));
        }
        return datas;
      } else {
        return null;
      }
    } catch (err) {
      // print(err);
      return null;
    }
  }
}
