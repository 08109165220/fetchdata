
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../posts/view.dart';
import 'logic.dart';

class DogListPage extends StatelessWidget {
  final logic = Get.put(DogListLogic());
  final state = Get
      .find<DogListLogic>()
      .state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pets page",
            style: TextStyle(
              color: Colors.black38,
            )),
      ),
      body: Obx(() {
        return ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: logic.dogModel.value.data!.length,
          itemBuilder: (context, index) =>
              CustomCard(
                  breed: logic.dogModel.value.data![index].breed!,
                  name: logic.dogModel.value.data![index].name!,
                  color: logic.dogModel.value.data![index].color),
        );
      }),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.name,
    required this.breed,
    this.color,
  });

  final String name;
  final String breed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color == null ? Colors.orange : color),
        child: ListTile(onTap: () => Get.to(PostsPage()),
          leading: CircleAvatar(child: Text(name[0])),
          title: Text(name),
          subtitle: Text(breed),
        ));
  }
}
