import 'package:shared_preferences/shared_preferences.dart';

class PrefsManger {
  static const String _mostRecentSuraKey = "most_recent_sura_indices";
  static const int _maxRecentSuras = 10; // Limit to 10 most recent suras

  static Future<void> addSuraIndex(int suraIndex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    List<String> mostRecentSuraIndices = 
        prefs.getStringList(_mostRecentSuraKey) ?? [];
    
    String indexString = suraIndex.toString();
    
    mostRecentSuraIndices.remove(indexString);
    
    mostRecentSuraIndices.insert(0, indexString);
    
    if (mostRecentSuraIndices.length > _maxRecentSuras) {
      mostRecentSuraIndices = mostRecentSuraIndices.sublist(0, _maxRecentSuras);
    }
    
    await prefs.setStringList(_mostRecentSuraKey, mostRecentSuraIndices);
  }

  static Future<List<int>> getMostRecentSuras() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentSuraIndices = 
        prefs.getStringList(_mostRecentSuraKey) ?? [];
    
    return mostRecentSuraIndices.map((index) => int.parse(index)).toList();
  }

  static Future<void> clearRecentSuras() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_mostRecentSuraKey);
  }

  static Future<bool> isSuraRecent(int suraIndex) async {
    List<int> recentSuras = await getMostRecentSuras();
    return recentSuras.contains(suraIndex);
  }
}