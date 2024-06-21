import 'dart:convert';
import 'package:http/http.dart' as http;

class Artikel {
  int id;
  String link;
  String title;
  String pubDate;
  String description;
  String thumbnail;

  Artikel({required this.id, required this.link, required this.title, required this.pubDate, required this.description, required this.thumbnail});

  factory Artikel.mapping(Map<String, dynamic> object) {
    return Artikel(
      id: 1,
      link: object['link'],
      title: object['title'],
      pubDate: object['pubDate'],
      description: object['description'],
      thumbnail: object['thumbnail'],
    );
  }

  static Future<List<Artikel>?> getAll() async {
    var urlData = Uri.parse("https://api-berita-indonesia.vercel.app/antara/terbaru/");
    var resultData = await http.get(urlData, headers: {
      'Content-Type': 'application/json',
    });
    if (resultData.statusCode == 200) {
      var jsonData = jsonDecode(resultData.body);
      List<Artikel> datas = [];
      for (int i = 0; i < jsonData['data']['posts'].length; i++) {
        datas.add(Artikel.mapping(jsonData['data']['posts'][i]));
      }
      return datas;
    } else {
      return null;
    }
  }
}
