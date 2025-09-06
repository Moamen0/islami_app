import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_color.dart';

class buildTimeScreen extends StatelessWidget {
  buildTimeScreen({super.key});
  int selectedindex = 0;
  final List<Map<String, String>> prayerTimes = [
    {'name': 'الفجر', 'time': '5:30'},
    {'name': 'الشروق', 'time': '6:45'},
    {'name': 'الظهر', 'time': '12:15'},
    {'name': 'العصر', 'time': '3:45'},
    {'name': 'المغرب', 'time': '6:30'},
    {'name': 'العشاء', 'time': '8:00'},
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(25),
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
              // Header
              Text(
                'مواقيت الصلاة',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'السبت، 30 أغسطس 2025',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColor.blackColor.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 20),
              _buildNextPrayerCard(),
              const SizedBox(height: 20),
              Column(
                children: prayerTimes
                    .map((prayer) =>
                        _buildPrayerTimeRow(prayer['name']!, prayer['time']!))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNextPrayerCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColor.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            'الصلاة القادمة',
            style: TextStyle(
              fontSize: 16,
              color: AppColor.blackColor.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'الظهر',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '12:15',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: AppColor.blackColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrayerTimeRow(String prayerName, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            prayerName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColor.blackColor,
            ),
          ),
          Text(
            time,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColor.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
