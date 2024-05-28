import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:untitled1/ads/domain/models/ads/google_ads_helper_impl.dart';
import 'package:untitled1/ads/presentation/widgets/native_ad_skeleton.dart';

class CustomNativeADWidget extends StatefulWidget {
  final AdSize size;

  const CustomNativeADWidget({Key? key, required this.size}) : super(key: key);

  @override
  State<CustomNativeADWidget> createState() => _CustomNativeADWidgetState();
}

class _CustomNativeADWidgetState extends State<CustomNativeADWidget> {
  late NativeAd nativeAd;

  final _adsHelper = Get.put(AdsHelperImpl());

  bool isLoaded = false;
  @override
  void initState() {
    _adsHelper.loadNativeAd(
        size: widget.size,
        callback: (ad) {
          setState(() {
            if (mounted) {
              isLoaded = true;
              nativeAd = ad;
            }
          });
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _adsHelper.adsEnabled
        ? isLoaded
            ? Container(
                color: Colors.grey,
                height: 310,
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: AdWidget(
                    ad: nativeAd,
                  ),
                ),
              )
            : SizedBox(
                height: 310,
                width: Get.width,
                child: const NativeAdSkeleton(),
              )
        : const SizedBox(height: 310);
  }
}
