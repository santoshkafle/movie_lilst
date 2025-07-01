import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  void launchURL(String uri) async {
    final Uri url = Uri.parse(uri);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
