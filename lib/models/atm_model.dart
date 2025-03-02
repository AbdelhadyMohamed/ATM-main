
class AtmModel {
  final int? atmId;
  final String? atm;
  final String? nickname;
  final String? address;
  final String? code;
  final String? atmNote;
  final String? bank;
  final String? bankNote;
  final String? governorate;
  final String? groupName;
  final int? taskId;

  AtmModel({
    this.atmId,
    this.atm,
    this.nickname,
    this.address,
    this.code,
    this.atmNote,
    this.bank,
    this.bankNote,
    this.governorate,
    this.groupName,
    this.taskId,
  });

  factory AtmModel.fromJson(Map<String, dynamic> json) => AtmModel(
    atmId: json["atm_id"],
    atm: json["atm"],
    nickname: json["nickname"],
    address: json["address"],
    code: json["code"],
    atmNote: json["atm_note"],
    bank: json["bank"],
    bankNote: json["bank_note"],
    governorate: json["governorate"],
    groupName: json["group_name"],
    taskId: json["task_id"],
  );

  Map<String, dynamic> toJson() => {
    "atm_id": atmId,
    "atm": atm,
    "nickname": nickname,
    "address": address,
    "code": code,
    "atm_note": atmNote,
    "bank": bank,
    "bank_note": bankNote,
    "governorate": governorate,
    "group_name": groupName,
    "task_id": taskId,
  };
}
