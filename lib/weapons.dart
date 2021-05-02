
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';

import 'admob.dart';
import 'adsManger.dart';

class weapons extends StatefulWidget {

  @override
  _weaponsState createState() => _weaponsState();
}

class _weaponsState extends State<weapons> {
  String img;

  String txt;
  final _nativeAd=NativeAdmobController();

  AdmobBannerSize bannerSize;

  AdmobInterstitial intersitialAd;
  String testDevice = 'Mobile_id';
  Customadmob myCustomadmob=Customadmob();

  @override
  void initState() {
    showInterstialAd();
    super.initState();
    intersitialAd =AdmobInterstitial(adUnitId: AdsManger.interstitialAd,
        listener:(AdmobAdEvent event , Map<String, dynamic> args ){
          if(event==AdmobAdEvent.closed) intersitialAd.load();
        } );
    intersitialAd.load();
    _nativeAd.reloadAd(forceRefresh:true);
  }

  @override
  void dispose() {
    intersitialAd.dispose();
    _nativeAd.dispose();
    super.dispose();

  }
  showInterstialAd(){
    myCustomadmob.interstitialAd()
      ..load()
      ..show(
       // anchorType: AnchorType.bottom,
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
      );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:7,

      child: Scaffold(
        backgroundColor:Colors.black,
        appBar:AppBar(
          backgroundColor:Colors.black,
          title:Center(child: Text("Weapons",style:TextStyle(color:Colors.white,fontSize:25,fontWeight:FontWeight.w900),)),
          bottom:TabBar(
              indicatorWeight:7,
              isScrollable:true,
              tabs:<Widget>[
                Tab(text:'AN94'),
                Tab(text:'M4A1'),
                Tab(text:'M14'),
                Tab(text:'AK'),
                Tab(text:'SCAR'),
                Tab(text:'GROZA'),
                Tab(text:'FAMAS'),

              ]),
        ),
        body:TabBarView(
          children:<Widget> [

            _buildWithName('AN94'),
            _buildWithName('M4A1'),
            _buildWithName('M14'),
            _buildWithName('AK'),
            _buildWithName('SCAR'),
            _buildWithName('GROZA'),
            _buildWithName('FAMAS'),

          ],
        ),
      ),
    );
  }

  ListView _buildWithName(String s) {
    if(s=='AN94'){
      txt='AN94';
      img='assets/s7.jfif';

    }
    if(s=='M4A1'){
      txt='M4A1';
      img='assets/s6.jfif';

    }
    if(s=='M14'){
      txt='M14';
      img='assets/s5.jfif';

    }
    if(s=='AK'){
      txt='AK';
      img='assets/s4.jfif';

    }

    if(s=='SCAR'){
      txt='SCAR';
      img='assets/s3.jfif';
    }

    if(s=='GROZA'){
      txt='GROZA';
      img='assets/s2.jfif';

    }
    if(s=='FAMAS'){
      txt='FAMAS';
      img='assets/s1.jfif';

    }
    return ListView(

        children: <Widget>[
          Container(
              width:200,
              height:60,
              child:NativeAdmob(
                adUnitID:AdsManger.nativeAdunit,
                numberAds:3,
                controller: _nativeAd,
                type:NativeAdmobType.banner,
              )
          ),
          Column(
            children: <Widget>[

              SizedBox(
                height:10,
              ),
              Container(
                child:  Text(txt,style:TextStyle(color:Colors.white,fontSize:22,fontWeight:FontWeight.w900),),
              ),
              SizedBox(
                height:10,
              ),
                Image.asset(img),

            ],
          )
        ]);
  }}
