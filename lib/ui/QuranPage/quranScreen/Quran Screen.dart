import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_image.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_style.dart';
import 'package:islami_app/utils/quran_resources%20.dart';
import 'package:islami_app/utils/shared_pref.dart';

class buildQuranScreen extends StatefulWidget {
  buildQuranScreen({super.key});

  @override
  State<buildQuranScreen> createState() => _buildQuranScreenState();
}

class _buildQuranScreenState extends State<buildQuranScreen> {
  @override
  void initState() {
    super.initState();
    _loadRecentSuras();
  }

  Future<void> _loadRecentSuras() async {
    List<int> recent = await PrefsManger.getMostRecentSuras();
    setState(() {
      recentSuras = recent;
    });
  }

  List<int> recentSuras = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildRecentlyReadCard(),
        const SizedBox(height: 20),
        Text(
          "Most Recently",
          style: AppStyle.bold16White,
        ),
        SizedBox(height: 150, child: _buildMostRecentlyCard()),
        SizedBox(height: 10),
        Text(
          "Sura List",
          style: AppStyle.bold16White,
        ),
        Expanded(child: _buildSurahsList()),
      ],
    );
  }

  Widget _buildMostRecentlyCard() {
    List<int> displaySuras =
        recentSuras.isEmpty ? List.generate(10, (index) => index) : recentSuras;

    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        int suraIndex = displaySuras[index];
        return GestureDetector(
          onTap: () async {
            await PrefsManger.addSuraIndex(suraIndex);
            await _loadRecentSuras();

            if (mounted) {
              Navigator.of(context).pushNamed(
                AppRoutes.suraDetailsRouteName1,
                arguments: suraIndex,
              );
            }
          },
          child: Container(
            width: 280,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.primaryColor,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        QuranResources.englishQuranSurahs[suraIndex],
                        style: AppStyle.bold24Black,
                      ),
                      Text(
                        QuranResources.arabicAuranSuras[suraIndex],
                        style: AppStyle.bold24Black,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "Verses ${QuranResources.AyaNumber[suraIndex]}",
                        style: AppStyle.bold14Black,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Image.asset(AppImage.mostRecentlycard),
              ],
            ),
          ),
        );
      },
      itemCount: displaySuras.length > 10 ? 10 : displaySuras.length,
      separatorBuilder: (context, index) => const SizedBox(width: 10),
    );
  }

  Widget _buildRecentlyReadCard() {
    return TextField(
      cursorColor: AppColor.primaryColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        prefixIcon: Image.asset(
          AppImage.quranIcon,
          color: AppColor.primaryColor,
        ),
        hintText: "Sura Name",
        hintStyle: AppStyle.bold16White,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColor.primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColor.primaryColor),
        ),
      ),
    );
  }

  Widget _buildSurahsList() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: QuranResources.arabicAuranSuras.length,
      separatorBuilder: (context, index) => Divider(
        height: 1,
        color: AppColor.whiteColor.withOpacity(0.3),
      ),
      itemBuilder: (context, index) => _buildSurahItem(index),
    );
  }

  Widget _buildSurahItem(int index) {
    return ListTile(
      leading: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(AppImage.suraicon),
          Text('${index + 1}', style: AppStyle.bold16White),
        ],
      ),
      title: Text(
        QuranResources.englishQuranSurahs[index],
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColor.whiteColor,
        ),
      ),
      subtitle: Text(
        '${QuranResources.AyaNumber[index]} Verses ',
        style: TextStyle(
          color: AppColor.whiteColor.withOpacity(0.7),
        ),
      ),
      trailing: Text(
        QuranResources.arabicAuranSuras[index],
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColor.whiteColor,
        ),
      ),
      onTap: () async {
        await PrefsManger.addSuraIndex(index);
        await _loadRecentSuras();

        if (mounted) {
          Navigator.of(context).pushNamed(
            AppRoutes.suraDetailsRouteName1,
            arguments: index,
          );
        }
      },
    );
  }
}
