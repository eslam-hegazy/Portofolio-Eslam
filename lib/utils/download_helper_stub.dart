import 'dart:io';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> savePdfFromAsset(String assetPath, String filename) async {
  final byteData = await rootBundle.load(assetPath);
  final tempDir = Directory.systemTemp;
  final file = File('${tempDir.path}/$filename');
  await file.writeAsBytes(
    byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
  );
  final uri = Uri.file(file.path);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  }
}

