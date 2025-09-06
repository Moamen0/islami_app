import 'package:flutter/material.dart';
import 'package:islami_app/ui/homeScreen.dart';
import 'package:islami_app/ui/introscreen/introduction_screen.dart';
import 'package:islami_app/ui/QuranPage/sura_details.dart';
import 'package:islami_app/ui/QuranPage/suracontent1/suraContent/suradetails1.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_routes.dart';

void main() {
  runApp(const Islami());
}

class Islami extends StatelessWidget {
  const Islami({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Tajawal",
        scaffoldBackgroundColor: AppColor.blackColor,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.introRouteName,
      routes: {
        AppRoutes.homeRouteName: (context) => Homescreen(),
        AppRoutes.introRouteName: (context) => IntroductionScreen(),
        AppRoutes.suraDetailsRouteName: (context) => SuraDetails(),
        AppRoutes.suraDetailsRouteName1: (context) => SuraDetails1(),
      },
    );
  }
}
