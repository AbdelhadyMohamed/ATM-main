import 'dart:convert';

class StartVisitModel {
  bool? apiStatus;
  Data? data;
  String? message;

  StartVisitModel({
    this.apiStatus,
    this.data,
    this.message,
  });

  factory StartVisitModel.fromRawJson(String str) => StartVisitModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StartVisitModel.fromJson(Map<String, dynamic> json) => StartVisitModel(
    apiStatus: json["apiStatus"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "apiStatus": apiStatus,
    "data": data?.toJson(),
    "message": message,
  };
}

class Data {
  int? id;
  String? taskId;
  String? visitId;
  String? atmId;
  int? workerId;
  String? comment;
  DateTime? updatedAt;
  DateTime? createdAt;

  Data({
    this.id,
    this.taskId,
    this.visitId,
    this.atmId,
    this.workerId,
    this.comment,
    this.updatedAt,
    this.createdAt,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    taskId: json["task_id"],
    visitId: json["visit_id"],
    atmId: json["atm_id"],
    workerId: json["worker_id"],
    comment: json["comment"],
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "task_id": taskId,
    "visit_id": visitId,
    "atm_id": atmId,
    "worker_id": workerId,
    "comment": comment,
    "updatedAt": updatedAt?.toIso8601String(),
    "createdAt": createdAt?.toIso8601String(),
  };
}
