import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_image.dart';

class buildSebhaScreen extends StatelessWidget {
  const buildSebhaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Image.asset(
              AppImage.sebhalogo,
              width: 400,
              height: 400,
            ),
          ],
        ),
      ),
    );
  }
}
