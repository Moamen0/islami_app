import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/utils/app_color.dart';

class Screentwo extends StatelessWidget {
  const Screentwo({super.key});

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
              "assets/images/welcome2.png",
              color: AppColor.primaryColor,
            ),
          ),
          Text(
            "Welcome To Islmi App",
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
            "We Are Very Excited To Have You In Our Community",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor),
          )
        ],
      ),
    );
  }
}
