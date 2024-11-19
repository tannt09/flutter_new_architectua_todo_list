import 'package:flutter_dotenv/flutter_dotenv.dart';

String changeImageLink(String originalLink) {

  return originalLink.replaceFirst(
      'http://localhost:3000', '${dotenv.env['BASE_URL']}');
}
