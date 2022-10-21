import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_web_downloader/flutter_web_downloader.dart';

void main() {
  group('FlutterWebDownloader', () {
    test('Regex validation', () {
      const url1 = 'https://picsum.photos/250/250';
      final regexTest1 = FlutterWebDownloader.urlRegex.hasMatch(url1);
      final validUrl1 = FlutterWebDownloader.isValidUrl(url1);

      expect(regexTest1, true);
      expect(validUrl1, true);

      const url2 = 'htt50250';
      final regexTest2 = FlutterWebDownloader.urlRegex.hasMatch(url2);
      final validUrl2 = FlutterWebDownloader.isValidUrl(url2);

      expect(regexTest2, false);
      expect(validUrl2, false);
    });

    test('Mimes validation', () {
      const testMimeType = 'image/png';
      const testExtension = '.png';
      final ext = FlutterWebDownloader.fileExtensionFromMimeType(testMimeType);
      final mime = FlutterWebDownloader.mimeTypesFromExtension(testExtension);

      expect(ext, testExtension);
      expect(mime, [testMimeType]);
    });

    test('File extesion extraction', () {
      final ext = FlutterWebDownloader.fileExtensionFromFile('test.png');

      expect(ext, MimeType.png.fileExtension);
    });

    test('Image validation', () {
      final isImage = FlutterWebDownloader.isImageFromMimeType('image/png');

      expect(isImage, true);

      final isNotImage = FlutterWebDownloader.isImageFromMimeType('text/plain');

      expect(isNotImage, false);
    });

    // TODO: Add tests for downloads
    test('Downloads tests', () async {
      final bytesFromJson = utf8.encode(file);

      await FlutterWebDownloader.downloadUrlsFromFile(
        Uint8List.fromList(bytesFromJson),
      );

      await FlutterWebDownloader.downloadFileFromUrl(
        'https://picsum.photos/250/250',
      );
      await FlutterWebDownloader.downloadFileFromUrl(
        'https://picsum.photos/250/250',
        addFileExtension: false,
      );

      FlutterWebDownloader.downloadFileFromBytes([], 'test.png');
    });
  });
}

const file = '''
[
  {
    "id": 1,
    "photo": "https://picsum.photos/250/250",
  },
  {
    "id": 2,
    "photo": "https://picsum.photos/260/260",
  },
  {
    "id": 3,
    "photo": "https://picsum.photos/270/270",
  },
  {
    "id": 4,
    "photo": "https://picsum.photos/280/280",
  },
  {
    "id": 5,
    "photo": "https://picsum.photos/290/290",
  },
  {
    "id": 6,
    "photo": "https://picsum.photos/300/300",
  },
  {
    "id": 7,
    "photo": "https://picsum.photos/310/310",
  },
  {
    "id": 8,
    "photo": "https://picsum.photos/320/320",
  },
  {
    "id": 9,
    "photo": "https://picsum.photos/330/330",
  },
  {
    "id": 10,
    "photo": "https://picsum.photos/340/340",
  },
  {
    "id": 11,
    "photo": "https://picsum.photos/350/350",
  },
  {
    "id": 12,
    "photo": "https://picsum.photos/360/360",
  },
  {
    "id": 13,
    "photo": "https://picsum.photos/370/370",
  },
  {
    "id": 14,
    "photo": "https://picsum.photos/380/380",
  },
  {
    "id": 15,
    "photo": "https://picsum.photos/390/390",
  },
  {
    "id": 16,
    "photo": "https://picsum.photos/400/400",
  },
  {
    "id": 17,
    "photo": "https://picsum.photos/410/410",
  },
  {
    "id": 18,
    "photo": "https://picsum.photos/420/420",
  },
  {
    "id": 19,
    "photo": "https://picsum.photos/430/430",
  },
  {
    "id": 20,
    "photo": "https://picsum.photos/440/440",
  },
  {
    "id": 21,
    "photo": "https://picsum.photos/450/450",
  },
]
''';
