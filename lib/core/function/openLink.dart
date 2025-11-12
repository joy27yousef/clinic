import 'package:url_launcher/url_launcher.dart';

Future<void> launchCompanyUrl(String link) async {
  final Uri url = Uri.parse(link);
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    throw 'لا يمكن فتح الرابط $url';
  }
}
