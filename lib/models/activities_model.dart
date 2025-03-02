class ActivityModel {
  final int? id;
  final String? hash;
  final String? activity;
  final int? earnings;
  final Advertisement? advertisement;
  final String? createdAt;

  ActivityModel({
    this.id,
    this.hash,
    this.activity,
    this.earnings,
    this.advertisement,
    this.createdAt,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
    id: json["id"],
    hash: json["hash"],
    activity: json["activity"],
    earnings: json["earnings"],
    advertisement: json["advertisement"] == null ? null : Advertisement.fromJson(json["advertisement"]),
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "hash": hash,
    "activity": activity,
    "earnings": earnings,
    "advertisement": advertisement?.toJson(),
    "created_at": createdAt,
  };
}

class Advertisement {
  final int? id;
  final String? summary;
  final String? description;
  final String? altDescription;
  final Metainfo? metainfo;
  final LabelInfo? labelInfo;
  final String? budget;
  final String? remainingBudget;
  final String? previewUrl;
  final DateTime? createdAt;

  Advertisement({
    this.id,
    this.summary,
    this.description,
    this.altDescription,
    this.metainfo,
    this.labelInfo,
    this.budget,
    this.remainingBudget,
    this.previewUrl,
    this.createdAt,
  });

  factory Advertisement.fromJson(Map<String, dynamic> json) => Advertisement(
    id: json["id"],
    summary: json["summary"],
    description: json["description"],
    altDescription: json["alt_description"],
    metainfo: json["metainfo"] == null ? null : Metainfo.fromJson(json["metainfo"]),
    labelInfo: json["label_info"] == null ? null : LabelInfo.fromJson(json["label_info"]),
    budget: json["budget"],
    remainingBudget: json["remaining_budget"],
    previewUrl: json["preview_url"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "summary": summary,
    "description": description,
    "alt_description": altDescription,
    "metainfo": metainfo?.toJson(),
    "label_info": labelInfo?.toJson(),
    "budget": budget,
    "remaining_budget": remainingBudget,
    "preview_url": previewUrl,
    "created_at": createdAt?.toIso8601String(),
  };
}

class LabelInfo {
  final String? label;

  LabelInfo({
    this.label,
  });

  factory LabelInfo.fromJson(Map<String, dynamic> json) => LabelInfo(
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "label": label,
  };
}

class Metainfo {
  final String? version;
  final String? campaignType;
  final String? headline;
  final String? url;

  Metainfo({
    this.version,
    this.campaignType,
    this.headline,
    this.url,
  });

  factory Metainfo.fromJson(Map<String, dynamic> json) => Metainfo(
    version: json["version"],
    campaignType: json["campaign_type"],
    headline: json["headline"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "version": version,
    "campaign_type": campaignType,
    "headline": headline,
    "url": url,
  };
}
