import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import 'datamodel.dart';
import 'logic.dart';

class PostdataPage extends StatelessWidget {
  final logic = Get.put(PostdataLogic());
  final state = Get.find<PostdataLogic>().state;
  final TextEditingController controller = TextEditingController();
  Future<Album>? futureAlbum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post Data Page')),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: futureAlbum == null
            ? buildColumn()
            : buildFutureBuilder()
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextFormField(
          controller: controller,
          decoration:  InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Title'),
        ),

        ElevatedButton(
          onPressed: () {
            logic.createAlbum(controller.text);
          },
          child:  Text('collect&post'),
        ),
      ],
    );
  }

  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
        future: futureAlbum!,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.title);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              margin: EdgeInsets.all(10),
              height: 100,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          );
        });
  }}


