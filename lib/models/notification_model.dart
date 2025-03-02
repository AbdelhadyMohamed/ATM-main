
class NotificationModel {
  final int? id;
  final String? uuid;
  final NotificationModelNotification? notification;
  final DateTime? createdAt;

  NotificationModel({
    this.id,
    this.uuid,
    this.notification,
    this.createdAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    id: json["id"],
    uuid: json["uuid"],
    notification: json["notification"] == null ? null : NotificationModelNotification.fromJson(json["notification"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uuid": uuid,
    "notification": notification?.toJson(),
    "created_at": createdAt?.toIso8601String(),
  };
}

class NotificationModelNotification {
  final String? version;
  final NotificationNotification? notification;
  final List<dynamic>? data;
  final Audience? audience;

  NotificationModelNotification({
    this.version,
    this.notification,
    this.data,
    this.audience,
  });

  factory NotificationModelNotification.fromJson(Map<String, dynamic> json) => NotificationModelNotification(
    version: json["version"],
    notification: json["notification"] == null ? null : NotificationNotification.fromJson(json["notification"]),
    data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
    audience: json["audience"] == null ? null : Audience.fromJson(json["audience"]),
  );

  Map<String, dynamic> toJson() => {
    "version": version,
    "notification": notification?.toJson(),
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
    "audience": audience?.toJson(),
  };
}

class Audience {
  final String? type;
  final String? value;

  Audience({
    this.type,
    this.value,
  });

  factory Audience.fromJson(Map<String, dynamic> json) => Audience(
    type: json["type"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "value": value,
  };
}

class NotificationNotification {
  final String? title;
  final String? body;

  NotificationNotification({
    this.title,
    this.body,
  });

  factory NotificationNotification.fromJson(Map<String, dynamic> json) => NotificationNotification(
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "body": body,
  };
}
