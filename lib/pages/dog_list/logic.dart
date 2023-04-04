import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../posts/logic.dart';
import 'dog_model.dart';
import 'model_test.dart';
import 'state.dart';

class DogListLogic extends GetxController {
  final DogListState state = DogListState();
/// an instnce of our dog model in obs;
  var dogModel=DogModel().obs;
  int color= 0xffF0E345;
@override
  void onInit() {  fetchDogDatas();
    // TODO: implement onInit
    super.onInit();
  }
@override
  void onReady() {
  final logic = Get.put(PostsLogic());
  logic.getPosts();
    // TODO: implement onReady
  fetchDogDatas();
    super.onReady();
  }

  Future<void> fetchDogDatas() async{
    String fromInternet = ''' {
	"data": [{
			"name": "Bingo",
			"breed": "LocalDog",
			"color": "0xffF0E345"
		},
		{
			"name": "Linno",
			"breed": "english",
			"color":  "0xffF0E345"
		},
		{
			"name": "zinna",
			"breed": "eligma",
			"color":"0xffF0E345"
		},
		{
			"name": "digo",
			"breed": "abuja",
			"color": "0xffF0E345"
		},
		{
			"name": "vinna",
			"breed": "LocalDog",
			"color":  "0xffF0E345"
		}
	]
}''';

    Map <String,dynamic> json=jsonDecode(fromInternet);
     /// Serializing this map
dogModel.value=DogModel.fromJSON(json);
    print('hell0 ${dogModel.value.data}');
  }

  void fest() {

  var headers= {
    'content-type': 'application/json',
    'Accept': 'application/json',
    // 'Authorization': "Bearer dggdgdgfgf2f353gedhdhdxxgdgegegdxdheheheheh" ,
  };

    /// get the stringed infos from the i nternet RESPOND.BODY
    String from_the_internet = '''{
    "code": 1,
    "data": [
      {
        "id": 1,
        "student_id": "21",
        "proguide_id": "1",
        "note": null,
        "rating": "3.0",
        "created_at": "2023-03-01T02:26:42.000000Z",
        "updated_at": "2023-03-01T03:13:08.000000Z",
        "rated_by": {
          "id": 21,
          "full_name": "Pat Nadis",
          "username": null,
          "email": "patnadisx@gmail.com",
          "profile_image":
              "profile_images/09B5e1TgFCR75vrFfILLF8yDSFMKvk756hXcdvGp.jpg",
          "country_id": 158,
          "bio": null,
          "user_type": "student",
          "email_verified_at": null,
          "created_at": "2023-01-19T15:21:37.000000Z",
          "updated_at": "2023-03-01T03:25:34.000000Z",
          "status": "active",
          "referal_code": "prfUBGV2nAjcdVx",
          "bad_word_count": 2,
          "phone_number": "",
          "max_proguides": "-3",
          "university": "MOUAU"
        },
        "user_rated": {
          "id": 1,
          "full_name": "Lawrence C.",
          "username": null,
          "email": "lawrencechukwuebukaobi2@gmail.com",
          "profile_image": null,
          "country_id": 2,
          "bio": null,
          "user_type": "proguide",
          "email_verified_at": null,
          "created_at": "2022-12-31T07:12:43.000000Z",
          "updated_at": "2022-12-31T07:12:43.000000Z",
          "status": "active",
          "referal_code": "prf3SMbR5UAX1Uv",
          "bad_word_count": 0,
          "phone_number": "",
          "max_proguides": "0",
          "university": "2"
        }
      },
      {
        "id": 1,
        "student_id": "21",
        "proguide_id": "1",
        "note": null,
        "rating": "3.0",
        "created_at": "2023-03-01T02:26:42.000000Z",
        "updated_at": "2023-03-01T03:13:08.000000Z",
        "rated_by": {
          "id": 21,
          "full_name": "Pat Nadis",
          "username": null,
          "email": "patnadisx@gmail.com",
          "profile_image":
              "profile_images/09B5e1TgFCR75vrFfILLF8yDSFMKvk756hXcdvGp.jpg",
          "country_id": 158,
          "bio": null,
          "user_type": "student",
          "email_verified_at": null,
          "created_at": "2023-01-19T15:21:37.000000Z",
          "updated_at": "2023-03-01T03:25:34.000000Z",
          "status": "active",
          "referal_code": "prfUBGV2nAjcdVx",
          "bad_word_count": 2,
          "phone_number": "",
          "max_proguides": "-3",
          "university": "MOUAU"
        },
        "user_rated": {
          "id": 1,
          "full_name": "Lawrence C.",
          "username": null,
          "email": "lawrencechukwuebukaobi2@gmail.com",
          "profile_image": null,
          "country_id": 2,
          "bio": null,
          "user_type": "proguide",
          "email_verified_at": null,
          "created_at": "2022-12-31T07:12:43.000000Z",
          "updated_at": "2022-12-31T07:12:43.000000Z",
          "status": "active",
          "referal_code": "prf3SMbR5UAX1Uv",
          "bad_word_count": 0,
          "phone_number": "",
          "max_proguides": "0",
          "university": "2"
        }
      },
      {
        "id": 1,
        "student_id": "21",
        "proguide_id": "1",
        "note": null,
        "rating": "3.0",
        "created_at": "2023-03-01T02:26:42.000000Z",
        "updated_at": "2023-03-01T03:13:08.000000Z",
        "rated_by": {
          "id": 21,
          "full_name": "Pat Nadis",
          "username": null,
          "email": "patnadisx@gmail.com",
          "profile_image":
              "profile_images/09B5e1TgFCR75vrFfILLF8yDSFMKvk756hXcdvGp.jpg",
          "country_id": 158,
          "bio": null,
          "user_type": "student",
          "email_verified_at": null,
          "created_at": "2023-01-19T15:21:37.000000Z",
          "updated_at": "2023-03-01T03:25:34.000000Z",
          "status": "active",
          "referal_code": "prfUBGV2nAjcdVx",
          "bad_word_count": 2,
          "phone_number": "",
          "max_proguides": "-3",
          "university": "MOUAU"
        },
        "user_rated": {
          "id": 1,
          "full_name": "Lawrence C.",
          "username": null,
          "email": "lawrencechukwuebukaobi2@gmail.com",
          "profile_image": null,
          "country_id": 2,
          "bio": null,
          "user_type": "proguide",
          "email_verified_at": null,
          "created_at": "2022-12-31T07:12:43.000000Z",
          "updated_at": "2022-12-31T07:12:43.000000Z",
          "status": "active",
          "referal_code": "prf3SMbR5UAX1Uv",
          "bad_word_count": 0,
          "phone_number": "",
          "max_proguides": "0",
          "university": "2"
        }
      }
    ]
  }''';

    /// decode the  stringed data
    Map<String, dynamic> jjson = jsonDecode(from_the_internet);
    // String jjsonString=jsonEncode(jjson);

    /// serialize the stringed data
    Review revieww = Review.fromJson(jjson);
    String b = revieww.data![0].userRated!.fullName!;
  }
}
