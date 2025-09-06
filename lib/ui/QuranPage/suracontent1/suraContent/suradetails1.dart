import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ui/Animations/quran_page.dart';
import 'package:islami_app/ui/QuranPage/sura_content.dart';
import 'package:islami_app/ui/QuranPage/sura_details.dart';
import 'package:islami_app/ui/QuranPage/suracontent1/suraContent/suracontent1.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_image.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_style.dart';
import 'package:islami_app/utils/quran_resources%20.dart';
import 'package:islami_app/utils/shared_pref.dart'; // Add this import

class SuraDetails1 extends StatefulWidget {
  const SuraDetails1({super.key});

  @override
  State<SuraDetails1> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails1> {
  String suraFile = "";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    int index = ModalRoute.of(context)!.settings.arguments as int;

    if (suraFile.isEmpty) {
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
                  child: SuraDetails(),
                  index: index,
                  direction: AxisDirection.right,
                ),
              );
            },
            icon: Icon(
              Icons.switch_right_rounded,
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
                SizedBox(
                  height: height * 0.06,
                ),
                Expanded(
                  child: suraFile.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColor.primaryColor,
                          ),
                        )
                      : SingleChildScrollView(
                          child: SuraContent1(content: suraFile),
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

      List<String> processedContent = [];
      for (int i = 0; i < suraContent.length; i++) {
        String verse = suraContent[i].trim();
        if (verse.isNotEmpty) {
          processedContent.add("$verse [${processedContent.length + 1}]");
        }
      }

      suraFile = processedContent.join(" ");
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
