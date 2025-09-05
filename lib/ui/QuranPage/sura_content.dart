import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_style.dart';

class SuraContent extends StatefulWidget {
  final String content;
  final int index;

  const SuraContent({super.key, required this.content, required this.index});

  @override
  State<SuraContent> createState() => _SuraContentState();
}

class _SuraContentState extends State<SuraContent> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: width * 0.08),
        padding: EdgeInsets.symmetric(vertical: height * 0.02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColor.primaryColor),
          color: isSelected ? AppColor.primaryColor : Colors.transparent,
        ),
        child: Text(
          '${widget.content}[${widget.index + 1}]',
          style: AppStyle.bold20Primary.copyWith(
            color: isSelected ? Colors.black : AppColor.primaryColor,
          ),
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
