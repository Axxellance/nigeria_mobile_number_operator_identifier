import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

//======================================================
// SORT OUT THE BANNER ADD WE NEED FOR A SPECIFIC WIDGET
//======================================================
class AdHelper {
  //===================================================
  // BODY BANNAR AD UNIT ID
  //===================================================
  static String get bodyBannerAd {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/6300978111";
    } else {
      throw UnsupportedError('Unsupport Platform');
    }
  }

  //===================================================
  // BOTTOM NAV BANNAR AD UNIT ID
  //===================================================
  static String get bottomNavBannerAd {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/6300978111";
    } else {
      throw UnsupportedError('Unsupport Platform');
    }
  }
}

//===========================================
// LOAD BOTTOM  NAV BANNER AD
//===========================================
class BottomNavBannerAd {
  late BannerAd bottomNavBannerAd;
  bool isBottomNavBannerAdLoaded = false;

  createBottomNavBannerAd({required Function setState}) {
    bottomNavBannerAd = BannerAd(
      size: AdSize.banner,
      request: const AdRequest(),
      adUnitId: AdHelper.bottomNavBannerAd,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          isBottomNavBannerAdLoaded = true;
          setState();
        },
        onAdFailedToLoad: (ad, error) => bottomNavBannerAd.dispose(),
      ),
    );
    bottomNavBannerAd.load();
  }
}

//===========================================
// LOAD BOTTOM  NAV BANNER AD
//===========================================
class BodyBannerAd {
  late BannerAd bodyBannerAd;
  bool isBodyBannerAdLoaded = false;

  createBodyBannerAd({required Function setState}) {
    bodyBannerAd = BannerAd(
      size: AdSize.banner,
      request: const AdRequest(),
      adUnitId: AdHelper.bodyBannerAd,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          isBodyBannerAdLoaded = true;
          setState();
        },
        onAdFailedToLoad: (ad, error) => bodyBannerAd.dispose(),
      ),
    );
    bodyBannerAd.load();
  }
}
