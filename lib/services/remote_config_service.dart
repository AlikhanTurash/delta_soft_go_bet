import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

const String _URL_VALUE = 'url';

class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig;

  RemoteConfigService({required FirebaseRemoteConfig remoteConfig})
      : _remoteConfig = remoteConfig;

  final defaults = <String, dynamic>{_URL_VALUE: null};

  static late RemoteConfigService _instance;

  static Future<RemoteConfigService> getInstance() async {
    if (_instance == null) {
      _instance = RemoteConfigService(
        remoteConfig: await FirebaseRemoteConfig.instance,
      );
    }
    return _instance;
  }

  String get getStringValue => _remoteConfig.getString(_URL_VALUE);

  Future initialize() async {
    try {
      await _remoteConfig.setDefaults(defaults);
      await _remoteConfig.fetchAndActivate();
    } on FirebaseException catch (e) {
      print("Remote Config fetch throttled: $e");
    } catch (e) {
      print('Unable to fetch remote config. Default value will be used');
    }
  }
}
