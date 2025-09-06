import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_color.dart';

class buildHadethScreen extends StatelessWidget {
   buildHadethScreen({super.key});
   final List<String> hadethTitles = [
    'فضل قراءة القرآن',
    'أهمية الصلاة',
    'بر الوالدين',
    'الصدقة',
    'طلب العلم',
    'حسن الخلق',
    'الصبر',
    'التوبة'
  ];

  @override
  Widget build(BuildContext context) {
    
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: hadethTitles.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) => _buildHadethItem(index),
    );
  }

  Widget _buildHadethItem(int index) {
    return InkWell(
      onTap: () {
        debugPrint('Selected Hadeth: ${hadethTitles[index]}');
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColor.primaryColor.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                hadethTitles[index],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColor.blackColor,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColor.primaryColor,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  }
