import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_style.dart';

class SuraContent extends StatelessWidget {
  final String content;
  final int index;

  SuraContent({super.key, required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.symmetric(horizontal: width * 0.08),
        padding: EdgeInsets.symmetric(vertical: height * 0.02),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColor.primaryColor)),
        child: Text(
          '${content}[${index + 1}]',
          style: AppStyle.bold20Primary,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        ));
  }
}
