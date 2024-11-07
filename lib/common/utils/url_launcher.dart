import 'package:clublab_lite/app/service/logger/exception/logic_exception.dart';
import 'package:clublab_lite/app/service/logger/logger_service.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static Future<void> launchURL(String? url) async {
    final uri = convertToUri(url);
    if (uri == null) {
      throw LogicException('URL parsing error: "$uri"');
    } else {
      LoggerService().d('UrlLauncher.launchURL() trying to open: $uri');
      try {
        final result = await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
        if (!result) {
          throw LogicException('The URL could not be opened: "$uri"');
        }
      } on Object catch (e, st) {
        LoggerService().e(error: e, stackTrace: st);

        throw LogicException('Error opening the URL: "$uri"');
      }
    }
  }

  static Uri? convertToUri(String? url) {
    if (url == null || url.isEmpty) return null;
    final uri = Uri.tryParse(url);

    return uri == null || uri.scheme.isEmpty ? null : uri;
  }
}
