import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hypelify/Utilities/text_style_helper.dart';


class TitleTextWidget extends StatelessWidget {
  final String title;
  const TitleTextWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   FadeInLeft(
        delay: const Duration(milliseconds: 500),
        child:   Row(
      children: [
        Text(
         title,
          style: TextStyleHelper.of(context).body16,
        ),
        const Spacer()
      ],
    ));
  }
}
