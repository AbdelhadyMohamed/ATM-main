import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import '../../Utilities/router_config.dart';
import '../../Utilities/toast_helper.dart';
import '../../models/atm_model.dart';
import 'atm_details_data_handler.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';

BuildContext? get currentContext_ =>
    GoRouterConfig.router.routerDelegate.navigatorKey.currentContext;
class AtmDetailsController extends ControllerMVC {
  late AtmModel atm;
  late String visitId;
  String id="";
  late String visit;
  late String year;
  late String month;
  late TextEditingController textEditingController;

  // singleton
  factory AtmDetailsController() {
    _this ??= AtmDetailsController._();
    return _this!;
  }

  static AtmDetailsController? _this;
  List<File?> images = List.filled(10, null);
  AtmDetailsController._();
  final List<String> labels = [
    "صوره من الأمام",
    "صوره من اليمين",
    "صوره من اليسار",
    "صوره من الخلف",
    "صوره 1 قبل النظافه",
    "صوره 1 بعد النظافه",
    "صوره 2 قبل النظافه",
    "صوره 2 بعد النظافه",
    "صوره صندوق الأتصال",
    "صورة مصدر الكهرباء",
  ];

  bool loading = false;
  final List<File?> nonNullImages=[];

  startVisit() async {
    final result=await AtmDetailsDataHandler.startVisit(
        comment: textEditingController.text,
        taskId: atm.taskId.toString(), visitId: visitId,atmId: atm.atmId.toString());
    result.fold((l) {return false;}, (r) => id=r);
    return true;
  }
   uploadImages() async {
    final visitStarted =await startVisit();
    // Future.delayed(Duration(microseconds: 500));
    if (visitStarted == null || !visitStarted) {
      ToastHelper.showError(message: "فشل بدء الزيارة، لن يتم تحميل الصور.");
      return false;
    }
    final res1=await AtmDetailsDataHandler.uploadImages1(
        year: year,
        month: month,
        government: atm.governorate.toString(),
        visit: visit.toString(),
        atmName: atm.atm??"",
        atmId: id,
        images: nonNullImages.take(5).toList()
    );
    res1.fold((l) {
      ToastHelper.showError(message: "حدث مشكله اثناء رفع الصور برجاء رفع الصور يدويا");
    return false;
    },
       (r) {});
      final res2=await AtmDetailsDataHandler.uploadImages2(
          year: year,
          month: month,
          government: atm.governorate.toString(),
          visit: visit.toString(),
          atmName: atm.atm??"",
          atmId: id,
        images: nonNullImages.getRange(5, 10).toList(),
    );
    res2.fold((l) {
      ToastHelper.showError(message: "حدث مشكله اثناء رفع الصور برجاء رفع الصور يدويا");
      return false;
    },
            (r) {});
    return true;
  }
  submit()async{
    nonNullImages.clear();
   for(var image in images){
     if(image!=null)nonNullImages.add(image);
   }
    if(nonNullImages.length!=10){
      ToastHelper.showError(message: "برجاء رفع 10 صور");
      return;
    }
    setState(() {loading=true;});
    final result=await uploadImages();
   if(result){
      ToastHelper.showSuccess(message: "تم تأكيد الصور");
      if (currentContext_!.mounted) currentContext_!.pop();
    }
    setState(() {loading=false;});
  }
  pickImage(int index) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera,
      imageQuality: 25,
    );
    var bytes = (await pickedFile?.readAsBytes())?.lengthInBytes;
    log("kb : ${bytes!/1024}");
    // final result=compressImage(pickedFile?.path);
     // bytes = (await result.readAsBytes())?.lengthInBytes;
    log("kb : ${bytes/1024}");

    if (pickedFile != null) {
      setState(() {
        images[index] = File(pickedFile.path);
      });
    }
  }
  openFile(String filePath) async {
    await OpenFile.open(filePath);
    setState(() {});
  }

  Future<XFile?> compressImage(String? file) async {
    final dir = await getTemporaryDirectory();
    final targetPath = '${dir.path}/compressed.jpg';

    var result = await FlutterImageCompress.compressAndGetFile(
      file??"",
      targetPath,
      quality: 25,  // Adjust quality (0-100)
    );

    return result;
  }
}

