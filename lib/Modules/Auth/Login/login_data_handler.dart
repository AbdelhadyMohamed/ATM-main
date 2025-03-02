
import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../models/user_model.dart';
import '../../../Utilities/api_end_point.dart';
import '../../../Utilities/shared_preferences.dart';
import '../../../core/API/generic_request.dart';
import '../../../core/API/request_method.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';

class LoginDataHandler {

  static Future<Either<Failure,UserModel>> login({required String phone,required String password})async{
    try {
      UserModel response = await GenericRequest<UserModel>(
        method: RequestApi.postJson(
            url: APIEndPoint.login,
          bodyJson: {"name": phone,"password": password}
        ),
        fromMap: (_)=> UserModel.fromJson(_["user"]),
      ).getResponse();
      return Right(response);
    } on ServerException catch (failure) {
      ServerFailure.handleError(failure.errorMessageModel);
      log(failure.errorMessageModel.modelName??'');
      return Left(ServerFailure(failure.errorMessageModel));
    }
  }

  // static Future<Either<Failure,bool>> onConfirmCodeApi({required String phone, required String otp})async{
  //   try {
  //     UserModel response = await GenericRequest<UserModel>(
  //       method: RequestApi.post(
  //         url: APIEndPoint.login,
  //         body: {"phone_number": phone, "password": otp}
  //       ),
  //       fromMap: (_)=> UserModel.fromJson(_['data']['customer'])..accessToken = (_['data']['access_token']).toString(),
  //     ).getResponse();
  //   SharedPref.saveCurrentUser(user: response);
  //     return const Right(true);
  //   } on ServerException catch (failure) {
  //     ServerFailure.handleError(failure.errorMessageModel);
  //     return Left(ServerFailure(failure.errorMessageModel));
  //   }
  // }

}