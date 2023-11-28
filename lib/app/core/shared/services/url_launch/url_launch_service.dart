import 'package:url_launcher/url_launcher.dart' as launcher;

import 'i_url_launch_service.dart';

class UrlLaunchService implements IUrlLaunchService {
  const UrlLaunchService();

  @override
  Future<void> launchUrl(String url) async {
    await launcher.launchUrl(Uri.parse(url));
  }
}
