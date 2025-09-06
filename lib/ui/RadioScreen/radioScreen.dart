import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_color.dart';

class buildRadioScreen extends StatefulWidget {
  buildRadioScreen({super.key});

  @override
  State<buildRadioScreen> createState() => _buildRadioScreenState();
}

class _buildRadioScreenState extends State<buildRadioScreen> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 30),
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: AppColor.whiteColor.withOpacity(0.95),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 15,
              spreadRadius: 3,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'إذاعة القرآن الكريم',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppColor.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.radio,
                color: AppColor.primaryColor,
                size: 60,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              isPlaying ? 'جاري التشغيل...' : 'متوقف',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColor.blackColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'إذاعة القرآن الكريم من القاهرة',
              style: TextStyle(
                fontSize: 14,
                color: AppColor.blackColor.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildRadioButton(Icons.skip_previous, () {}),
                _buildRadioButton(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  _toggleRadio,
                  isPrimary: true,
                ),
                _buildRadioButton(Icons.skip_next, () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioButton(IconData icon, VoidCallback onTap,
      {bool isPrimary = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isPrimary ? 70 : 50,
        height: isPrimary ? 70 : 50,
        decoration: BoxDecoration(
          color: isPrimary
              ? AppColor.primaryColor
              : AppColor.primaryColor.withOpacity(0.1),
          shape: BoxShape.circle,
          boxShadow: isPrimary
              ? [
                  BoxShadow(
                    color: AppColor.primaryColor.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ]
              : null,
        ),
        child: Icon(
          icon,
          color: isPrimary ? AppColor.whiteColor : AppColor.primaryColor,
          size: isPrimary ? 35 : 25,
        ),
      ),
    );
  }

  void _toggleRadio() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }
}
