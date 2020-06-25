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
      return 'ca-app-pub-3169721157368527/4788378046';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-3169721157368527/4788378046';
    }
    return null;
  }
  String getInterstitialAdId() {
    if (Platform.isIOS) {
//      return '';
      return 'ca-app-pub-3169721157368527/4037924227';
    } else if (Platform.isAndroid) {
//      return '';
      return "ca-app-pub-3169721157368527/4037924227";
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