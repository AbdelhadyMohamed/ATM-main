import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hypelify/Utilities/constants.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../Utilities/LayoutHelper/condition_widget.dart';
import '../../../Utilities/strings.dart';
import '../../../Utilities/theme_helper.dart';
import '../../../Widgets/empty_content_widget.dart';
import '../AtmDetails/atm_details_screen.dart';
import 'atm_controller.dart';

class AtmScreen extends StatefulWidget {
  static const routeName = "AtmScreen";
  final String id;
  final String visit;
  final String year;
  final String month;
  final String code;

  const AtmScreen({Key? key, required this.id,required this.visit,required this.year,required this.month,required this.code}) : super(key: key);

  @override
  State createState() => _AtmScreenState();
}

class _AtmScreenState extends StateMVC<AtmScreen> {
  _AtmScreenState() : super(AtmController()) {
    con = AtmController();
  }

  late AtmController con;

  @override
  void initState() {
    con.filteredAtms.clear();
    con.getATM(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: ThemeClass.of(context).background,
        title: Text(
          Strings.atms.tr,
          style: TextStyle(color: ThemeClass.of(context).textColorMain),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    con.searchVisits(value);
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: Strings.searchAtms.tr,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Expanded(
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
                    condition: con.filteredAtms.isEmpty && !con.loading,
                    conditionWidget: Column(
                      children: [
                        const Spacer(),
                        Center(
                            child: EmptyContentWidget(
                          msg: Strings.noResultFound.tr,
                        )),
                        const Spacer(),
                      ],
                    ),
                    child: FadeInUp(
                      delay: const Duration(microseconds: 500),
                      child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          physics: const BouncingScrollPhysics(),
                          // itemCount: 10,
                          itemCount: con.filteredAtms.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => context.pushNamed(AtmDetailsScreen.routeName,extra: con.filteredAtms[index],queryParameters: {
                                "visitId": widget.id,
                                "visit": widget.visit,
                                "year": widget.year,
                                "month":widget.month,
                                "code":widget.code
                              }).then((value) {
                                con.atms.clear();
                                con.filteredAtms.clear();
                                con.getATM(id: widget.id);
                              }),
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 8.h),
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(.2),
                                    borderRadius: BorderRadius.circular(8)),
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          con.filteredAtms[index].code ?? '',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        space25Horizontal,

                                        Expanded(
                                          flex: 6,
                                          child: Text(con.filteredAtms[index].nickname ?? '',  style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700),),
                                        ),

                                        const Spacer(),
                                        const Icon(Icons.arrow_forward_ios_rounded)
                                      ],
                                    ),
                                    space10Vertical,
                                    Row(
                                      children: [
                                        Text(con.filteredAtms[index].address ?? ''),
                                        const Spacer(),

                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  )),
            ),
          ],
        ),
      ),
      // )
    );
  }
}
