import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:untitled1/ads/domain/models/ads/google_ads_helper_impl.dart';
import 'package:untitled1/ads/presentation/widgets/banner_ad_skeleton.dart';

class CustomBannerADWidget extends StatefulWidget {
  final AdSize size;

  const CustomBannerADWidget({Key? key, required this.size}) : super(key: key);

  @override
  State<CustomBannerADWidget> createState() => _CustomBannerADWidgetState();
}

class _CustomBannerADWidgetState extends State<CustomBannerADWidget> {
  late BannerAd bannerAd;

  final _adsHelper = Get.put(AdsHelperImpl());

  bool isLoaded = false;
  @override
  void initState() {
    _adsHelper.loadBannerAd(
        size: widget.size,
        callBack: (ad) {
          setState(() {
            if (mounted) {
              isLoaded = true;
              bannerAd = ad;
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
                color: Colors.grey.withOpacity(0.4),
                height: 60,
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: AdWidget(
                    ad: bannerAd,
                  ),
                ),
              )
            : SizedBox(
                height: 60,
                width: Get.width,
                child: const BannerAdSkeleton(),
              )
        : const SizedBox();
  }
}
