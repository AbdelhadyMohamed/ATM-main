import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import '../../../Utilities/api_end_point.dart';
import '../../../core/API/generic_request.dart';
import '../../../core/API/request_method.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../Utilities/shared_preferences.dart';
import '../../models/start_visit_model.dart';

class AtmDetailsDataHandler {
  static Future<Either<Failure, bool>> uploadImages1({
    required String year,
    required String month,
    required String visit,
    required String atmId,
    required String atmName,
    required String government,
    required List<File?> images,
  }) async {
    try {
      List<http.MultipartFile> files = [
      for (int i = 0; i < images.length; i++)await http.MultipartFile.fromPath('images', images[i]!.path),
    ];
      bool response = await GenericRequest<bool>(
        method: RequestApi.post(
          files: files,
          url: APIEndPoint.uploadBeforeImage,
          body: {
            "year": year.toString(),
            "month": month.toString(),
            "governoment":government,
            // SharedPref.getCurrentUser()?.governorate.toString() ?? "",
            "visit": visit.toString(),
            "atm": atmName.toString(),
            "id": atmId.toString(),
          },
        ),
        fromMap: (_) => _["apiStatus"],
      ).getResponse();
      return Right(response);
    } on ServerException catch (failure) {
      log("here");
      log(failure.errorMessageModel.toString());
      log("here");
      ServerFailure.handleError(failure.errorMessageModel);
      return Left(ServerFailure(failure.errorMessageModel));
    }
  }
  static Future<Either<Failure, bool>> uploadImages2({
    required String year,
    required String month,
    required String visit,
    required String atmId,
    required String atmName,
    required String government,
    required List<File?> images,
  }) async {
    try {
      List<http.MultipartFile> files = [
      for (int i = 0; i < images.length; i++)await http.MultipartFile.fromPath('images', images[i]!.path),
    ];
      bool response = await GenericRequest<bool>(
        method: RequestApi.post(
          files: files,
          url: APIEndPoint.uploadAfterImage,
          body: {
            "year": year.toString(),
            "month": month.toString(),
            "governoment": government,
            // SharedPref.getCurrentUser()?.governorate.toString() ?? "",
            "visit": visit.toString(),
            "atm": atmName.toString(),
            "id": atmId.toString(),
          },
        ),
        fromMap: (_) => _["apiStatus"],
      ).getResponse();
      return Right(response);
    } on ServerException catch (failure) {
      log("here");
      log(failure.errorMessageModel.toString());
      log("here");
      ServerFailure.handleError(failure.errorMessageModel);
      return Left(ServerFailure(failure.errorMessageModel));
    }
  }
  // static Future<Either<Failure,List<String>>> getImages(
  //     {required String taskId,required String visitId,required String atmId}
  //     )
  // async{
  //   try {
  //     final response = await GenericRequest<List<String>>(
  //       method: RequestApi.postJson(
  //         url: APIEndPoint.atmVisitPhotos,
  //         bodyJson: {"taskId":taskId,"visitId":visitId,"workerId":SharedPref.getCurrentUser()?.id,"atmId":atmId},
  //       ),
  //       fromMap: (_) => _["status"],
  //     ).getObject();
  //     return Right(response);
  //   } on ServerException catch (failure) {
  //     ServerFailure.handleError(failure.errorMessageModel);
  //     return Left(ServerFailure(failure.errorMessageModel));
  //   }
  // }
  static Future<Either<Failure, String>> startVisit({required String taskId,required String visitId,required String atmId,String? comment}) async {
    try {
      StartVisitModel response = await GenericRequest<StartVisitModel>(
        method: RequestApi.postJson(
          url: APIEndPoint.startVisit,
          bodyJson: {"task_id":taskId,"visit_id":visitId,"worker_id":SharedPref.getCurrentUser()?.id,"atm_id":atmId,"comment":comment??""},
        ),
        fromMap:StartVisitModel.fromJson,
      ).getResponse();

      log(response.data!.comment.toString());
      return Right(response.data?.id.toString()??"");
    } on ServerException catch (failure) {
      log(failure.errorMessageModel.statusMessage.toString());
      ServerFailure.handleError(failure.errorMessageModel);
      return Left(ServerFailure(failure.errorMessageModel));
    }
  }
}
