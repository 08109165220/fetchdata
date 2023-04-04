import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapi_tutorial/pages/posts/post_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

import '../postdata/view.dart';
import 'commentmodel.dart';
import 'logic.dart';

class CommentsPage extends StatelessWidget {
  final logic = Get.put(CommentsLogic());
  final state = Get.find<CommentsLogic>().state;
 final PostsModel postsModel;

  var list = RxList();


   CommentsPage({super.key, required this.postsModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text(postsModel.title!) ),
     body: SmartRefresher(
       enablePullDown: true,
       enablePullUp: false,
       header: WaterDropHeader(),
       controller: RefreshController(),
       onRefresh: () async {

         await logic.getcomments(id: postsModel.id.toString());
         Get.snackbar("List Refreshed", "New data loaded");
       },

       child: FutureBuilder<List<comments>>(
           future: logic.getcomments(id: postsModel.id.toString()),
           builder: (context, snapshot) {
             if (snapshot.hasData && snapshot.data!.length > 0) {

               return

                  ListView.builder(
                   itemBuilder: (context, index) =>
                       Wrap(
                         children: [
                           Wrap(
                             children: [
                               Container(
                                 margin: EdgeInsets.all(8),

                                 width: Get.width,
                                 decoration: BoxDecoration(
                                     color: Colors.white,
                                     boxShadow: [
                                       BoxShadow(color: Colors.black,
                                           spreadRadius: 1,
                                           blurStyle: BlurStyle.outer,
                                           blurRadius: 4)
                                     ],
                                     borderRadius: BorderRadius.only(
                                         topRight: Radius.circular(16),
                                         topLeft: Radius.circular(16),
                                         bottomRight: Radius.circular(16),
                                         bottomLeft: Radius.circular(16))),
                                 child: Padding(
                                   padding: const EdgeInsets.only(
                                       left: 4.0, right: 2),
                                   child: Column(
                                     children: [
                                       Row(
                                         children: [
                                           ShaderMask(shaderCallback: (bounds) {
                                             return LinearGradient(colors: [
                                               Colors.red,
                                               Colors.white
                                             ]).createShader(bounds);
                                           },
                                             child: Text(
                                               " Name: ",
                                               style: TextStyle(
                                                   color: Colors.black87,
                                                   fontSize: 16,
                                                   fontWeight: FontWeight.w600),
                                             ),
                                           ),
                                           Expanded(
                                             child: Text(
                                               "${snapshot.data![index].name!}",
                                               style: TextStyle(
                                                   color: Colors.black54,
                                                   fontSize: 16,
                                                   fontWeight: FontWeight.w600),
                                             ),
                                           ),
                                         ],
                                       ),
                                       Row(
                                         children: [
                                           Text(
                                             " Email: ",
                                             style: TextStyle(
                                                 color: Colors.black87,
                                                 fontSize: 16,
                                                 fontWeight: FontWeight.w600),
                                           ),
                                           Expanded(
                                             child: Text(
                                               "${snapshot.data![index].email!}",
                                               style: TextStyle(
                                                   color: Colors.black54,
                                                   fontSize: 16,
                                                   fontWeight: FontWeight.w600),
                                             ),
                                           ),
                                         ],
                                       ),
                                       Row(
                                         children: [
                                           Text(
                                             " Body: ",
                                             style: TextStyle(
                                                 color: Colors.black87,
                                                 fontSize: 16,
                                                 fontWeight: FontWeight.w600),
                                           ),
                                           Expanded(
                                             child: Text(
                                               "${snapshot.data![index].body!}",
                                               style: TextStyle(
                                                   color: Colors.black54,
                                                   fontSize: 16,
                                                   fontWeight: FontWeight.w600),
                                             ),
                                           ),

                                         ],
                                       ),

                                     ],

                                   ),
                                 ),

                               ),
                               ElevatedButton(
                                   onPressed: () {
                                     Get.to(PostdataPage());
                                   }, child: Text("Post",style: TextStyle(color: Colors.green),)),
                             ],
                           ),
                         ],
                       ),
                   itemCount: snapshot.data!.length,
                    // prototypeItem: ElevatedButton(
                    //     onPressed: () {
                    //       Get.to(PostdataPage());
                    //     }, child: Text("Post")),
                 );

}


             else if (snapshot.connectionState == ConnectionState.waiting) {
               return ListView.builder(
                 itemBuilder: (context, index) =>
                     Shimmer.fromColors(
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
             }
             else {
               return Center(
                 child: Icon(Icons.warning_amber_sharp,
                     color: Colors.red, size: 40),
               );
               
             }
           }
           
       ),
       
     ),
      
    );
  }

  }

