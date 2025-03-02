
class ServerModel{
  final bool serverIsSecured;
  final String host;
  final int? port;
  final String? apiPrefix;

  ServerModel({required this.serverIsSecured, this.port, required this.host, required this.apiPrefix});

  factory ServerModel.fromJson(Map<String, dynamic> json) => ServerModel(
    serverIsSecured: json["serverIsSecured"],
    host: json["host"],
    port: json["port"],
    apiPrefix: json["apiPrefix"],
  );

  Map<String, dynamic> toJson() => {
    "serverIsSecured": serverIsSecured,
    "host": host,
    "port": port,
    "apiPrefix": apiPrefix,
  };


  String get baseServer => "http${serverIsSecured ? "s" : ""}://$host";
  // String get baseUrl => "$baseServer/${(apiPrefix == null || apiPrefix!.isEmpty)?"":"$apiPrefix/"}api/v1/";
  String get baseUrl => Uri(
    scheme: "http${serverIsSecured ? "s" : ""}",
    host: host,
    port: port,
    path: (apiPrefix == null || apiPrefix!.isEmpty)?"":"$apiPrefix/",
  ).toString();
}