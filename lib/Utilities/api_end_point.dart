
import 'package:flutter/foundation.dart';
import '../models/server_model.dart';

class APIEndPoint{
  APIEndPoint._();

  static final ServerModel _baseUrl = ServerModel(serverIsSecured: true, host: "apiatm.7alan.app", apiPrefix: "");
  static final ServerModel _offline = ServerModel(serverIsSecured: false, host: "apiatm.7alan.app", apiPrefix: "");
  // static final ServerModel _baseUrl = ServerModel(serverIsSecured: true, host: "testapi.egytrades.com", apiPrefix: "");

  // static final ServerModel _apiServer = !kDebugMode ? _offline : _online;
  static final ServerModel _apiServer = !kDebugMode ? _baseUrl : _baseUrl;



  //=========================== api User ====================================
  static String get test => "${_apiServer.baseUrl}test";
  static String get login => "${_apiServer.baseUrl}/worker/login";
  static String get workerVisit => "${_apiServer.baseUrl}/worker_visit/get_all_visits_worker";
  static String get atmVisit => "${_apiServer.baseUrl}/worker_visit/get_one_visit_worker";
  static String get atmVisitPhotos => "${_apiServer.baseUrl}/worker_visit/getVisitForMobile";
  static String get uploadImages => "${_apiServer.baseUrl}/worker_visit/uploadImages";
  static String get uploadBeforeImage => "${_apiServer.baseUrl}/worker_visit/uploadBeforeImage";
  static String get uploadAfterImage => "${_apiServer.baseUrl}/worker_visit/uploadAfterImage";
  static String get startVisit => "${_apiServer.baseUrl}/worker_visit/create_for_mobile";
  static String get sendOtp => "${_apiServer.baseUrl}auth/send-otp";
  static String get signup => "${_apiServer.baseUrl}auth/signup";
  static String get reSendOtp => "${_apiServer.baseUrl}auth/send-otp";
  static String getHomeData(String pageIndex) => "${_apiServer.baseUrl}advertisements?page=$pageIndex";
  static String shareActivity(String id) => "${_apiServer.baseUrl}activities/$id/logs/unique-store";
  static String reelUrl(String pageIndex) => "${_apiServer.baseUrl}reels?page=$pageIndex";
  static String reelByIdUrl(String id) => "${_apiServer.baseUrl}reels/$id";
  static String viewLogUrl(String id) => "${_apiServer.baseUrl}reels/$id/view-log";
  static String likeReelUrl(String id) => "${_apiServer.baseUrl}reels/$id/like";
  static String commentReelUrl(String id) => "${_apiServer.baseUrl}reels/$id/comment";
  static String followReelUrl(String id) => "${_apiServer.baseUrl}reels/$id/follow";
  static String shareReelUrl(String id) => "${_apiServer.baseUrl}reels/$id/share";
  static String commentsReelUrl(String id) => "${_apiServer.baseUrl}reels/$id/comments";
  static String likesReelUrl(String id) => "${_apiServer.baseUrl}reels/$id/likes";
  static String followingReelUrl(String id) => "${_apiServer.baseUrl}reels/$id/following";
  static String get notifications => "${_apiServer.baseUrl}notifications";
  static String get activitiesUrl => "${_apiServer.baseUrl}activities/unique-store";


  static Uri uri({required String path, Map<String, dynamic>? queryParameters}) => Uri(
    scheme: _apiServer.serverIsSecured ? "https" : "http",
    host: _apiServer.host,
    port: _apiServer.port,
    path: path.replaceAll(_apiServer.baseServer, ""),
    queryParameters: queryParameters,
  );
}



