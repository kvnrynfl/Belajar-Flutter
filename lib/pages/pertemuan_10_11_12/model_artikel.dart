// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;

class Artikel {
  int id;
  String title;
  String image;
  String description_short;
  String description_long;
  String created_by;
  String created_at;

  Artikel({
    required this.id,
    required this.title,
    required this.image,
    required this.description_short,
    required this.description_long,
    required this.created_by,
    required this.created_at,
  });

  factory Artikel.mapping(Map<String, dynamic> object) {
    return Artikel(
      id: object['id'],
      title: object['title'],
      image: object['image'],
      description_short: object['description_short'],
      description_long: object['description_long'],
      created_by: object['created_by'],
      created_at: object['created_at'],
    );
  }

  static Future<List<Artikel>?> getAll() async {
    var urlData = Uri.parse("https://api.klikdesaku.id/artikel?sort=updated_at:desc");
    var resultData = await http.get(urlData, headers: {
      'Content-Type': 'application/json',
    });
    if (resultData.statusCode == 200) {
      var jsonData = jsonDecode(resultData.body);
      List<Artikel> datas = [];
      for (int i = 0; i < jsonData.length; i++) {
        datas.add(Artikel.mapping(jsonData[i]));
      }
      return datas;
    } else {
      return null;
    }
  }

  static Future<Artikel?> getById(String id) async {
    var urlData = Uri.parse("https://api.klikdesaku.id/artikel/$id");
    var resultData = await http.get(urlData, headers: {
      'Content-Type': 'application/json',
    });
    if (resultData.statusCode == 200) {
      var jsonData = jsonDecode(resultData.body);
      return Artikel.mapping(jsonData);
    } else {
      return null;
    }
  }

  static Future<Artikel?> postData(String title, String description_short, String descriptionLong, String created_by, String created_at) async {
    var urlData = Uri.parse("https://api.klikdesaku.id/artikel");
    final http.Response resultData = await http.post(
      urlData,
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer xxx',
      },
      body: jsonEncode({
        "title": title,
        "description_short": description_short,
        "description_long": descriptionLong,
        "created_by": created_by,
        "created_at": created_at,
      }),
    );
    if (resultData.statusCode == 200) {
      var jsonData = jsonDecode(resultData.body);
      return Artikel.mapping(jsonData);
    } else {
      return null;
    }
  }

  static Future<Artikel?> putData(String id, String title, String description_short, String description_long, String created_by, String created_at) async {
    var urlData = Uri.parse("https://api.klikdesaku.id/artikel/$id");
    final http.Response resultData = await http.put(
      urlData,
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer xxx',
      },
      body: jsonEncode({
        "title": title,
        "description_short": description_short,
        "description_long": description_long,
        "created_by": created_by,
        "created_at": created_at,
      }),
    );
    if (resultData.statusCode == 200) {
      var jsonData = jsonDecode(resultData.body);
      return Artikel.mapping(jsonData);
    } else {
      return null;
    }
  }

  static Future<bool> deleteById(String id) async {
    var urlData = Uri.parse("https://api.klikdesaku.id/artikel/$id");
    var resultData = await http.delete(urlData, headers: {
      'Content-Type': 'application/json',
    });
    if (resultData.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
