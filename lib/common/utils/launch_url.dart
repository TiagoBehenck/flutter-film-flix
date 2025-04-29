import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  Future<void> launch(String urlString) async {
    final Uri uri = Uri.parse(urlString);

    if (await canLaunchUrl(uri)) {
      final bool launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!launched) {
        throw Exception('Error: $urlString');
      }
    } else {
      throw Exception('Error: $urlString');
    }
  }
}
