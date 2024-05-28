import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

abstract class GoogleAdsHelper extends GetxController {
  bool get adsEnabled;

  void loadAppOpenAd();

  Future<void> showAppOpenAd();

  void loadInterstitialAd();

  Future<void> showInterstitialAd({VoidCallback? callback});

  Future<void> loadBannerAd({
    required AdSize size,
    required Function(BannerAd bannerAd) callBack,
  });

  Future<void> loadAdaptiveBannerAd(
      Function(BannerAd bannerAd) bannerAdCallBack);

  Future<void> loadNativeAd({
    required AdSize size,
    required Function(NativeAd nativeAd) callback,
  });
}
