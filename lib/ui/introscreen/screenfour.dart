import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_color.dart';

class Screenfour extends StatelessWidget {
  const Screenfour({super.key});

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
              "assets/images/welcome4.png",
              color: AppColor.primaryColor,
            ),
          ),
          Text(
            "Bearish",
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
            "Praise the name of your Lord, the Most High",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor),
          )
        ],
      ),
    );
    ;
  }
}
