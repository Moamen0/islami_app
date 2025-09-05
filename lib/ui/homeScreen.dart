import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_image.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_style.dart';
import 'package:islami_app/utils/quran_resources%20.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int selectedindex = 0;
  int counter = 0;
  String currentTasbih = 'سبحان الله';
  int tasbihIndex = 0;
  bool isPlaying = false;

  final List<String> tasbihList = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
    'لا إله إلا الله'
  ];

  final List<String> backGroundImages = [
    AppImage.quranbg,
    AppImage.hadethbg,
    AppImage.sebhabg,
    AppImage.radiobg,
    AppImage.timebg
  ];

  final List<String> surahNames = [
    'الفاتحة',
    'البقرة',
    'آل عمران',
    'النساء',
    'المائدة',
    'الأنعام',
    'الأعراف',
    'الأنفال',
    'التوبة',
    'يونس'
  ];

  final List<int> ayahCounts = [7, 286, 200, 176, 120, 165, 206, 75, 129, 109];

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

  final List<Map<String, String>> prayerTimes = [
    {'name': 'الفجر', 'time': '5:30'},
    {'name': 'الشروق', 'time': '6:45'},
    {'name': 'الظهر', 'time': '12:15'},
    {'name': 'العصر', 'time': '3:45'},
    {'name': 'المغرب', 'time': '6:30'},
    {'name': 'العشاء', 'time': '8:00'},
  ];

  void _onNavBarTap(int index) {
    if (selectedindex != index) {
      setState(() {
        selectedindex = index;
      });
    }
  }

  

  

  

  void _toggleRadio() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            backGroundImages[selectedindex],
            fit: BoxFit.cover,
          ),
        ),
        // Main Scaffold
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.only(top: 55),
            child: Column(
              children: [
                Image.asset(AppImage.logo),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _buildScreenContent(),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: _buildBottomNavigationBar(),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: selectedindex,
      onTap: _onNavBarTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColor.primaryColor,
      selectedItemColor: AppColor.whiteColor,
      unselectedItemColor: AppColor.blackColor,
      items: [
        BottomNavigationBarItem(
          label: "Quran",
          icon: _buildBottomNavItem(index: 0, iconName: AppImage.quranIcon),
        ),
        BottomNavigationBarItem(
          label: "Hadeth",
          icon: _buildBottomNavItem(index: 1, iconName: AppImage.hadethIcon),
        ),
        BottomNavigationBarItem(
          label: "Sebha",
          icon: _buildBottomNavItem(index: 2, iconName: AppImage.sebhaIcon),
        ),
        BottomNavigationBarItem(
          label: "Radio",
          icon: _buildBottomNavItem(index: 3, iconName: AppImage.radioIcon),
        ),
        BottomNavigationBarItem(
          label: "Time",
          icon: _buildBottomNavItem(index: 4, iconName: AppImage.timeIcon),
        ),
      ],
    );
  }

  Widget _buildScreenContent() {
    switch (selectedindex) {
      case 0:
        return _buildQuranScreen();
      case 1:
        return _buildHadethScreen();
      case 2:
        return _buildSebhaScreen();
      case 3:
        return _buildRadioScreen();
      case 4:
        return _buildTimeScreen();
      default:
        return _buildQuranScreen();
    }
  }

  Widget _buildQuranScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildRecentlyReadCard(),
        const SizedBox(height: 20),
        Text(
          "Most Recently",
          style: AppStyle.bold16White,
        ),
        SizedBox(height: 150, child: _buildMostRecntlyCard()),
        SizedBox(
          height: 10,
        ),
        Text(
          "Sura List",
          style: AppStyle.bold16White,
        ),
        Expanded(child: _buildSurahsList()),
      ],
    );
  }

  Widget _buildMostRecntlyCard() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
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
                      "${QuranResources.englishQuranSurahs[index]}",
                      style: AppStyle.bold24Black,
                    ),
                    Text(
                      "${QuranResources.arabicAuranSuras[index]}",
                      style: AppStyle.bold24Black,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "Verses ${QuranResources.AyaNumber[index]}",
                      style: AppStyle.bold14Black,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Image.asset(AppImage.mostRecentlycard),
            ],
          ),
        );
      },
      itemCount: 10,
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
          borderRadius: BorderRadius.circular(
            16,
          ),
          borderSide: BorderSide(color: AppColor.primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            16,
          ),
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
        "${QuranResources.englishQuranSurahs[index]}",
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
        "${QuranResources.arabicAuranSuras[index]}",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColor.whiteColor,
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.suraDetailsRouteName1,
          arguments: index,
        );
      },
    );
  }

  Widget _buildHadethScreen() {
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

  Widget _buildSebhaScreen() {
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

  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback onTap,
    required bool isPrimary,
    double size = 70,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: isPrimary
              ? AppColor.primaryColor
              : AppColor.whiteColor.withOpacity(0.9),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: isPrimary
                  ? AppColor.primaryColor.withOpacity(0.4)
                  : Colors.black.withOpacity(0.1),
              blurRadius: isPrimary ? 15 : 8,
              spreadRadius: isPrimary ? 3 : 2,
            ),
          ],
        ),
        child: Icon(
          icon,
          color: isPrimary ? AppColor.whiteColor : AppColor.primaryColor,
          size: isPrimary ? 40 : 30,
        ),
      ),
    );
  }

  Widget _buildRadioScreen() {
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
            // Status
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
            // Control Buttons
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

  Widget _buildTimeScreen() {
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
              // Current Date
              Text(
                'السبت، 30 أغسطس 2025',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColor.blackColor.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 20),
              // Next Prayer Info
              _buildNextPrayerCard(),
              const SizedBox(height: 20),
              // Prayer Times List
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

  Widget _buildBottomNavItem({required int index, required String iconName}) {
    return selectedindex == index
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              color: AppColor.blackBgColor,
            ),
            child: ImageIcon(AssetImage(iconName)),
          )
        : ImageIcon(AssetImage(iconName));
  }
}
