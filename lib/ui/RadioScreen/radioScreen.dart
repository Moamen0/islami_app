import 'package:flutter/material.dart';
import 'package:islami_app/ui/RadioScreen/Radio%20Tab/Radio_model.dart';
import 'package:islami_app/ui/RadioScreen/Radio%20Tab/Radio_tab.dart';
import 'package:islami_app/ui/RadioScreen/Reciters/RecitersStationCaed.dart';
import 'package:islami_app/ui/RadioScreen/Reciters/Reciters_model.dart';
import 'package:islami_app/utils/app_color.dart';

class BuildRadioScreen extends StatefulWidget {
  const BuildRadioScreen({super.key});

  @override
  State<BuildRadioScreen> createState() => _BuildRadioScreenState();
}

class _BuildRadioScreenState extends State<BuildRadioScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int currentPlayingIndex = -1;
  bool isPlaying = false;

  int currentTab = 0;

  final List<RadioStation> radioStations = [
    RadioStation("Radio Ibrahim Al-Akdar", true),
    RadioStation("Radio Al-Qaria Yassen", false),
    RadioStation("Radio Ahmed Al-trabulsi", false),
    RadioStation("Radio Addokali Mohammad Alalim", false),
  ];

  final List<RecitersModel> recitersStations = [
    RecitersModel("Ibrahim Al-Akdar", true),
    RecitersModel("Al-Qaria Yassen", false),
    RecitersModel("Ahmed Al-trabulsi", false),
    RecitersModel("Addokali Mohammad Alalim", false),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);

    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        setState(() {
          currentTab = tabController.index;
          currentPlayingIndex = -1;
          isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: TabBar(
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              controller: tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              tabs: [
                Tab(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                    child: Text(
                      "Radio",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    child: Text(
                      "Reciters",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.separated(
                    padding: EdgeInsets.only(top: 10),
                    itemBuilder: (context, index) {
                      return RadioStationCard(
                        station: radioStations[index],
                        isPlaying: currentTab == 0 &&
                            currentPlayingIndex == index &&
                            isPlaying,
                        onPlayPressed: () => _togglePlay(index),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                    itemCount: radioStations.length,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.separated(
                    padding: EdgeInsets.only(top: 10),
                    itemBuilder: (context, index) {
                      return RecitersStationCard(
                        station: recitersStations[index],
                        isPlaying: currentTab == 1 &&
                            currentPlayingIndex == index &&
                            isPlaying,
                        onPlayPressed: () => _togglePlay(index),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                    itemCount: recitersStations.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _togglePlay(int index) {
    setState(() {
      if (currentPlayingIndex == index && isPlaying) {
        isPlaying = false;
      } else {
        currentPlayingIndex = index;
        isPlaying = true;
      }
    });
  }
}
