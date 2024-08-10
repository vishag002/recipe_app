import 'dart:convert';

import 'package:recipe_app/models/receipe_model.dart';
import 'package:http/http.dart' as http;

class ReceipieApi {
  static Future<List<Recipie>> getRecipe() async {
    var uri = Uri.https(
        'yummly2.p.rapidapi.com', '/feeds/list', {'limit': '24', 'start': '0'});

    final response = await http.get(uri, headers: {
      'x-rapidapi-key': '9621e3954amsh283d94076b12d61p129b7bjsn98fdb423a782',
      'x-rapidapi-host': 'yummly2.p.rapidapi.com'
    });

    Map data = jsonDecode(response.body);
    List temp = [];

    for (var i in data['feed']) {
      temp.add(i['content']['details']);
    }

    return Recipie.recipiesFromSnapshot(temp);
  }
}
