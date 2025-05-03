import 'dart:convert';


import 'package:examcollectors/Models/UserModels.dart';
import 'package:examcollectors/Pages/HomePage/widgets/calculatoruiWidget.dart';
import 'package:examcollectors/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageServices {
  late final SharedPreferences _prefs;
  Future<StorageServices> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  bool GetDeviceFirstOpen() {
    return _prefs.getBool(AppConstants.STORAGE_DEVICE_OPENED_FIRST) ?? false;
  }

  Future<void> setData(String key, UserModels value) async {
    await _prefs.setString(key, jsonEncode(value.toJson()));
  }

  UserModels? getData(String key) {
    String? jsonString = _prefs.getString(key);
    if (jsonString != null) {
      return UserModels.fromJson(jsonDecode(jsonString));
    }
    return null;
  }

  Future<void> addGradeCourses(List<CourseModule> courses) async {
    // Convert List<CourseModule> to JSON string
    final jsonString = jsonEncode(courses.map((course) => course.toJson()).toList());
    await _prefs.setString("myCourses", jsonString);
    print("added");
  }

  List<CourseModule>? getGradeCourses() {
    final jsonString = _prefs.getString("myCourses");
    if (jsonString != null) {
      // Parse JSON and convert to List<CourseModule>
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((json) => CourseModule.fromJson(json)).toList();
    }
    return null;
  }
}
