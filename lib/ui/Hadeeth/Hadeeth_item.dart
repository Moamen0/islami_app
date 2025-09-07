import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ui/Hadeeth/Hadeeth_model.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_image.dart';
import 'package:islami_app/utils/app_style.dart';

class HadeethItem extends StatefulWidget {
  HadeethItem({super.key, required this.index});
  final int index;

  @override
  State<HadeethItem> createState() => _HadeethItemState();
}

class _HadeethItemState extends State<HadeethItem> {
  HadeethModel? hadeeth;
  @override
  void initState() {
    super.initState();
    loadHadeethContent(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppImage.hadeethbg)),
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColor.primaryColor,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppImage.patternLift),
                  Image.asset(AppImage.patternRight)
                ],
              ),
              Text(
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                hadeeth?.title ?? "",
                style: AppStyle.bold20Black,
              )
            ],
          ),
          Expanded(
            child: hadeeth == null
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColor.blackColor,
                    ),
                  )
                : SingleChildScrollView(
                    child: Text(
                      hadeeth!.Content,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: AppStyle.bold16Black,
                    ),
                  ),
          ),
          Spacer(),
          Image.asset(AppImage.patternbottom)
        ],
      ),
    );
  }

  void loadHadeethContent(int index) async {
    String filePath = "assets/Hadeeth/h$index.txt";
    String hadeethContent = await rootBundle.loadString(filePath);
    List<String> hadeethLine = hadeethContent.trim().split('\n');
    String title = hadeethLine[0];
    hadeethLine.removeAt(0);
    String content = hadeethLine.join();
    hadeeth = HadeethModel(title: title, Content: content);
    setState(() {});
  }
}
