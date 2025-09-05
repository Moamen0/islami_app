import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/utils/app_color.dart';

class Screenone extends StatelessWidget {
  const Screenone({super.key});

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
