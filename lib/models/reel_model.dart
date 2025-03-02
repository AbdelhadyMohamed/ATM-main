// To parse this JSON data, do
//
//     final reelModel = reelModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

ReelModel reelModelFromJson(String str) => ReelModel.fromJson(json.decode(str));

String reelModelToJson(ReelModel data) => json.encode(data.toJson());
class ReelModel {
  final int? id;
  final String? summary;
  final int? duration;
  final String? status;
  final List<dynamic>? tags;
   int? likesCount;
  final int? unlikesCount;
  final int? sharesCount;
  final int? commentsCount;
   bool isFollow;
   bool isLiked;
  final Upload? upload;
  final Advertiser? advertiser;
  final List<dynamic>? viewLogs;

  ReelModel({
    this.id,
    this.summary,
    this.duration,
    this.status,
    this.tags,
    this.likesCount,
    this.unlikesCount,
    this.sharesCount,
    this.commentsCount,
    this.isFollow = false,
    this.isLiked = false,
    this.upload,
    this.advertiser,
    this.viewLogs,
  });

  factory ReelModel.fromJson(Map<String, dynamic> json) => ReelModel(
    id: json["id"],
    summary: json["summary"],
    duration: json["duration"],
    status: json["status"],
    tags: json["tags"] == null ? [] : List<dynamic>.from(json["tags"]!.map((x) => x)),
    likesCount: json["likes_count"],
    unlikesCount: json["unlikes_count"],
    sharesCount: json["shares_count"],
    commentsCount: json["comments_count"],
    isFollow: json["isFollow"]??false,
    isLiked: json["isLiked"]??false,
    upload: json["upload"] == null ? null : Upload.fromJson(json["upload"]),
    advertiser: json["advertiser"] == null ? null : Advertiser.fromJson(json["advertiser"]),
    viewLogs: json["view_logs"] == null ? [] : List<dynamic>.from(json["view_logs"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "summary": summary,
    "duration": duration,
    "status": status,
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
    "likes_count": likesCount,
    "unlikes_count": unlikesCount,
    "shares_count": sharesCount,
    "comments_count": commentsCount,
    "isFollow": isFollow,
    "isLiked": isLiked,
    "upload": upload?.toJson(),
    "advertiser": advertiser?.toJson(),
    "view_logs": viewLogs == null ? [] : List<dynamic>.from(viewLogs!.map((x) => x)),
  };
}

class Advertiser {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? phoneNumber;
  final String? companyName;
  final String? brandName;
  final String? country;
  final String? city;
  final dynamic photo;
  final String? photoUrl;
  final dynamic profilePicture;

  Advertiser({
    this.id,
    this.firstName,
    this.lastName,
    this.fullName,
    this.phoneNumber,
    this.companyName,
    this.brandName,
    this.country,
    this.city,
    this.photo,
    this.photoUrl,
    this.profilePicture,
  });

  factory Advertiser.fromJson(Map<String, dynamic> json) => Advertiser(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    fullName: json["full_name"],
    phoneNumber: json["phone_number"],
    companyName: json["company_name"],
    brandName: json["brand_name"],
    country: json["country"],
    city: json["city"],
    photo: json["photo"],
    photoUrl: json["photo_url"],
    profilePicture: json["profile_picture"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "full_name": fullName,
    "phone_number": phoneNumber,
    "company_name": companyName,
    "brand_name": brandName,
    "country": country,
    "city": city,
    "photo": photo,
    "photo_url": photoUrl,
    "profile_picture": profilePicture,
  };
}

class Upload {
  final int? id;
  final String? path;
  final String? mimeType;
   String? pathUrl;
  final List<Variation>? variations;

  Upload({
    this.id,
    this.path,
    this.mimeType,
    this.pathUrl,
    this.variations,
  });

  factory Upload.fromJson(Map<String, dynamic> json) => Upload(
    id: json["id"],
    path: json["path"],
    mimeType: json["mimeType"],
    pathUrl: json["path_url"],
    variations: json["variations"] == null ? [] : List<Variation>.from(json["variations"]!.map((x) => Variation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "path": path,
    "mimeType": mimeType,
    "path_url": pathUrl,
    "variations": variations == null ? [] : List<dynamic>.from(variations!.map((x) => x.toJson())),
  };
}

class Variation {
  final String? type;
  final String? path;
  final String? pathUrl;

  Variation({
    this.type,
    this.path,
    this.pathUrl,
  });

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
    type: json["type"],
    path: json["path"],
    pathUrl: json["path_url"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "path": path,
    "path_url": pathUrl,
  };
}


class ActionReelModel {
  final String image;
  final Function(String,BuildContext) onTap;

  ActionReelModel({required this.onTap, required this.image});
}