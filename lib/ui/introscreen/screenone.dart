import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/utils/app_color.dart';

class Screenone extends StatelessWidget {
  const Screenone({super.key});

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
            child: SvgPicture.asset(
              "assets/images/welcome1.svg",
            ),
          ),
          Text(
            "Welcome To Islmi App",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor),
          )
        ],
      ),
    );
  }
}
