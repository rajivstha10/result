/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconGen {
  const $AssetsIconGen();

  /// File path: assets/icon/All Icon.png
  AssetGenImage get allIcon => const AssetGenImage('assets/icon/All Icon.png');

  /// File path: assets/icon/Drainage.svg
  String get drainage => 'assets/icon/Drainage.svg';

  /// File path: assets/icon/Electricity.svg
  String get electricity => 'assets/icon/Electricity.svg';

  /// File path: assets/icon/Home.ai
  String get homeAi => 'assets/icon/Home.ai';

  /// File path: assets/icon/Home.svg
  String get homeSvg => 'assets/icon/Home.svg';

  /// File path: assets/icon/Location.svg
  String get location => 'assets/icon/Location.svg';

  /// File path: assets/icon/Measurment.svg
  String get measurment => 'assets/icon/Measurment.svg';

  /// File path: assets/icon/Road.svg
  String get road => 'assets/icon/Road.svg';

  /// File path: assets/icon/Water.svg
  String get water => 'assets/icon/Water.svg';

  /// File path: assets/icon/app_icon.png
  AssetGenImage get appIcon => const AssetGenImage('assets/icon/app_icon.png');

  /// File path: assets/icon/app_icon_foreground.png
  AssetGenImage get appIconForeground =>
      const AssetGenImage('assets/icon/app_icon_foreground.png');

  /// File path: assets/icon/my_location.png
  AssetGenImage get myLocation =>
      const AssetGenImage('assets/icon/my_location.png');

  /// File path: assets/icon/red_dot.png
  AssetGenImage get redDot => const AssetGenImage('assets/icon/red_dot.png');

  /// List of all assets
  List<dynamic> get values => [
        allIcon,
        drainage,
        electricity,
        homeAi,
        homeSvg,
        location,
        measurment,
        road,
        water,
        appIcon,
        appIconForeground,
        myLocation,
        redDot
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/logo.png
  AssetGenImage get resultELogo =>
      const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/result_in_letter.png
  AssetGenImage get resultInLetter =>
      const AssetGenImage('assets/images/result_in_letter.png');

  /// File path: assets/images/get_result.png
  AssetGenImage get getResult =>
      const AssetGenImage('assets/images/get_result.jpg');

  /// File path: assets/images/get_result.png
  AssetGenImage get wallpaper =>
      const AssetGenImage('assets/images/wallpaper.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        resultELogo,
        resultInLetter,
        getResult,
        wallpaper,
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconGen icon = $AssetsIconGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
