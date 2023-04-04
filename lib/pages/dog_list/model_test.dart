class Review {
  int? code;
  List<Data>? data;

  Review({this.code, this.data});

  Review.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? studentId;
  String? proguideId;
  Null? note;
  String? rating;
  String? createdAt;
  String? updatedAt;
  RatedBy? ratedBy;
  UserRated? userRated;

  Data(
      {this.id,
        this.studentId,
        this.proguideId,
        this.note,
        this.rating,
        this.createdAt,
        this.updatedAt,
        this.ratedBy,
        this.userRated});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['student_id'];
    proguideId = json['proguide_id'];
    note = json['note'];
    rating = json['rating'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    ratedBy = json['rated_by'] != null
        ? new RatedBy.fromJson(json['rated_by'])
        : null;
    userRated = json['user_rated'] != null
        ? new UserRated.fromJson(json['user_rated'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['student_id'] = this.studentId;
    data['proguide_id'] = this.proguideId;
    data['note'] = this.note;
    data['rating'] = this.rating;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.ratedBy != null) {
      data['rated_by'] = this.ratedBy!.toJson();
    }
    if (this.userRated != null) {
      data['user_rated'] = this.userRated!.toJson();
    }
    return data;
  }
}

class RatedBy {
  int? id;
  String? fullName;
  Null? username;
  String? email;
  String? profileImage;
  int? countryId;
  Null? bio;
  String? userType;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? status;
  String? referalCode;
  int? badWordCount;
  String? phoneNumber;
  String? maxProguides;
  String? university;

  RatedBy(
      {this.id,
        this.fullName,
        this.username,
        this.email,
        this.profileImage,
        this.countryId,
        this.bio,
        this.userType,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.status,
        this.referalCode,
        this.badWordCount,
        this.phoneNumber,
        this.maxProguides,
        this.university});

  RatedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    username = json['username'];
    email = json['email'];
    profileImage = json['profile_image'];
    countryId = json['country_id'];
    bio = json['bio'];
    userType = json['user_type'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    referalCode = json['referal_code'];
    badWordCount = json['bad_word_count'];
    phoneNumber = json['phone_number'];
    maxProguides = json['max_proguides'];
    university = json['university'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['username'] = this.username;
    data['email'] = this.email;
    data['profile_image'] = this.profileImage;
    data['country_id'] = this.countryId;
    data['bio'] = this.bio;
    data['user_type'] = this.userType;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    data['referal_code'] = this.referalCode;
    data['bad_word_count'] = this.badWordCount;
    data['phone_number'] = this.phoneNumber;
    data['max_proguides'] = this.maxProguides;
    data['university'] = this.university;
    return data;
  }
}

class UserRated {
  int? id;
  String? fullName;
  Null? username;
  String? email;
  Null? profileImage;
  int? countryId;
  Null? bio;
  String? userType;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? status;
  String? referalCode;
  int? badWordCount;
  String? phoneNumber;
  String? maxProguides;
  String? university;

  UserRated(
      {this.id,
        this.fullName,
        this.username,
        this.email,
        this.profileImage,
        this.countryId,
        this.bio,
        this.userType,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.status,
        this.referalCode,
        this.badWordCount,
        this.phoneNumber,
        this.maxProguides,
        this.university});

  UserRated.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    username = json['username'];
    email = json['email'];
    profileImage = json['profile_image'];
    countryId = json['country_id'];
    bio = json['bio'];
    userType = json['user_type'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    referalCode = json['referal_code'];
    badWordCount = json['bad_word_count'];
    phoneNumber = json['phone_number'];
    maxProguides = json['max_proguides'];
    university = json['university'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['username'] = this.username;
    data['email'] = this.email;
    data['profile_image'] = this.profileImage;
    data['country_id'] = this.countryId;
    data['bio'] = this.bio;
    data['user_type'] = this.userType;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    data['referal_code'] = this.referalCode;
    data['bad_word_count'] = this.badWordCount;
    data['phone_number'] = this.phoneNumber;
    data['max_proguides'] = this.maxProguides;
    data['university'] = this.university;
    return data;
  }
}
