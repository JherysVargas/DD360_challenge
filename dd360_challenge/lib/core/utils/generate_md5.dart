import 'dart:convert';

import 'package:crypto/crypto.dart';

class GenerateHash {
  static String generateMD5({
    required int timeStamp,
    required String publicKey,
    required String privateKey,
  }) {
    final bytes = utf8.encode("$timeStamp$privateKey$publicKey");
    final md5Hash = md5.convert(bytes);

    return md5Hash.toString();
  }
}
