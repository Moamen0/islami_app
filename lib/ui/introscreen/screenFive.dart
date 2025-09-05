import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_color.dart';

class Screenfive extends StatelessWidget {
  const Screenfive({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 55,
          ),
          Image.asset(
            "assets/images/toplogo.png",
            height: 171,
            width: 291,
          ),
          Container(
            height: 415,
            width: 358,
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
            height: 25,
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
    ;
  }
}
