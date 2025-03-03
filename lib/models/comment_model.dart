

import 'package:atm/models/user_model.dart';

class CommentModel {
  final int? id;
  final String? comment;
  final DateTime? createdAt;
  final UserModel? customer;
  final List<List<Reply>> replies;

  CommentModel({
    this.id,
    this.comment,
    this.createdAt,
    this.customer,
    this.replies = const [],
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
    id: json["id"],
    comment: json["comment"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    customer: json["customer"] == null ? null : UserModel.fromJson(json["customer"]),
    replies: json["replies"] == null ? [] : List<List<Reply>>.from(json["replies"]!.map((x) => List<Reply>.from(x.map((x) => Reply.fromJson(x))))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "comment": comment,
    "created_at": createdAt?.toIso8601String(),
    "customer": customer?.toJson(),
    "replies": List<dynamic>.from(replies.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
  };
}


class Reply {
  final int? id;
  final String? comment;
  final DateTime? createdAt;
  final UserModel? customer;


  Reply({
    this.id,
    this.comment,
    this.createdAt,
    this.customer,
  });

  factory Reply.fromJson(Map<String, dynamic> json) => Reply(
    id: json["id"],
    comment: json["comment"],
    customer: json["customer"] == null ? null : UserModel.fromJson(json["customer"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "comment": comment,
    "customer": customer,
    "created_at": createdAt?.toIso8601String(),
  };
}