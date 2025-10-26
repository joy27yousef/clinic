import 'package:translator/translator.dart';

final translator = GoogleTranslator();

Future<String> translateText(String text, String targetLang) async {
  var translation = await translator.translate(text, to: targetLang);
  return translation.text;
}
