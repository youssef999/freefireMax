
import 'dart:io';
import 'package:admob_flutter/admob_flutter.dart';


class AdsManger{
   static bool _testmode=false;

   static String get appIdEx{
     if(Platform.isAndroid){
       return "ca-app-pub-1624423845873434~9223870205";
     }
     else if(Platform.isIOS){
       return"....";
     }
     else
       {
         throw new UnsupportedError("UNSUPPORTED PLATFORM");
       }
   }

   static String get BannerAdUnitIdEX{

      if(_testmode == true){
        return AdmobBanner.testAdUnitId;
      }
     else  if(Platform.isAndroid){
        return "ca-app-pub-1624423845873434/1030164340";
      }
      else if(Platform.isIOS){
        return"....";
      }
      else
      {
        throw new UnsupportedError("UNSUPPORTED PLATFORM");
      }
   }




   static String get nativeAdunit{

     if(_testmode == true){
       return "ca-app-pub-3940256099942544/2247696110";
         //NativeAdmob.testAdUnitId;
     }
     else  if(Platform.isAndroid){
       return "ca-app-pub-1624423845873434/3124477666";
     }
     else if(Platform.isIOS){
       return"....";
     }
     else
     {
       throw new UnsupportedError("UNSUPPORTED PLATFORM");
     }
   }

   static String get interstitialAd{

     if(_testmode == true){
       return AdmobBanner.testAdUnitId;
     }
     else  if(Platform.isAndroid){
       return "ca-app-pub-1624423845873434/8142367600";
     }
     else if(Platform.isIOS){
       return"....";
     }
     else
     {

       throw new UnsupportedError("UNSUPPORTED PLATFORM");

     }
   }


 }