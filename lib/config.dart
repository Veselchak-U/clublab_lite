import 'dart:io';

import 'package:clublab_lite/env.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class Config {
  static const appName = 'ClubLab-lite';
  static const isProdBuild = bool.fromEnvironment('PROD_BUILD');

  static String termsOfUseUrl(String languageCode) =>
      'https://clublab.bitango.co.il/page/termsOfUse?lang=$languageCode';

  static String privacyPolicyUrl(String languageCode) =>
      'https://clublab.bitango.co.il/page/privacyPolicy?lang=$languageCode';

  static late final Env environment;

  static late final String? appDocFolder;
  static late final String? tempFolder;

  static Future<void> init({
    Env? savedEnv,
  }) async {
    environment = isProdBuild ? Env.prod : savedEnv ?? Env.dev;

    appDocFolder = await _getAppDocDirectory();
    tempFolder = await _getTempDirectory();
  }

  static Future<String?> _getAppDocDirectory() async {
    try {
      final appDocDirectory = await getApplicationDocumentsDirectory();
      await _createDirIfNotExist(appDocDirectory.path);

      return appDocDirectory.path;
    } on Object catch (e, st) {
      debugPrint('!!! Config.getAppDocDirectory(): $e, \n $st');

      return null;
    }
  }

  static Future<String?> _getTempDirectory() async {
    try {
      final tempDirectory = await getTemporaryDirectory();
      await _createDirIfNotExist(tempDirectory.path);

      return tempDirectory.path;
    } on Object catch (e, st) {
      debugPrint('!!! Config.getTempDirectory(): $e, \n $st');

      return null;
    }
  }

  static Future<void> _createDirIfNotExist(String dirPath) async {
    final dir = Directory(dirPath);
    final exist = await dir.exists();
    if (!exist) await dir.create(recursive: true);
  }
}
