import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/ui/Hadeeth/Hadeeth_item.dart';
import 'package:islami_app/ui/Hadeeth/Hadeeth_model.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_image.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_style.dart';

class buildHadethScreen extends StatelessWidget {
  buildHadethScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return CarouselSlider(
      options: CarouselOptions(
          height: height * 0.60,
          enlargeCenterPage: true,
          enlargeFactor: 0.2,
          viewportFraction: 0.77),
      items: List.generate(50, (index) => index + 1).map((index) {
        return HadeethItem(
          index: index,
        );
      }).toList(),
    );
  }
}
