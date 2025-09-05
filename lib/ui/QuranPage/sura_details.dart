import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ui/QuranPage/sura_content.dart';
import 'package:islami_app/ui/QuranPage/suracontent1/suradetails1.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_image.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_style.dart';
import 'package:islami_app/utils/quran_resources%20.dart';

class SlidePageRoute<T> extends PageRouteBuilder<T> {
  final Widget child;
  final AxisDirection direction;
  final int index;

  SlidePageRoute({
    required this.child,
    required this.index,
    this.direction = AxisDirection.left,
  }) : super(
          settings: RouteSettings(arguments: index),
          transitionDuration: Duration(milliseconds: 300),
          reverseTransitionDuration: Duration(milliseconds: 300),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    Offset begin;
    Offset end = Offset.zero;

    switch (direction) {
      case AxisDirection.right:
        begin = Offset(-1.0, 0.0);
        break;
      case AxisDirection.left:
        begin = Offset(1.0, 0.0);
        break;
      case AxisDirection.up:
        begin = Offset(0.0, 1.0);
        break;
      case AxisDirection.down:
        begin = Offset(0.0, -1.0);
        break;
    }

    var curve = Curves.easeInOutCubic;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    var offsetAnimation = animation.drive(tween);

    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }
}

class SuraDetails extends StatefulWidget {
  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    int index = ModalRoute.of(context)!.settings.arguments as int;
    if (verses.isEmpty) {
      loadFileSuras(index);
    }
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                SlidePageRoute(
                  child: SuraDetails1(),
                  index: index,
                  direction: AxisDirection.left,
                ),
              );
            },
            icon: Icon(
              Icons.switch_left_rounded,
              color: AppColor.primaryColor,
            ),
          )
        ],
        iconTheme: IconThemeData(color: AppColor.primaryColor),
        backgroundColor: Colors.transparent,
        title: Text(
          QuranResources.englishQuranSurahs[index],
          style: AppStyle.bold24Primary,
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            AppImage.surabg,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.02),
            child: Column(
              children: [
                Text(
                  QuranResources.arabicAuranSuras[index],
                  style: AppStyle.bold24Primary,
                ),
                Expanded(
                  child: verses.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColor.primaryColor,
                          ),
                        )
                      : ListView.separated(
                          padding: EdgeInsets.only(top: height * 0.04),
                          itemBuilder: (context, verseIndex) {
                            return SuraContent(
                              content: verses[verseIndex],
                              index: verseIndex,
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(
                            height: height * 0.02,
                          ),
                          itemCount: verses.length,
                        ),
                ),
                SizedBox(
                  height: height * 0.10,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> loadFileSuras(int index) async {
    try {
      String fileContent =
          await rootBundle.loadString("assets/Suras/${index + 1}.txt");
      List<String> suraContent = fileContent.split("\n");

      verses = suraContent.where((verse) => verse.trim().isNotEmpty).toList();
      setState(() {});
    } catch (e) {
      print("Error loading sura file: $e");
      setState(() {});
    }
  }
}
