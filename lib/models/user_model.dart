

class UserModel {
  final int? id;
  final String? otpCode;
  final String? name;
  final String? email;
  final String? phone;
  final String? image;
  final String? token;
  final String? password;
  final String? gender;
  final int? governorate;
  final int? points;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;

  UserModel({
    this.id,
    this.otpCode,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.token,
    this.password,
    this.gender,
    this.governorate,
    this.points,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    otpCode: json["otp_code"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    image: json["image"],
    token: json["token"],
    password: json["password"],
    gender: json["gender"].toString(),
    governorate: json["governorate"],
    points: json["points"],
    status: json["status"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "otp_code": otpCode,
    "name": name,
    "email": email,
    "phone": phone,
    "image": image,
    "token": token,
    "password": password,
    "gender": gender,
    "governorate": governorate,
    "points": points,
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "deletedAt": deletedAt,
  };
}
