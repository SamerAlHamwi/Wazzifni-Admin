import 'package:url_launcher/url_launcher.dart';

class Launcher {
  static launchURL(String? url,
      {WebViewConfiguration webViewConfiguration =
          const WebViewConfiguration()}) async {
    if (url == null) return;
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch');
    }
  }
}
