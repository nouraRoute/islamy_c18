// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class Assets {
  const Assets._();

  static const AssetGenImage appLogo = AssetGenImage('assets/app_logo.png');
  static const AssetGenImage hadeethTabBg = AssetGenImage(
    'assets/hadeeth_tab_bg.png',
  );
  static const String hadeethTabIcon = 'assets/hadeeth_tab_icon.svg';
  static const String headerImage = 'assets/header_image.svg';
  static const AssetGenImage imgHeader = AssetGenImage('assets/img_header.png');
  static const AssetGenImage islamyHeader = AssetGenImage(
    'assets/islamy_header.png',
  );
  static const AssetGenImage quranTabBg = AssetGenImage(
    'assets/quran_tab_bg.png',
  );
  static const String quranTabIcon = 'assets/quran_tab_icon.svg';
  static const String radioTabIcon = 'assets/radio_tab_icon.svg';
  static const String sebhaTabIcon = 'assets/sebha_tab_icon.svg';
  static const AssetGenImage suraImage = AssetGenImage('assets/sura_image.png');
  static const String timesTabIcon = 'assets/times_tab_icon.svg';
  static const String verseIcon = 'assets/verse_icon.svg';

  /// List of all assets
  static List<dynamic> get values => [
    appLogo,
    hadeethTabBg,
    hadeethTabIcon,
    headerImage,
    imgHeader,
    islamyHeader,
    quranTabBg,
    quranTabIcon,
    radioTabIcon,
    sebhaTabIcon,
    suraImage,
    timesTabIcon,
    verseIcon,
  ];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
