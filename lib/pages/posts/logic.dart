import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
/// lets import these packa ge for connection to INTERNET
import 'package:http/http.dart' as http;
import 'package:myapi_tutorial/pages/posts/post_model.dart';

import 'state.dart';

class PostsLogic extends GetxController {
  final PostsState state = PostsState();
  /// lets define the url to the server
  String  baserver="https://jsonplaceholder.typicode.com";
  List<IconData> listoficons = [
    Icons.add_alarm,
    Icons.abc_outlined,
    Icons.ac_unit,
    Icons.access_time_filled_outlined,
    Icons.accessibility_rounded,
    Icons.add_chart,
    Icons.account_box_sharp,
    Icons.access_time,
    Icons.add_alert,
    Icons.add_card_sharp,
    Icons.add_chart_outlined,
    Icons.account_box_sharp
  ];
  Map<String,String> headers= {
    'content-type': 'application/json',
    'Accept': 'application/json',
    // 'Authorization': "Bearer dggdgdgfgf2f353gedhdhdxxgdgegegdxdheheheheh" ,
  };
  Future<List<PostsModel>> getPosts () async{
   List<PostsModel> postsList=[];
/// lets make  connections to the server

/// let define URL to parse our stringed  endpoint
   Uri uri=Uri.parse(baserver+"/posts");
   /// let make a get request
   http.Response response= await http.get(uri,headers: headers);
   print('response ${response.body.runtimeType}');

 List<dynamic> json = jsonDecode(response.body);
 json.forEach((element) {
   postsList.add(PostsModel.fromJson(element));
 });

   print('response ${json}');
    return postsList;
  }
}
