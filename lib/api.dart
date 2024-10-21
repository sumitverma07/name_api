import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:name_api/model/album.dart';

Future<List<Album>> fetchAlbum() async {
  final response = await http.get(
      Uri.parse('https://mocki.io/v1/40138527-6757-47f9-b001-928b87aad5c3'));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as List;
    print('Api response:$data');
    List<Album> postList = data
        .map((json) => Album.fromJson(json as Map<String, dynamic>))
        .toList();
    log('${postList}', name: 'api.dart');
    return postList;
  } else {
    throw Exception('Unable to fetch data');
  }
}
