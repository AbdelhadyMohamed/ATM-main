
class HomeModel {
  final int? id;
  final String? summary;
  final String? description;
  final String? altDescription;
  final Metainfo? metainfo;
  final LabelInfo? labelInfo;
  final String? budget;
  final String? remainingBudget;
  final String? previewUrl;
  final List<Upload> uploads;
  final Advertiser? advertiser;
  final DateTime? createdAt;

  HomeModel({
    this.id,
    this.summary,
    this.description,
    this.altDescription,
    this.metainfo,
    this.labelInfo,
    this.budget,
    this.remainingBudget,
    this.previewUrl,
    this.uploads = const [],
    this.advertiser,
    this.createdAt,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    id: json["id"],
    summary: json["summary"],
    description: json["description"],
    altDescription: json["alt_description"],
    metainfo: json["metainfo"] == null ? null : Metainfo.fromJson(json["metainfo"]),
    labelInfo: json["label_info"] == null ? null : LabelInfo.fromJson(json["label_info"]),
    budget: json["budget"],
    remainingBudget: json["remaining_budget"],
    previewUrl: json["preview_url"],
    uploads: json["uploads"] == null ? [] : List<Upload>.from(json["uploads"]!.map((x) => Upload.fromJson(x))),
    advertiser: json["advertiser"] == null ? null : Advertiser.fromJson(json["advertiser"]),
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
    "uploads": List<dynamic>.from(uploads.map((x) => x.toJson())),
    "advertiser": advertiser?.toJson(),
    "created_at": createdAt?.toIso8601String(),
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
  final String? photo;
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

class Upload {
  final int? id;
  final String? path;
  final String? mimeType;
  final String? pathUrl;
  final List<Variation> variations;

  Upload({
    this.id,
    this.path,
    this.mimeType,
    this.pathUrl,
    this.variations = const [],
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
    "variations": List<dynamic>.from(variations.map((x) => x.toJson())),
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
