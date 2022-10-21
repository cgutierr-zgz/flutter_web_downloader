/// {@template mime_types}
/// A list of all the mime types. (https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types)
/// {@endtemplate}
enum MimeType {
  /// AAC audio
  aac(
    '.aac',
    ['audio/aac'],
  ),

  /// AbiWord document
  abw(
    '.abw',
    ['application/x-abiword'],
  ),

  /// Archive document (multiple files embedded)
  arc(
    '.arc',
    ['application/x-freearc'],
  ),

  /// AVIF image
  avif(
    '.avif',
    ['image/avif'],
  ),

  /// AVI: Audio Video Interleave
  avi(
    '.avi',
    ['video/x-msvideo'],
  ),

  /// Amazon Kindle eBook format
  azw(
    '.azw',
    ['application/vnd.amazon.ebook'],
  ),

  /// Any kind of binary data
  bin(
    '.bin',
    ['application/octet-stream'],
  ),

  /// Windows OS/2 Bitmap Graphics
  bmp(
    '.bmp',
    ['image/bmp'],
  ),

  /// BZip archive
  bz(
    '.bz',
    ['application/x-bzip'],
  ),

  /// BZip2 archive
  bz2(
    '.bz2',
    ['application/x-bzip2'],
  ),

  /// CD audio
  cda(
    '.cda',
    ['application/x-cdf'],
  ),

  /// C-Shell script
  csh(
    '.csh',
    ['application/x-csh'],
  ),

  /// Cascading Style Sheets (CSS)
  css(
    '.css',
    ['text/css'],
  ),

  /// Comma-separated values (CSV)
  csv(
    '.csv',
    ['text/csv'],
  ),

  /// Microsoft Word
  doc(
    '.doc',
    ['application/msword'],
  ),

  /// Microsoft Word (OpenXML)
  docx(
    '.docx',
    ['application/vnd.openxmlformats-officedocument.wordprocessingml.document'],
  ),

  /// MS Embedded OpenType fonts
  eot(
    '.eot',
    ['application/vnd.ms-fontobject'],
  ),

  /// Electronic publication (EPUB)
  epub(
    '.epub',
    ['application/epub+zip'],
  ),

  /// GZip Compressed Archive
  gz(
    '.gz',
    ['application/gzip'],
  ),

  /// Graphics Interchange Format (GIF)
  gif(
    '.gif',
    ['image/gif'],
  ),

  /// HyperText Markup Language (HTML)
  html(
    '.html',
    ['text/html'],
  ),

  /// Icon format
  ico(
    '.ico',
    ['image/vnd.microsoft.icon'],
  ),

  /// iCalendar format
  ics(
    '.ics',
    ['text/calendar'],
  ),

  /// Java Archive (JAR)
  jar(
    '.jar',
    ['application/java-archive'],
  ),

  /// JPEG images
  jpg(
    '.jpg',
    ['image/jpeg'],
  ),

  /// JavaScript
  js(
    '.js',
    ['text/javascript (Specifications: HTML and RFC 9239)'],
  ),

  /// JSON format
  json(
    '.json',
    ['application/json'],
  ),

  /// JSON-LD format
  jsonld(
    '.jsonld',
    ['application/ld+json'],
  ),

  /// Musical Instrument Digital Interface (MIDI)
  midi(
    '.midi',
    ['audio/midi audio/x-midi'],
  ),

  /// JavaScript module
  mjs(
    '.mjs',
    ['text/javascript'],
  ),

  /// MP3 audio
  mp3(
    '.mp3',
    ['audio/mpeg'],
  ),

  /// MP4 video
  mp4(
    '.mp4',
    ['video/mp4'],
  ),

  /// MPEG Video
  mpeg(
    '.mpeg',
    ['video/mpeg'],
  ),

  /// Apple Installer Package
  mpkg(
    '.mpkg',
    ['application/vnd.apple.installer+xml'],
  ),

  /// OpenDocument presentation document
  odp(
    '.odp',
    ['application/vnd.oasis.opendocument.presentation'],
  ),

  /// OpenDocument spreadsheet document
  ods(
    '.ods',
    ['application/vnd.oasis.opendocument.spreadsheet'],
  ),

  /// OpenDocument text document
  odt(
    '.odt',
    ['application/vnd.oasis.opendocument.text'],
  ),

  /// OGG audio
  oga(
    '.oga',
    ['audio/ogg'],
  ),

  /// OGG video
  ogv(
    '.ogv',
    ['video/ogg'],
  ),

  /// OGG
  ogx(
    '.ogx',
    ['application/ogg'],
  ),

  /// Opus audio
  opus(
    '.opus',
    ['audio/opus'],
  ),

  /// OpenType font
  otf(
    '.otf',
    ['font/otf'],
  ),

  /// Portable Network Graphics
  png(
    '.png',
    ['image/png'],
  ),

  /// Adobe Portable Document Format (PDF)
  pdf(
    '.pdf',
    ['application/pdf'],
  ),

  /// Hypertext Preprocessor (Personal Home Page)
  php(
    '.php',
    ['application/x-httpd-php'],
  ),

  /// Microsoft PowerPoint
  ppt(
    '.ppt',
    ['application/vnd.ms-powerpoint'],
  ),

  /// Microsoft PowerPoint (OpenXML)
  pptx(
    '.pptx',
    [
      'application/vnd.openxmlformats-officedocument.presentationml.presentation'
    ],
  ),

  /// RAR archive
  rar(
    '.rar',
    ['application/vnd.rar'],
  ),

  /// Rich Text Format (RTF)
  rtf(
    '.rtf',
    ['application/rtf'],
  ),

  /// Bourne shell script
  sh(
    '.sh',
    ['application/x-sh'],
  ),

  /// Scalable Vector Graphics (SVG)
  svg(
    '.svg',
    ['image/svg+xml'],
  ),

  /// Tape Archive (TAR)
  tar(
    '.tar',
    ['application/x-tar'],
  ),

  /// Tagged Image File Format (TIFF)
  tiff(
    '.tiff',
    ['image/tiff'],
  ),

  /// MPEG transport stream
  ts(
    '.ts',
    ['video/mp2t'],
  ),

  /// TrueType Font
  ttf(
    '.ttf',
    ['font/ttf'],
  ),

  /// Text, (generally ASCII or ISO 8859-n)
  txt(
    '.txt',
    ['text/plain'],
  ),

  /// Microsoft Visio
  vsd(
    '.vsd',
    ['application/vnd.visio'],
  ),

  /// Waveform Audio Format
  wav(
    '.wav',
    ['audio/wav'],
  ),

  /// WEBM audio
  weba(
    '.weba',
    ['audio/webm'],
  ),

  /// WEBM video
  webm(
    '.webm',
    ['video/webm'],
  ),

  /// WEBP image
  webp(
    '.webp',
    ['image/webp'],
  ),

  /// Web Open Font Format (WOFF)
  woff(
    '.woff',
    ['font/woff'],
  ),

  /// Web Open Font Format (WOFF)
  woff2(
    '.woff2',
    ['font/woff2'],
  ),

  /// XHTML
  xhtml(
    '.xhtml',
    ['application/xhtml+xml'],
  ),

  /// Microsoft Excel
  xls(
    '.xls',
    ['application/vnd.ms-excel'],
  ),

  /// Microsoft Excel (OpenXML)
  xlsx(
    '.xlsx',
    ['application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'],
  ),

  /// XML
  xml(
    '.xml',
    ['application/xml', 'text/xml', 'application/atom+xml'],
  ),

  /// XUL
  xul(
    '.xul',
    ['application/vnd.mozilla.xul+xml'],
  ),

  /// ZIP archive
  zip(
    '.zip',
    ['application/zip'],
  ),

  /// 3GPP audio/video container
  threegp(
    '.3gp',
    ['video/3gpp', 'audio/3gpp'],
  ),

  /// 3GPP2 audio/video container
  threeg2(
    '.3g2',
    ['video/3gpp2', 'audio/3gpp2'],
  ),

  /// 7-zip archive
  sevenz(
    '.7z',
    ['application/x-7z-compressed'],
  );

  /// {@macro mime_types}
  const MimeType(this.fileExtension, this.mimeType);

  /// The file extension of the mime type.
  /// For example: `.html` for the mime type `text/html`.
  final String fileExtension;

  /// The mime type of the file extension.
  /// For example: `text/html` for the file extension '.html'.
  /// The mime type can be a list of mime types.
  /// For example: `video/3gpp` and `audio/3gpp` for the file extension `.3gpp`.
  final List<String> mimeType;
}
