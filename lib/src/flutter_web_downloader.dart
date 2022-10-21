import 'dart:convert';

import 'dart:typed_data';

import 'package:flutter_web_downloader/src/mime_types.dart';
import 'package:http/http.dart' as http;
import 'package:universal_html/html.dart' as html;

/// Set of usefful functions to download files
/// from the internet using Flutter web.
///
/// See:
///
/// ```dart
/// // Download all files from a given file (bytes)
/// FlutterWebDownloader.downloadUrlsFromFile(...)
/// // Download a file from a given url
/// FlutterWebDownloader.downloadFileFromUrl(...)
/// // Download all files from a given bytes
/// FlutterWebDownloader.downloadFileFromBytes(...)
/// // Regex used to validate urls
/// FlutterWebDownloader.urlRegex
/// // Validate a given url
/// FlutterWebDownloader.isValidUrl(...)
/// // Get the file extension from a given file.
/// FlutterWebDownloader.fileExtensionFromFile(...)
/// // Get a file extension from a given mime type
/// FlutterWebDownloader.fileExtensionFromMimeType(...)
/// // Get a mime type from a given file extension
/// FlutterWebDownloader.mimeTypesFromExtension(...)
/// // Checks if a given file is an image
/// FlutterWebDownloader.isImageFromMimeType(...)
/// ```
///
abstract class FlutterWebDownloader {
  /// Regex to match urls.
  static RegExp get urlRegex => RegExp(
        r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()!@:%_\+.~#?&\/\/=]*)',
      );

  /// Checks if a given `input` is a valid url.
  static bool isValidUrl(String url) => urlRegex.hasMatch(url);

  /// Get a file extension from a given file.
  static String fileExtensionFromFile(String file) => '''.${file.split('.').last}''';

  /// The given extension of the file for a specific mime type.
  /// For example: `.html` for the mime type `text/html`.
  static String? fileExtensionFromMimeType(
    /// The mime type, usually retrieved from the http response headers.
    /// as `response.headers['content-type']`.
    String mimeType,
  ) {
    for (final mime in MimeType.values) {
      if (mime.mimeType.contains(mimeType)) {
        return mime.fileExtension;
      }
    }
    return null;
  }

  /// Returns the mime type of a given file extension.
  static List<String>? mimeTypesFromExtension(
    /// The file extension of a given file.
    String ext,
  ) {
    for (final mime in MimeType.values) {
      if (mime.fileExtension == ext) {
        return mime.mimeType;
      }
    }
    return null;
  }

  /// Wether the given mime type is an image or not.
  /// For example: `image/png` is an image.
  /// For example: `text/html` is not an image.
  static bool isImageFromMimeType(
    /// The mime type, usually retrieved from the http response headers.
    /// as `response.headers['content-type']`.
    String mimeType,
  ) =>
      mimeType.contains('image');

  /// Loops through the given [fileContent] and downloads all the files
  /// that are found in the file content, based on url's.
  static Future<void> downloadUrlsFromFile(
    /// The content of the file.
    Uint8List fileContent, {

    /// Wether or not to download the file if it is an image.
    bool downloadImagesOnly = false,

    /// Request headers to use for the download.
    Map<String, String>? headers,
  }) async {
    final fileString = String.fromCharCodes(fileContent);

    final matches = urlRegex.allMatches(fileString);

    for (final match in matches) {
      final url = match.group(0)!;

      await FlutterWebDownloader.downloadFileFromUrl(
        url,
        downloadImagesOnly: downloadImagesOnly,
        headers: headers,
      );
    }
  }

  /// Downloads the given [url] and saves it as a file with the given [name].
  /// When [name] is not given, the name of the file will be the last
  /// part of the [url], e.g. `https://example.com/file.txt` will be saved
  /// as `file`, the extension is added automatically by checking the
  /// [MimeType] using the [fileExtensionFromMimeType] function
  static Future<void> downloadFileFromUrl(
    /// The url of the file to download.
    String url, {

    /// The name of the file to be saved.
    String? name,

    /// Http client to use for the download.
    http.Client? client,

    /// Request headers to use for the download.
    Map<String, String>? headers,

    /// Tries to get the file extension from the [MimeType] of the file
    /// Based on the request header `content-type`
    bool addFileExtension = true,

    /// Wether or not to download the file if it is an image.
    bool downloadImagesOnly = false,
  }) async {
    if (!isValidUrl(url)) throw Exception('Invalid url: $url');

    final httpClient = client ?? http.Client();
    final res = await httpClient.get(Uri.parse(url), headers: headers);
    final bytes = res.bodyBytes;
    var fileName = addFileExtension
        ? name ?? url.split('/').last.split('.').first
        : name ?? url.split('/').last;

    // Appends the file extension to the file
    if (res.headers['content-type'] != null && addFileExtension) {
      final mimeType = res.headers['content-type']!;

      // Checks if the file is an image and if it should be downloaded
      if (!isImageFromMimeType(mimeType) && downloadImagesOnly) return;

      final ext = fileExtensionFromMimeType(mimeType);
      if (ext != null) fileName = '$fileName$ext';
    }

    downloadFileFromBytes(bytes, fileName);
  }

  /// Downloads the given [bytes] and saves it as a file with the given [name].
  static void downloadFileFromBytes(
    /// The bytes of the file to download.
    List<int> bytes,

    /// The name of the file to be saved.
    String name, [

    /// Extension of the file to be saved.
    String ext = '',
  ]) {
    // Create the link with the file encoded in base64
    final base64 = base64Encode(bytes);
    final anchor =
        html.AnchorElement(href: 'data:application/octet-stream;base64,$base64')
          ..target = 'blank'
          ..download = '$name$ext';

    // Triggers the download
    html.document.body?.append(anchor);
    anchor
      ..click()
      ..remove();
    return;
  }
}
