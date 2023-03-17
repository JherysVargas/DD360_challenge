import 'package:dd360_challenge/core/di/di_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> initalConfig() async {
  await configureDIDependencies();
  await dotenv.load(fileName: "assets/.env");
}
