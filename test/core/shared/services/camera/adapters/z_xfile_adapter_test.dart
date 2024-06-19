import 'package:camera/camera.dart';
import 'package:camera_poc/core/shared/services/camera/adapters/z_xfile_adapter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_xfile.dart';

void main() {
  group('ZXFileAdapter', () {
    test('toZXFile should convert XFile to ZXFile', () {
      final xFile = XFile('path/to/file');

      final result = ZXFileAdapter.toZXFile(xFile);

      expect(result, isA<ZXFile>());
      expect(result.path, equals(xFile.path));
    });
  });
}
