import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';

class RemoteConfigService {
  static final FirebaseRemoteConfig _remoteConfig =
      FirebaseRemoteConfig.instance;

  /// Init khi app start
  static Future<void> init() async {
    try {
      await _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval:
          kDebugMode ? Duration.zero : const Duration(hours: 12),
        ),
      );

      // ✅ DEFAULT – CHƯA TẠO TRÊN CONSOLE VẪN CHẠY
      await _remoteConfig.setDefaults({
        'show_test_crash_button': false,
      });

      await _remoteConfig.fetchAndActivate();
    } catch (e) {
      debugPrint('RemoteConfig init error: $e');
    }
  }

  /// Getter an toàn
  static bool get showTestCrashButton {
    try {
      return _remoteConfig.getBool('show_test_crash_button');
    } catch (_) {
      return false;
    }
  }
}
