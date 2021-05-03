
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'admob.dart';
import 'adsManger.dart';

class v1 extends StatefulWidget {
  @override
  _v1State createState() => _v1State();
}

class _v1State extends State<v1> {
  String img;
  String txt;
  String txt2;
  String txt3;
  String txt4;


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
        //anchorType: AnchorType.bottom,
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
      );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:7,

      child: Scaffold(
        backgroundColor:Colors.purple,
        appBar:AppBar(
          backgroundColor:Colors.black,
          title:Center(child: Text("Vehicles FF MAX",style:TextStyle(color:Colors.white,fontSize:25,fontWeight:FontWeight.w900),)),
          bottom:TabBar(
              indicatorWeight:7,
              isScrollable:true,
              tabs:<Widget>[
                Tab(text:'SPORTS CAR'),
                Tab(text:'MONSTER TRUCK'),
                Tab(text:'MOTORCYCLE'),
                Tab(text:'AMPHIBIAN'),
                Tab(text:'MILITARY JEEP'),
                Tab(text:'TUK TUK'),
                Tab(text:'VAN'),

              ]),
        ),
        body:TabBarView(
          children:<Widget> [

            _buildWithName('SPORTS CAR'),
            _buildWithName('MONSTER TRUCK'),
            _buildWithName('MOTORCYCLE'),
            _buildWithName('AMPHIBIAN'),
            _buildWithName('MILITARY JEEP'),
            _buildWithName('TUK TUK'),
            _buildWithName('VAN'),

          ],
        ),
      ),
    );
  }

  ListView _buildWithName(String s) {
    if(s=='SPORTS CAR'){
      txt='SPORTS CAR';
      img='assets/car.jfif';
      txt2='this car has a very clear advantage over the rest : it is the fastest vehicle in Free FIRE . IT IS true that it can not withstand as many blows as others , but the top speed at which it reaches attracts all players who are speed lovers';
      txt3='Do not heistate to drive one of these cars as soon as you find one , especially if you are away from the safe zoon. if you find this car you will be able to explore with peace of mind , knowing that in a matter of a minute you will be halfway across the map';
     txt4='Curious detail : as the sports car is very fast , if you hit a player who is on foot , he will fly away and will have extra damage from the fall';
    }
    if(s=='MONSTER TRUCK'){
      txt='MONSTER TRUCK';
      img='assets/truck.jfif';
      txt2='The Monster Truck is the biggest and tought vehicle . it is hard to destroy with gunshots and grenades , but the downside is that it is a bit slow . As it is immense , if you mange to reach an enemy with this vehicle , it is usual to eliminate it from a single charge';
      txt3='One thing to keep in mind is that you will almost certainly never find this 4x4 at the beginning of the game . As a general rule , Monster Truck will only appear at a few points on the map after being launched from an airplane . watch out for the skies';
      txt4='';
    }
    if(s=='MOTORCYCLE'){

      img='assets/moto.jfif';
      txt2='This motorcycle has a perfect combina_tion of speed and handling , which is why many players prefer it to other Vehicles . How ever ,it has the disadvantage of exposing the rider , so if you do not go fast , you will be an easy target to hit';
      txt3='the good news is that , because the motorcycle is small , it allows you to move more quickly and pass narrow places without a lot of problems';
    }
    if(s=='AMPHIBIAN'){
      txt='AMPHIBIAN';
      img='assets/amp.jfif';
      txt2='if you see this vehicle and you need to cross a river , do not even think about it : use this amphibian . Driven by the water , this four-wheeled bike gives you total movement versatility across both free Fire maps';
      txt3='As you might expect , it is often found near areas where there is a river nearby . if you want to explore on a small island or something like that , do it without fear , as you can return to the main terrain without being exposed on the connecting bridges ';
      txt4='Many are clever and wait on the other side of the bridge !  , Also as there is room for two people .. the best Vehicle to move freely in Duo mode !';
    }

    if(s=='MILITARY JEEP'){

      img='assets/jeep.jfif';
      txt2='This military is one of the most abundant vehicles on Free Fire Maps, but it is not very fast precisely.if you are driving up a steep hill ';
      txt3='you will notice that the jeep has a hard time overcoming the incline and , in fact , it is common for you to end up going downhill';
      txt4='Drive this Vehicle if there is no other option . it is true that the jeep can withstand a lot of shooting , especially if back of the jeep can get you out of more than one predicament';
    }

    if(s=='TUK TUK'){
      txt='TUK TUK';
      img='assets/tuktuk.jfif';
      txt2='The Tuk Tuk is a slow vehicle, weak and abundant in which areas. Never use it, unless you want to move quickly within the same village. ';
     txt3='Because it is a bit narrow, you can get between houses, so even if it sounds ridiculous, it is useful in chases. If you want to quickly plunder villages like the Bimasakti Strip, T7 with the Tuk Tuk is a good option.';
   txt4='';
    }
    if(s=='VAN'){
      txt='VAN';
      img='assets/van.jfif';
      txt2='The vans are the other vehicle that is very abundant on maps. It has some resistance, ';
      txt3='moderate speed and gives decent protection to the driver. It is a good option for getting to the town, if you do not need to go back to  the safe area immediately.';
      txt4='';
    }
    return ListView(

        children: <Widget>[
          Column(
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
              SizedBox(
                  height:5
              ),
              Image.asset(img),
              SizedBox(
                height:10,
              ),
              Container(
                child:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(txt2,style:TextStyle(color:Colors.white,fontSize:16,fontWeight:FontWeight.w400),),
                ),
              ),
              SizedBox(
                height:3,
              ),
              Container(
                child:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(txt3,style:TextStyle(color:Colors.white,fontSize:16,fontWeight:FontWeight.w400),),
                ),
              ),
              SizedBox(
                height:3,
              ),
              Container(
                child:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(txt4,style:TextStyle(color:Colors.white,fontSize:16,fontWeight:FontWeight.w400),),
                ),
              ),




            ],
          )
        ]);
  }}
