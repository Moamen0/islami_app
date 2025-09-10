import 'package:flutter/material.dart';
import 'package:islami_app/ui/RadioScreen/Radio%20Tab/AudioVisualization.dart';
import 'package:islami_app/ui/RadioScreen/Reciters/Reciters_model.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_image.dart';

class RecitersStationCard extends StatelessWidget {
  final RecitersModel station;
  final bool isPlaying;
  final VoidCallback onPlayPressed;

  const RecitersStationCard({
    super.key,
    required this.station,
    required this.isPlaying,
    required this.onPlayPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  station.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 98,
                      child: isPlaying
                          ? AudioVisualization()
                          : ClipRRect(
                              child: Image.asset(
                                AppImage.patternbottom,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: onPlayPressed,
                          child: Icon(
                            isPlaying ? Icons.pause : Icons.play_arrow,
                            color: AppColor.blackColor,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            isPlaying ? Icons.volume_up : Icons.volume_off,
                            color: AppColor.blackColor,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}