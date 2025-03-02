import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//errors
const serverError = 'Server error';
const unauthorized = 'Unauthorized';
const somethingWentWrong = 'Something went wrong , try again!';
const noDataFound = 'No Data Found !!';

var cardShadow = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 2,
    blurRadius: 7,
    offset: const Offset(0, 5), // changes position of shadow
  ),
];

const List<String> months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];


const kMale = 'Male';
const kFemale = 'Female';
const kUnknownGender = 'Prefer not to say';
const token = 'token';
const fcmToken = 'fcmToken';
const UUID_FLAG = 'uuid';
const flagUserId = 'flagUserId';
const userName = 'useName';
const FLAG_USER_RECORD = 'userRecord';
const countryId = 'countryId';
const FLAG_SPORT_ID = 'sportId';
const FLAG_CREATED_BY_ID = 'createdById';
const userImageUrl = 'userImageUrl';
const kReSchedule = 're-schedule';
const kSessionId = 'session_id';
const kLocalName = 'language';
const groupLocationsSuggestions = 'groupLocationsSuggestions';

// sweden - emirates - egypt
const List<Map<String, String>> codes = [
  {
    "name": "Sverige",
    "code": "SE",
    "dial_code": "+46",
  },
  {
    "name": "دولة الإمارات العربية المتحدة",
    "code": "AE",
    "dial_code": "+971",
  },
  {
    "name": "مصر‎",
    "code": "EG",
    "dial_code": "+20",
  },
];

String emptyImage =
    "https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg";
final space3Vertical = SizedBox(
  height: 3.h,
);

final space4Vertical = SizedBox(
  height: 4.h,
);

final space5Vertical = SizedBox(
  height: 5.h,
);

final space8Vertical = SizedBox(
  height: 8.h,
);

final space10Vertical = SizedBox(
  height: 10.h,
);
final space12Vertical = SizedBox(
  height: 12.h,
);

final space15Vertical = SizedBox(
  height: 15.h,
);
final space16Vertical = SizedBox(
  height: 16.h,
);
final space18Vertical = SizedBox(
  height: 18.h,
);

final space20Vertical = SizedBox(
  height: 20.h,
);
final space25Vertical = SizedBox(
  height: 25.h,
);

final space30Vertical = SizedBox(
  height: 30.h,
);final space32Vertical = SizedBox(
  height: 32.h,
);final space24Vertical = SizedBox(
  height: 24.h,
);
final space35Vertical = SizedBox(
  height: 35.h,
);

final space40Vertical = SizedBox(
  height: 40.h,
);final space44Vertical = SizedBox(
  height: 44.h,
);

final space50Vertical = SizedBox(
  height: 50.h,
);

final space60Vertical = SizedBox(
  height: 60.h,
);
final space65Vertical = SizedBox(
  height: 65.h,
);

final space70Vertical = SizedBox(
  height: 70.h,
);

final space80Vertical = SizedBox(
  height: 80.h,
);

final space90Vertical = SizedBox(
  height: 90.h,
);

final space100Vertical = SizedBox(
  height: 100.h,
);
final space130Vertical = SizedBox(
  height: 130.h,
);

final space3Horizontal = SizedBox(
  width: 3.w,
);

final space4Horizontal = SizedBox(
  width: 4.w,
);

final space5Horizontal = SizedBox(
  width: 5.w,
);
final space8Horizontal = SizedBox(
  width: 8.w,
);

final space10Horizontal = SizedBox(
  width: 10.w,
);
final space12Horizontal = SizedBox(
  width: 12.w,
);
final space15Horizontal = SizedBox(
  width: 15.w,
);
final space16Horizontal = SizedBox(
  width: 16.w,
);

final space6Horizontal = SizedBox(
  width: 6.w,
);

final space6Vertical = SizedBox(
  height: 6.h,
);

final space20Horizontal = SizedBox(
  width: 20.w,
);
final space25Horizontal = SizedBox(
  width: 25.w,
);
final space24Horizontal = SizedBox(
  width: 24.w,
);

final space30Horizontal = SizedBox(
  width: 30.w,
);
final space35Horizontal = SizedBox(
  width: 35.w,
);

final space40Horizontal = SizedBox(
  width: 40.w,
);

final space50Horizontal = SizedBox(
  width: 50.w,
);

final space60Horizontal = SizedBox(
  width: 60.w,
);

final space70Horizontal = SizedBox(
  width: 70.w,
);

final space80Horizontal = SizedBox(
  width: 80.w,
);

final space90Horizontal = SizedBox(
  width: 90.w,
);

final space100Horizontal = SizedBox(
  width: 100.w,
);
