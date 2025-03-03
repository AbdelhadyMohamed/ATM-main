import 'package:dartz/dartz.dart';
import '../../../Utilities/api_end_point.dart';
import '../../../Utilities/shared_preferences.dart';
import '../../../core/API/generic_request.dart';
import '../../../core/API/request_method.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../../models/visit_model.dart';

class VisitsDataHandler {
  static Future<Either<Failure, List<VisitModel>>> getVisitsApi() async {
    try {
      List<VisitModel> response = await GenericRequest<VisitModel>(
        method: RequestApi.postJson(
          url: APIEndPoint.workerVisit,
          bodyJson: {"per_page": 100, "start": 0, "workerId": SharedPref.getCurrentUser()?.id},
        ),
        fromMap: VisitModel.fromJson,
      ).getList();
      return Right(response);
    } on ServerException catch (failure) {
      ServerFailure.handleError(failure.errorMessageModel);
      return Left(ServerFailure(failure.errorMessageModel));
    }
  }
}
