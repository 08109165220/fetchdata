import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'commentmodel.dart';
import 'state.dart';

class CommentsLogic extends GetxController {
  final CommentsState state = CommentsState();





  String  baserver="https://jsonplaceholder.typicode.com";
  Map<String,String> headers= {
    'content-type': 'application/json',
    'Accept': 'application/json',
    // 'Authorization': "Bearer dggdgdgfgf2f353gedhdhdxxgdgegegdxdheheheheh" ,
  };
  Future<List<comments>> getcomments ({required String id}) async{
    List<comments> postsList=[];
    /// lets make  connections to the server

    /// let define URL to parse our stringed  endpoint
    Uri uri=Uri.parse(baserver+"/posts/$id/comments");
    /// let make a get request
    http.Response response= await http.get(uri,headers: headers);
    print('response ${response.body.runtimeType}');

    List<dynamic> json = jsonDecode(response.body);
    json.forEach((element) {
      postsList.add(comments.fromJson(element));
    });

    print('response ${json}');
    return postsList;
  }
}

