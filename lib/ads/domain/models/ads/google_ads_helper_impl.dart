import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:untitled1/ads/domain/models/ads/ads_id.dart';
import 'package:untitled1/ads/domain/models/ads/google_ads_helper.dart';

class AdsHelperImpl extends GoogleAdsHelper {
  @override
  bool get adsEnabled => true;

  static Future<InitializationStatus> initGoogleMobileAds() async {
    return await MobileAds.instance.initialize();
  }

  AdsHelperImpl() {
    log("Called ----------------1");
  }

  static final instance = AdsHelperImpl._();

  AdsHelperImpl._();

  static InterstitialAd? _interstitialAd;

  static AppOpenAd? _appOpenAd;

  void listenToAppStateChanges() {
    AppStateEventNotifier.startListening();
    AppStateEventNotifier.appStateStream
        .forEach((state) => _onAppStateChanged(state));
  }

  void _onAppStateChanged(AppState appState) {
    if (appState == AppState.foreground) {
      if (_appOpenAd != null) {
        showAppOpenAd();
      } else {
        loadAppOpenAd();
      }
    } else {
      loadAppOpenAd();
    }
  }

  /// [Load App Open Ad]
  @override
  void loadAppOpenAd() {
    AppOpenAd.load(
      adUnitId: AdsId.openAppAdUnitId(),
      orientation: AppOpenAd.orientationPortrait,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          _appOpenAd = ad;
        },
        onAdFailedToLoad: (error) {
          // Handle the error.
        },
      ),
    );
  }

  /// [Show App Open Ad]
  @override
  Future<void> showAppOpenAd() async {
    if (_appOpenAd == null) {
      loadAppOpenAd();
      return;
    }

    /// Set the fullScreenContentCallback and show the ad.
    _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {},
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        _appOpenAd = null;
      },
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        _appOpenAd = null;
        loadAppOpenAd();
      },
    );
    await _appOpenAd?.show();
  }

  /// [Load Banner Ad]
  @override
  Future<void> loadBannerAd({
    required AdSize size,
    required Function(BannerAd bannerAd) callBack,
  }) async {
    final AnchoredAdaptiveBannerAdSize? adSize =
        await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
            Get.width.truncate());
    final bannerAd = BannerAd(
      adUnitId: AdsId.bannerAdUnitId(),
      request: const AdRequest(),
      size: adSize ?? size,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          callBack(ad as BannerAd);
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
      ),
    );
    bannerAd.load();
  }

  /// [Load Interstitial Ad]
  @override
  void loadInterstitialAd() {
    InterstitialAd.load(
        adUnitId: AdsId.interstitialAdUnitId(),
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            _interstitialAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {},
        ));
  }

  /// [Show interstitial ad]
  @override
  Future<void> showInterstitialAd({VoidCallback? callback}) async {
    try {
      if (_interstitialAd == null) {
        return;
      }
      _interstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          if (callback != null) {
            callback();
          }
          loadInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
        },
      );
      await _interstitialAd?.show();
      _interstitialAd = null;
    } catch (_) {
      if (callback != null) {
        callback();
      }
    } finally {}
  }

  @override
  Future<void> loadNativeAd({
    required AdSize size,
    required Function(NativeAd nativeAd) callback,
  }) async {
    NativeAd? nativeAd;
    nativeAd = NativeAd(
      adUnitId: AdsId.nativeAdUnitId(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          nativeAd = ad as NativeAd;
          if (nativeAd != null) {
            callback(nativeAd!);
          }
        },
        onAdFailedToLoad: (ad, error) {
          // Dispose the ad here to free resources.
          debugPrint('$NativeAd failed to load: $error');
          ad.dispose();
        },
      ),
      request: const AdRequest(),
      // Styling
      nativeTemplateStyle: NativeTemplateStyle(
        // Required: Choose a template.
        templateType: TemplateType.medium,
        // Optional: Customize the ad's style.
        mainBackgroundColor: Colors.grey,
        cornerRadius: 10.0,
        callToActionTextStyle: NativeTemplateTextStyle(
          textColor: Colors.cyan,
          backgroundColor: Colors.red,
          style: NativeTemplateFontStyle.monospace,
          size: 16.0,
        ),
        primaryTextStyle: NativeTemplateTextStyle(
            textColor: Colors.red,
            backgroundColor: Colors.cyan,
            style: NativeTemplateFontStyle.italic,
            size: 16.0),
        secondaryTextStyle: NativeTemplateTextStyle(
            textColor: Colors.green,
            backgroundColor: Colors.black,
            style: NativeTemplateFontStyle.bold,
            size: 16.0),
        tertiaryTextStyle: NativeTemplateTextStyle(
            textColor: Colors.brown,
            backgroundColor: Colors.amber,
            style: NativeTemplateFontStyle.normal,
            size: 16.0),
      ),
    )..load();
  }

  @override
  Future<void> loadAdaptiveBannerAd(
      Function(BannerAd bannerAd) bannerAdCallBack) {
    throw UnimplementedError();
  }
}
