import 'download_helper_stub.dart'
    if (dart.library.js_interop) 'download_helper_web.dart' as impl;

/// Downloads or opens a PDF bundled in Flutter assets.
/// 
/// On Web: creates a Blob and triggers native browser download.
/// On Native (Desktop/Mobile): extracts asset to system temp and launches default PDF viewer.
Future<void> downloadPdfAsset(String assetPath, String filename) async {
  await impl.savePdfFromAsset(assetPath, filename);
}

