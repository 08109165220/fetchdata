import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'datamodel.dart';
import 'state.dart';

class PostdataLogic extends GetxController {
  final PostdataState state = PostdataState();
  final TextEditingController controller = TextEditingController();
  final Rxn<Album> album = Rxn<Album>();

  Future<void> createAlbum(String text) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': controller.text,
      }),
    );

    if (response.statusCode == 201) {
      album.value = Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create album.');
    }
  }
}

//   String baseUrl = 'https://jsonplaceholder.typicode.com';
//
//   Future<Album> createAlbum(FutureAlbum) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/albums'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         'title': base64UrlEncode([]),
//       }),
//     );
//
//     if (response.statusCode == 201) {
//       return Album.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to create album.');
//     }
//   }
// }





