import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:untitled1/ads/domain/constants/ads_key.dart';

class AdsId {
  static String bannerAdUnitId() {
    if (Platform.isAndroid) {
      return kDebugMode || kProfileMode
          ? AdKey.debugBannerAdUnitId
          : AdKey.androidBannerAdUnitId;
    } else if (Platform.isIOS) {
      return kDebugMode || kProfileMode
          ? AdKey.debugBannerAdUnitId
          : AdKey.iosBannerAdUnitId;
    } else {
      throw UnimplementedError('Platform not supported');
    }
  }

  static String interstitialAdUnitId() {
    if (Platform.isAndroid) {
      return kDebugMode || kProfileMode
          ? AdKey.debugInterstitialAdUnitId
          : AdKey.androidInterstitialAdUnitId;
    } else if (Platform.isIOS) {
      return kDebugMode || kProfileMode
          ? AdKey.debugInterstitialAdUnitId
          : AdKey.iosInterstitialAdUnitId;
    } else {
      throw UnimplementedError('Platform not supported');
    }
  }

  static String nativeAdUnitId() {
    if (Platform.isAndroid) {
      return kDebugMode || kProfileMode
          ? AdKey.debugNativeAdUnitId
          : AdKey.androidNativeAdUnitId;
    } else if (Platform.isIOS) {
      return kDebugMode || kProfileMode
          ? AdKey.debugNativeAdUnitId
          : AdKey.iosNativeAdUnitId;
    } else {
      throw UnimplementedError('Platform not supported');
    }
  }

  static String openAppAdUnitId() {
    if (Platform.isAndroid) {
      return kDebugMode || kProfileMode
          ? AdKey.debugOpenAppAdUnitId
          : AdKey.androidOpenAppAdUnitId;
    } else if (Platform.isIOS) {
      return kDebugMode || kProfileMode
          ? AdKey.debugOpenAppAdUnitId
          : AdKey.iosOpenAppAdUnitId;
    } else {
      throw UnimplementedError('Platform not supported');
    }
  }
}
