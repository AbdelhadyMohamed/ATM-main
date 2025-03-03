import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Utilities/helper.dart';
import '../../../Utilities/theme_helper.dart';
import '../../../models/home_model.dart';
import '../Utilities/text_style_helper.dart';


class HomeCardWidget extends StatelessWidget {
  final HomeModel model;

  const HomeCardWidget({Key? key,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Padding(
          padding:
          EdgeInsets.symmetric(vertical: 8.h, horizontal:  16.w),
          child: Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
              borderRadius: BorderRadius.circular(10.w),
              color: ThemeClass.of(context).background,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 347.w,
                  height: 150.h,
                  padding: EdgeInsets.all(7.w),
                  decoration: BoxDecoration(
                    color: ThemeClass.of(context).medGrey.withOpacity(.5),
                    borderRadius: BorderRadius.circular(6.w),
                    image: DecorationImage(
                      // alignment: Alignment.topCenter,
                      image: CachedNetworkImageProvider(
                        model.uploads.isNotEmpty?model.uploads[0].variations.isNotEmpty?     model.uploads[0].variations[1].pathUrl?? Helper.imagePlaceHolder:Helper.imagePlaceHolder:Helper.imagePlaceHolder,
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  // alignment: Alignment.topCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: ThemeClass.of(context).textColorMain.withOpacity(0.4),
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(
                              vertical: 4.h, horizontal: 8.w),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                           const Icon(Icons.access_time_filled_sharp,color: Colors.white,),
                              SizedBox(width: 6.w,),
                              if(model.createdAt!= null)  Text(
                                '${model.createdAt}'.toDateDDMMYYYY(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  model.summary??'',
                  style: TextStyleHelper.of(context).body14.copyWith(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 7.h,
                ),
                SizedBox(
                  child: Text(
                    model.description??'',
                    maxLines: 2,
                    style: TextStyleHelper.of(context).body12.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
              ],
            ),
          ),
        ),

    );
  }
}
