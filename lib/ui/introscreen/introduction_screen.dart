import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/ui/homeScreen.dart';
import 'package:islami_app/ui/introscreen/screenFive.dart';
import 'package:islami_app/ui/introscreen/screenfour.dart';
import 'package:islami_app/ui/introscreen/screenone.dart';
import 'package:islami_app/ui/introscreen/screenthree.dart';
import 'package:islami_app/ui/introscreen/screentwo.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  PageController _pageController = PageController();
  String buttonNext = "Next";
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentPageIndex = index;
                if (currentPageIndex == 4) {
                  buttonNext = "Finish";
                } else {
                  buttonNext = "Next";
                }
              });
            },
            children: [
              Screenone(),
              Screentwo(),
              Screenthree(),
              Screenfour(),
              Screenfive(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                currentPageIndex > 0
                    ? InkWell(
                        onTap: () {
                          _pageController.previousPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text(
                          "Back",
                          style: TextStyle(color: AppColor.primaryColor),
                        ),
                      )
                    : SizedBox(width: 50),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 5,
                  effect: WormEffect(
                    dotColor: Colors.grey,
                    activeDotColor: AppColor.primaryColor,
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                ),

                InkWell(
                  onTap: () {
                    if (currentPageIndex == 4) {
                      _handleFinish();
                    } else {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  child: Text(
                    buttonNext,
                    style: TextStyle(color: AppColor.primaryColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleFinish() {
    Navigator.of(context).pushReplacementNamed(AppRoutes.homeRouteName);
  }
}
