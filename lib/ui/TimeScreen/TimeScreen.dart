import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_image.dart';
import 'package:islami_app/utils/app_style.dart';

class buildTimeScreen extends StatefulWidget {
  const buildTimeScreen({super.key});

  @override
  State<buildTimeScreen> createState() => _TimeTabState();
}

class _TimeTabState extends State<buildTimeScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.32);
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          spacing: height * .02,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * .32,
              width: width * .99,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(
                  image: AssetImage(AppImage.timePrayTime),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text('Azkar', style: AppStyle.bold16White),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColor.blackColor,
                      borderRadius: BorderRadius.circular(20),
                      border:
                          Border.all(color: AppColor.primaryColor, width: 2)),
                  child: Column(
                    children: [
                      Image.asset(AppImage.mrnAzkar),
                      Text(
                        "Morning Azkar",
                        style: AppStyle.bold20White,
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColor.primaryColor, width: 2),
                    color: AppColor.blackColor,
                  ),
                  child: Column(
                    children: [
                      Image.asset(AppImage.evnAzkar),
                      Text(
                        "Evening Azkar",
                        style: AppStyle.bold20White,
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
