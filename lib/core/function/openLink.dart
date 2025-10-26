import 'package:url_launcher/url_launcher.dart';

Future<void> launchCompanyUrl() async {
  final Uri url = Uri.parse('https://www.unocodetech.com/ar');
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    throw 'لا يمكن فتح الرابط $url';
  }
}
