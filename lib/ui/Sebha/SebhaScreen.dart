import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_image.dart';
import 'package:islami_app/utils/app_style.dart';

class buildSebhaScreen extends StatefulWidget {
  buildSebhaScreen({super.key});

  @override
  State<buildSebhaScreen> createState() => _buildSebhaScreenState();
}

class _buildSebhaScreenState extends State<buildSebhaScreen>
    with SingleTickerProviderStateMixin {
  List<String> azkar = [
    "سبحان الله\n وبحمده",
    "الحمدلله",
    "لا اله الا الله",
    "الله اكبر",
    "ولا حول ولا قوة \nالا بالله",
  ];

  int counter = 0;
  int currentAzkarIndex = 0;

  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 0.1,
    ).animate(CurvedAnimation(
      parent: _rotationController,
      curve: Curves.easeOutBack,
    ));
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  void onSebhaTap() {
    setState(() {
      counter++;

      if (counter == 33) {
        counter = 0;
        currentAzkarIndex++;

        if (currentAzkarIndex >= azkar.length) {
          currentAzkarIndex = 0;
        }
      }
    });

    _rotationController.forward().then((_) {
      _rotationController.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onSebhaTap,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: height * 0.10),
              Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _rotationAnimation,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _rotationAnimation.value * 2 * 3.14159,
                        child: SvgPicture.asset(
                          AppImage.sebhalogo,
                          height: height * 0.40,
                        ),
                      );
                    },
                  ),
                  Positioned(
                    top: height * 0.15,
                    child: Text(
                      azkar[currentAzkarIndex],
                      style: AppStyle.bold35White,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Positioned(
                    bottom: height * 0.08,
                    child: Text(
                      "$counter",
                      style: AppStyle.bold35White,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: height * 0.02),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(16)),
                child: Text(
                  textAlign: TextAlign.center,
                  "لا إله إلا الله وحده لا شريك له، له الملك، وله الحمد، وهو على كل شيء قدير",
                  style: AppStyle.bold16Black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
