import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_color.dart';

class Screenfive extends StatelessWidget {
  const Screenfive({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height * 0.06,
          ),
          Image.asset(
            "assets/images/toplogo.png",
            height: height * 0.19,
            width: width * 0.99,
          ),
          SizedBox(
            height: height * 0.41,
            width: width * 0.99,
            child: Image.asset(
              "assets/images/welcome5.png",
              color: AppColor.primaryColor,
            ),
          ),
          Text(
            "Holy Quran Radio",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Text(
            textAlign: TextAlign.center,
            "You can listen to the Holy Quran Radio through the application for free and easily",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor),
          )
        ],
      ),
    );
  }
}
