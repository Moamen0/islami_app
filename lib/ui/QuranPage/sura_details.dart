import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ui/Animations/quran_page.dart';
import 'package:islami_app/ui/QuranPage/sura_content.dart';
import 'package:islami_app/ui/QuranPage/suracontent1/suraContent/suradetails1.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_image.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_style.dart';
import 'package:islami_app/utils/quran_resources%20.dart';
import 'package:islami_app/utils/shared_pref.dart'; // Add this import

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
      // Save this sura as recently read when the details screen is opened
      _saveSuraAsRecent(index);
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

  // Add this method to save sura as recently read
  Future<void> _saveSuraAsRecent(int index) async {
    await PrefsManger.addSuraIndex(index);
  }
}
