import '../API/request_method.dart';
import '../error/exceptions.dart';
import '../network/error_message_model.dart';

abstract interface class ModelValidation{
  String? validate();
}

class GenericRequest<T> {
  T Function(Map<String, dynamic> json) fromMap;
  RequestApi method;

  GenericRequest({required this.fromMap, required this.method});

  ServerException errorModel(dynamic response,String statusMessage,ExpectType expectType)=> ServerException(
    errorMessageModel: ErrorMessageModel.parsing(
      modelName: T.toString(),
      expectType: expectType,
      requestApi: method,
      responseApi: response,
      statusMessage: statusMessage,
    )
  );

  Future<T> getObject() async {
    Map<String, dynamic> response;
    if (method.body.isNotEmpty) {
      response = await method.request();
    } else {
      response = await method.requestJson();
    }
    if (response["data"] is! Map) {
      throw errorModel(response,"data is not compatible with expected data",ExpectType.object);
    }
    try{
      T result = fromMap(response["data"]);
      if(T is ModelValidation){
        String? validateError = (result as ModelValidation).validate();
        if(validateError!=null) throw errorModel(response,validateError,ExpectType.object);
      }
      return result;
    }catch(e){
      throw errorModel(response,e.toString(),ExpectType.object);
    }
  }

  Future<List<T>> getList() async {
    Map<String, dynamic> response;
    if (method.body.isNotEmpty) {
      response = await method.request();
    } else {
      response = await method.requestJson();
    }
    if (!(response["data"] is List || response["data"]["data"] is List)) throw errorModel(response,"data is not compatible with expected data",ExpectType.list);
    final responseList = (response["data"] is List)? response["data"] : response["data"]["data"];
    try{
      List<T> resultList =  List<T>.from(responseList.map((e) => fromMap(e)));
      if(T is ModelValidation){
        for (var item in resultList) {
          String? validateError = (item as ModelValidation).validate();
          if(validateError!=null) throw errorModel(response,validateError,ExpectType.list);
        }
      }
      return resultList;
    }catch(e){
      throw errorModel(response,e.toString(),ExpectType.object);
    }
  }

  Future<T> getResponse() async {
    Map<String, dynamic> response;
    if (method.body.isNotEmpty) {
      response = await method.request();
    } else {
      response = await method.requestJson();
    }

    try{
      T result = fromMap(response);
      if(T is ModelValidation){
        String? validateError = (result as ModelValidation).validate();
        if(validateError!=null) throw errorModel(response,validateError,ExpectType.other);
      }
      return result;
    }catch(e){
      throw errorModel(response,e.toString(),ExpectType.other);
    }
  }
}
