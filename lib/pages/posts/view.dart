import 'dart:math';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapi_tutorial/pages/posts/post_model.dart';
import 'package:shimmer/shimmer.dart';

import '../comments/logic.dart';
import '../comments/view.dart';
import '../comments/view.dart';
import 'logic.dart';

class PostsPage extends StatelessWidget {
  final logic = Get.put(PostsLogic());
  final state = Get.find<PostsLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Posts")),
      body: FutureBuilder<List<PostsModel>>(
          future: logic.getPosts(),
          builder: (context, snapShot) {
            if (snapShot.hasData && snapShot.data!.length > 0) {
              return ListView.builder(
                itemBuilder: (context, index) => CustomPostCard(
                    title: snapShot.data![index].title!,
                    description: snapShot.data![index].body!,
                  postsModel:  snapShot.data![index],),
            itemCount:snapShot.data!.length ,  );
            } else if (snapShot.connectionState == ConnectionState.waiting) {
              return ListView.builder(
                itemBuilder: (context, index) => Shimmer.fromColors(
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
                ),
                itemCount: 10,
              );
            } else {
              return Center(
                child: Icon(Icons.warning_amber_sharp,
                    color: Colors.red, size: 40),
              );
            }
          }),
    );
  }
}

class CustomPostCard extends StatelessWidget {
  CustomPostCard({
    super.key,
    required this.title,
    required this.description,
    required this.postsModel,
  });
  final PostsModel postsModel;
  final String title;
  final String description;
  final logic = Get.put(PostsLogic());

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          // height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.black54),
          child: ExpansionTile(
              leading: CircleAvatar(
                  child: Icon(logic
                      .listoficons[Random().nextInt(logic.listoficons.length)]),
                  backgroundColor: Colors
                      .primaries![Random().nextInt(Colors.primaries.length)]),
              childrenPadding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              collapsedIconColor: Colors.white,
              collapsedTextColor: Colors.white,
              iconColor: Colors.white,
              title: Text(title, style: TextStyle(color: Colors.white)),
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Text(description,
                            style: TextStyle(color: Colors.white))),
                    ElevatedButton(onPressed: () {
                      Get.to(CommentsPage(postsModel:postsModel ,));
                    }, child: Text("show details"))
                  ],
                ),

              ]),
        ),
      ],
    );
  }
}
