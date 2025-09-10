import 'package:flutter/material.dart';
import 'package:islami_app/ui/Hadeeth/Hadeeth_model.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_image.dart';
import 'package:islami_app/utils/app_style.dart';

class HadeethDetails extends StatefulWidget {
  const HadeethDetails({super.key});

  @override
  State<HadeethDetails> createState() => _HadeethDetailsState();
}

class _HadeethDetailsState extends State<HadeethDetails> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    HadeethModel hadeeth =
        ModalRoute.of(context)!.settings.arguments as HadeethModel;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.primaryColor),
        backgroundColor: Colors.transparent,
        title: Text(
          hadeeth.title,
          style: AppStyle.bold20Primary,
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            AppImage.surabg,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: height * 0.02,
              horizontal: width * 0.04,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  hadeeth.title,
                  style: AppStyle.bold20Primary,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: height * 0.03),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SingleChildScrollView(
                      child: Text(
                        hadeeth.Content,
                        style: AppStyle.bold16Primary,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
              ],
            ),
          )
        ],
      ),
    );
  }
}
