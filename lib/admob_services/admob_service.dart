import 'dart:io';

import 'package:firebase_admob/firebase_admob.dart';

class AdMobService {

  String getAdMobAppId() {
    if (Platform.isIOS) {
      return 'ca-app-pub-3169721157368527~2541009725';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-3169721157368527~2541009725';
    }
    return null;
  }

  String getBannerAdId() {
    if (Platform.isIOS) {
      return 'xxx';
    } else if (Platform.isAndroid) {
      return 'xxx';
    }
    return null;
  }
  String getInterstitialAdId() {
    if (Platform.isIOS) {
//      return '';
      return 'xxx';
    } else if (Platform.isAndroid) {
//      return '';
      return 'xxx';
    }
    return null;
  }
  InterstitialAd getNewTapInterstitial() {
    return InterstitialAd(
      adUnitId: getInterstitialAdId(),
      listener: (MobileAdEvent event) {
        print("InterstitialAd event is $event");
      },
    );
  }


}