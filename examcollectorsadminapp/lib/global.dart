
import 'package:examcollectorsadminapp/firebase_options.dart';
import 'package:examcollectorsadminapp/services/storageSevices.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class Global {
  static late StorageServices storageServices;
  // static late UserModels userModels;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    storageServices = await StorageServices().init();
  }
}
