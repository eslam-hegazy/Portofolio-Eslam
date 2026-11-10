import 'dart:js_interop';
import 'package:flutter/services.dart';
import 'package:web/web.dart' as web;

Future<void> savePdfFromAsset(String assetPath, String filename) async {
  final byteData = await rootBundle.load(assetPath);
  final uint8list = byteData.buffer.asUint8List(
    byteData.offsetInBytes,
    byteData.lengthInBytes,
  );
  final jsArray = uint8list.toJS;
  final blob = web.Blob(
    [jsArray].toJS,
    web.BlobPropertyBag(type: 'application/pdf'),
  );
  final blobUrl = web.URL.createObjectURL(blob);

  final anchor = web.document.createElement('a') as web.HTMLAnchorElement;
  anchor.href = blobUrl;
  anchor.download = filename;
  anchor.target = '_blank';
  web.document.body?.appendChild(anchor);
  anchor.click();
  anchor.remove();

  // Revoke object URL after a short delay to allow browser download to start
  Future.delayed(const Duration(seconds: 5), () {
    web.URL.revokeObjectURL(blobUrl);
  });
}

