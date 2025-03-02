
class VisitModel {
  final int? id;
  final int? taskId;
  final String? visit;
  final String? progress;
  final DateTime? date;
  final String? code;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;

  VisitModel({
    this.id,
    this.taskId,
    this.visit,
    this.progress,
    this.date,
    this.code,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory VisitModel.fromJson(Map<String, dynamic> json) => VisitModel(
    id: json["id"],
    taskId: json["task_id"],
    visit: json["visit"],
    progress: json["progress"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    code: json["code"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "task_id": taskId,
    "visit": visit,
    "progress": progress,
    "date": date?.toIso8601String(),
    "code": code,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "deletedAt": deletedAt,
  };
}
