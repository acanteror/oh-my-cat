import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:oh_my_cat/features/random_cat/domain/models/random_cat.dart';
import 'package:oh_my_cat/features/random_cat/domain/repositories/random_cat_repository.dart';

class ApiRandomCatRepository implements RandomCatRepository {
  static const catHost = 'https://cataas.com/';
  static const randomCatEndpoint = 'cat?json=true';
  @override
  Future<RandomCat> fetchRandomCat() async {
    try {
      final _response = await http.get(
        Uri.parse('$catHost$randomCatEndpoint'),
      );
      final _jsonResponse = json.decode(_response.body);

      final _randomCat =
          RandomCat.fromJson(_jsonResponse as Map<String, dynamic>);
      print(_randomCat);
      return _randomCat;
    } catch (e) {
      throw Exception();
    }
  }
}
