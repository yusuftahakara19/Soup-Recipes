import 'package:firebase_admob/firebase_admob.dart';

class AdmobIslemleri {
  static final String appIDCanli = "ca-app-pub-7966436595180768~4995846629";
  static final String appIDTest = FirebaseAdMob.testAppId;
  static final String banner1Canli = "ca-app-pub-7966436595180768/6496824079";
  static final String gecis1Canli = "ca-app-pub-7966436595180768/6686194630";
  static int kacKereBasildi = 0;

  static int kacKereGosterildi = 1;
  static admobInitialize() {
    FirebaseAdMob.instance.initialize(appId: appIDTest);
  }

  static final MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>[
      'Çorba Tarifleri',
      'Çorba',
      'İnternetsiz Çorba Tarifleri',
      'Bebekler için çorba tarifleri'
    ],
    childDirected: false,
    testDevices: <String>[], // Android emulators are considered test devices
  );

  static BannerAd buildBannerAd() {
    return BannerAd(
      adUnitId: "ca-app-pub-7966436595180768/6496824079",
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event is $event");
      },
    );
  }

  static InterstitialAd buildInterstitialAd() {
    return InterstitialAd(
      adUnitId: "ca-app-pub-7966436595180768/6686194630",
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event is $event");
      },
    );
  }
}
