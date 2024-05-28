import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:untitled1/ads/domain/enums/BannerSizeConst.dart';

class CustomAdsSize {
  static AdSize getBannerSize(BannerSizeConst size) {
    if (size == BannerSizeConst.banner) {
      return const AdSize(width: 320, height: 50);
    } else if (size == BannerSizeConst.largeBanner) {
      return const AdSize(width: 320, height: 100);
    } else if (size == BannerSizeConst.mediumRectangular) {
      return const AdSize(width: 320, height: 250);
    } else if (size == BannerSizeConst.fullBanner) {
      return const AdSize(width: 468, height: 60);
    } else if (size == BannerSizeConst.leaderboard) {
      return const AdSize(width: 728, height: 90);
    }
    return const AdSize(width: 320, height: 50);
  }
}
