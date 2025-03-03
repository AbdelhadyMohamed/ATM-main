import 'package:dartz/dartz.dart';
import 'package:atm/Utilities/shared_preferences.dart';
import 'package:atm/models/atm_model.dart';

import '../../../Utilities/api_end_point.dart';
import '../../../core/API/generic_request.dart';
import '../../../core/API/request_method.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../../models/visit_model.dart';

class AtmDataHandler {
  static Future<Either<Failure, List<AtmModel>>> getAtmApi({required String id}) async {
    try {
      List<AtmModel> response = await GenericRequest<AtmModel>(
        method: RequestApi.postJson(
          url: APIEndPoint.atmVisit,
          bodyJson: {"visitId": id},
        ),
        fromMap: AtmModel.fromJson,
      ).getList();
      return Right(response);
    } on ServerException catch (failure) {
      ServerFailure.handleError(failure.errorMessageModel);
      return Left(ServerFailure(failure.errorMessageModel));
    }
  }
}
