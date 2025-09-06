import 'package:flutter/material.dart';
import 'package:islami_app/ui/QuranPage/quranScreen/Quran%20Screen.dart';
import 'package:islami_app/ui/RadioScreen/radioScreen.dart';
import 'package:islami_app/ui/Sebha/SebhaScreen.dart';
import 'package:islami_app/ui/TimeScreen/TimeScreen.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_image.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_style.dart';
import 'package:islami_app/utils/quran_resources%20.dart';
import 'package:islami_app/utils/shared_pref.dart';
import 'Hadeeth/HadethScreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int selectedindex = 0;
  int counter = 0;
  bool isPlaying = false;
  List<int> recentSuras = [];



  final List<String> backGroundImages = [
    AppImage.quranbg,
    AppImage.hadethbg,
    AppImage.sebhabg,
    AppImage.radiobg,
    AppImage.timebg
  ];

  final List<int> ayahCounts = [7, 286, 200, 176, 120, 165, 206, 75, 129, 109];

 

  void _onNavBarTap(int index) {
    if (selectedindex != index) {
      setState(() {
        selectedindex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            backGroundImages[selectedindex],
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.only(top: 55),
            child: Column(
              children: [
                Image.asset(AppImage.logo),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _buildScreenContent(),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: _buildBottomNavigationBar(),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: selectedindex,
      onTap: _onNavBarTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColor.primaryColor,
      selectedItemColor: AppColor.whiteColor,
      unselectedItemColor: AppColor.blackColor,
      items: [
        BottomNavigationBarItem(
          label: "Quran",
          icon: _buildBottomNavItem(index: 0, iconName: AppImage.quranIcon),
        ),
        BottomNavigationBarItem(
          label: "Hadeth",
          icon: _buildBottomNavItem(index: 1, iconName: AppImage.hadethIcon),
        ),
        BottomNavigationBarItem(
          label: "Sebha",
          icon: _buildBottomNavItem(index: 2, iconName: AppImage.sebhaIcon),
        ),
        BottomNavigationBarItem(
          label: "Radio",
          icon: _buildBottomNavItem(index: 3, iconName: AppImage.radioIcon),
        ),
        BottomNavigationBarItem(
          label: "Time",
          icon: _buildBottomNavItem(index: 4, iconName: AppImage.timeIcon),
        ),
      ],
    );
  }

  Widget _buildScreenContent() {
    switch (selectedindex) {
      case 0:
        return buildQuranScreen();
      case 1:
        return buildHadethScreen();
      case 2:
        return buildSebhaScreen();
      case 3:
        return buildRadioScreen();
      case 4:
        return buildTimeScreen();
      default:
        return buildQuranScreen();
    }
  }

  Widget _buildBottomNavItem({required int index, required String iconName}) {
    return selectedindex == index
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              color: AppColor.blackBgColor,
            ),
            child: ImageIcon(AssetImage(iconName)),
          )
        : ImageIcon(AssetImage(iconName));
  }
}
