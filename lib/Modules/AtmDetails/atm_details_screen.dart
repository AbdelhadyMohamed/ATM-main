import 'package:flutter/material.dart';
import 'package:hypelify/Modules/AtmDetails/atm_details_controller.dart';
import 'package:hypelify/Utilities/LayoutHelper/loading_screen.dart';
import 'package:hypelify/models/atm_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../Utilities/theme_helper.dart';

class AtmDetailsScreen extends StatefulWidget {
  static const String routeName = "AtmDetailsScreen";
  final AtmModel atm;
  final String visitId;
  final String visit;
  final String year;
  final String month;
  final String code;

  const AtmDetailsScreen({Key? key, required this.atm,required this.visitId,required this.visit,required this.year,required this.month,required this.code}) : super(key: key);

  @override
  State createState() => _AtmDetailsScreenState();
}

class _AtmDetailsScreenState extends StateMVC<AtmDetailsScreen> {
  _AtmDetailsScreenState() : super(AtmDetailsController()) {
    con = AtmDetailsController();
  }

  late AtmDetailsController con;
  @override
  void initState() {
    con.atm=widget.atm;
    con.visitId=widget.visitId;
    con.year=widget.year;
    con.month=widget.month;
    con.visit=widget.visit;
    con.images = List.filled(10, null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeClass.of(context).background,
        centerTitle: true,
        title: Text(
          "Visit Code: ${widget.code}",
          style: TextStyle(color: ThemeClass.of(context).textColorMain),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: LoadingScreen(
        loading: con.loading,
        child: Padding(
          padding: EdgeInsets.all(25.w.h),
          child: ListView(
            children: [
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text(" :اسم الماكينه",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp)),
                  Text(widget.atm.atm ?? "",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp)),
                ],
              ),
              Row(
                textDirection: TextDirection.rtl,

                children: [
                  Text(" :عنوان الماكينه",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp)),
                ],
              ),
              Text(widget.atm.address ?? "",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp),
                  maxLines: 2),
              Row(                textDirection: TextDirection.rtl,

                children: [
                  Text(" :البنك",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp)),
                  Text(widget.atm.bank ?? "",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp)),
                ],
              ),
              Row(                textDirection: TextDirection.rtl,

                children: [
                  Text(" :المحافظه",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp)),
                  Text(widget.atm.governorate ?? "",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.sp)),
                ],
              ),
              Row(                textDirection: TextDirection.rtl,

                children: [
                  Text(" :المجموعه",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp)),
                  Text(widget.atm.nickname ?? "",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp)),
                ],
              ),
              Row(                textDirection: TextDirection.rtl,

                children: [
                  Text(" :كود",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp)),
                  Text(widget.atm.code ?? "",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.sp)),
                ],
              ),
              Text("الصور: ",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp)),
              Column(
                children: [
                  for (int i = 0; i < con.labels.length; i += 2)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildCard(i),
                        if (i + 1 < con.labels.length) buildCard(i + 1),
                      ],
                    ),
                ],
              ),
              SizedBox(height: 5.h),
              Center(child: ElevatedButton(onPressed:con.submit, child: const Text("تأكيد",style: TextStyle(fontSize: 20),)))
            
            ],
          ),
        ),
      ),
    );
  }
  Widget buildCard(int index) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 - 40, // Ensure two per row
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            con.images[index] != null
                ? GestureDetector(
              onTap: () => con.openFile(con.images[index]!.path),
              child: Image.file(con.images[index]!, width: 100, height: 100, fit: BoxFit.cover),
            )
                : Icon(Icons.image, size: 80.r, color: Colors.grey),
            Text(con.labels[index], textAlign: TextAlign.center, style: TextStyle(fontSize: 14.sp)),
            SizedBox(height: 4.h),
            ElevatedButton(
              onPressed: () => con.pickImage(index),
              child: const Text("اختر صورة"),
            ),
          ],
        ),
      ),
    );
  }
}
