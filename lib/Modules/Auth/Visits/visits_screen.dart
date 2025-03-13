import 'package:animate_do/animate_do.dart';
import 'package:atm/Modules/Auth/Visits/visits_controller.dart';
import 'package:atm/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../Utilities/LayoutHelper/condition_widget.dart';
import '../../../Utilities/constants.dart';
import '../../../Utilities/strings.dart';
import '../../../Utilities/theme_helper.dart';
import '../../../Widgets/empty_content_widget.dart';
import '../../ATM/atm_screen.dart';

class VisitsScreen extends StatefulWidget {
  static const routeName = "VisitsScreen";

  const VisitsScreen({Key? key}) : super(key: key);

  @override
  State createState() => _VisitsScreenState();
}

class _VisitsScreenState extends StateMVC<VisitsScreen> {
  _VisitsScreenState() : super(VisitsController()) {
    con = VisitsController();
  }

  late VisitsController con;

  @override
  void initState() {
    con.getVisits();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        // backgroundColor: ThemeClass.of(context).background,
        backgroundColor: Colors.white,
        title: Text(
         "الزيارات",
          style: TextStyle(color: Colors.black),
          // style: TextStyle(color: ThemeClass.of(context).textColorMain),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: ConditionWidget(
            conditionWidget: const Column(
              children: [
                Spacer(),
                Center(child: CircularProgressIndicator()),
                Spacer(),
              ],
            ),
            condition: con.loading,
            child: ConditionWidget(
              condition: con.visits.isEmpty && !con.loading,
              conditionWidget: Column(
                children: [
                  const Spacer(),
                  Center(
                      child: EmptyContentWidget(
                    msg: "لا يوجد نتائج",
                  )),
                  const Spacer(),
                ],
              ),
              child: FadeInUp(
                delay: const Duration(microseconds: 500),
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 10.h),
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    physics: const BouncingScrollPhysics(),
                    // itemCount: 10,
                    itemCount: con.visits.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          context
                              .pushNamed(AtmScreen.routeName, queryParameters: {
                            "id": con.visits[index].id.toString(),
                            "visit":con.visits[index].visit.toString(),
                            "year":con.visits[index].date?.year.toString(),
                            "month":con.visits[index].date?.month.toString(),
                            "code":con.visits[index].code.toString(),
                          }).then((value) {
                            con.visits.clear();
                            con.getVisits();
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.2),
                              borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(con.visits[index].visit ?? '',
                                  style: TextStyle(
                                    color: Colors.black,

                                  ),
                                  ),
                                  space25Horizontal,
                                  Text(
                                    con.visits[index].code ?? '',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const Spacer(),
                                  const Icon(Icons.arrow_forward_ios_rounded,
                                      color: Colors.black,
                                      )
                                ],
                              ),
                              space10Vertical,
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24.w),
                                child: Text(con.visits[index].progress ?? '', style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            )),
      ),
      // )
    );
  }
}
