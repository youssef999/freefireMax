
import 'package:admob_flutter/admob_flutter.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:freefiremax/two.dart';
import 'package:freefiremax/weapons.dart';
import 'admob.dart';
import 'adsManger.dart';
import 'char.dart';
import 'diamond.dart';
import 'vichle.dart';


const  String testDevice = 'Mobile_id';
Customadmob myCustomadmob=Customadmob();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-1624423845873434~9223870205');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _nativeAd=NativeAdmobController();
  AdmobBannerSize bannerSize;
  AdmobInterstitial intersitialAd;

  @override
  void initState() {
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
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
        anchorType: AnchorType.bottom,
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(41, 30, 83, 1),

      body: Container(
        margin: EdgeInsets.all(28),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Container(
                width:180,
                height:56,
                child:NativeAdmob(
                  adUnitID:AdsManger.nativeAdunit,
                  numberAds:3,
                  controller: _nativeAd,
                  type:NativeAdmobType.banner,
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height:5
                ),
                Text(
                  'Welcome to Free Fire Max Guide',
                  style:TextStyle(color:Colors.red,fontSize:18,fontWeight:FontWeight.w500),
                ),
                    Icon(
                      Icons.auto_awesome,
                      color: Colors.orange,
                      size: 30,
                    ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                children: [
                  Center(
                    child: Container(
                      height:80,
                      child: Image.asset('assets/ff5.png'),
                    ),
                  )
                ],
              ),
            ),
          
          
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Transform(
                    transform: Matrix4.skewY(-0.05),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      height: 110,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black,
                            Colors.deepOrange[300]
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tips and Tricks ',
                          style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),
                        ),
                        Text(
                          'Find out how to become the best ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          'Free Fire player with these tips',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w300),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, right: 15, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /*  CircularPercentIndicator(
                                radius: 55.0,
                                lineWidth: 6.0,
                                animation: true,
                                percent: 0.2,
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Colors.black87,
                              ),

                             */
                              InkWell(
                                child: Transform(
                                  transform: Matrix4.skewX(-0.05),
                                  origin: Offset(50.0, 50.0),
                                  child: Material(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30,
                                          right: 30,
                                          top: 10,
                                          bottom: 10),
                                      child: InkWell(
                                        child: Text(
                                          'See Tips and Tricks',
                                          style: TextStyle(
                                              color: Colors.red.shade600,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),


                                      ),
                                    ),
                                  ),
                                ),
                                onTap:(){

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return two();
                                      }));
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 80,
                    left: 220,
                    child: Image(
                      image: AssetImage('assets/ffx.png'),
                      height: 73,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Transform(
                    transform: Matrix4.skewY(-0.05),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      height: 110,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.red,
                            Colors.black,
                            //  Color.fromRGBO(209, 4, 43, 1),
                            //  Color.fromRGBO(214, 61, 99, 1),
                            //Color.fromRGBO(209, 4, 43, 1),
                            // Color.fromRGBO(214, 61, 99, 1),
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Characters',
                          style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),
                        ),
                        Text(
                          'Qualities of each Characters ' ,style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w300),),
                             Text( 'to choose the best for you ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w300),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 15, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /*  CircularPercentIndicator(
                                radius: 55.0,
                                lineWidth: 6.0,
                                animation: true,
                                percent: 0.2,
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Colors.black87,
                              ),

                             */
                              InkWell(
                                child: Transform(
                                  transform: Matrix4.skewX(-0.05),
                                  origin: Offset(50.0, 50.0),
                                  child: Material(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30,
                                          right: 30,
                                          top: 10,
                                          bottom: 10),
                                      child: InkWell(
                                        child: Text(
                                          'See Characters ',
                                          style: TextStyle(
                                              color: Colors.red.shade600,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),

                                      ),
                                    ),
                                  ),
                                ),
                                onTap:(){
                                 // showInterstialAd() .. load()..show();
                  showInterstialAd(); 
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                       return char();
                                      }));
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 70,
                    left: 185,
                    child: Image(
                      image: AssetImage('assets/ff4.png'),
                      height: 72,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Transform(
                    transform: Matrix4.skewY(-0.05),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 110,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black87,
                            Colors.black45,
                            //Color.fromRGBO(209, 4, 43, 1),
                            // Color.fromRGBO(214, 61, 99, 1),
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Weapons',
                          style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),
                        ),
                        Text(
                          'The information you did ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          'not know about',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          'the best Free Fire Max Weapons',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w300),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 15, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /*  CircularPercentIndicator(
                                radius: 55.0,
                                lineWidth: 6.0,
                                animation: true,
                                percent: 0.2,
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Colors.black87,
                              ),

                             */
                              Transform(
                                transform: Matrix4.skewX(-0.05),
                                origin: Offset(50.0, 50.0),
                                child: Material(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30,
                                        right: 30,
                                        top: 10,
                                        bottom: 10),
                                    child: InkWell(
                                      child: Text(
                                       'See Weapons',
                                        style: TextStyle(
                                            color: Colors.red.shade600,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onTap:(){
                                        showInterstialAd();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) {
                                            return weapons();
                                            }));
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 92,
                    left: 195,
                    child: Image(
                      image: AssetImage('assets/ff10.jfif'),
                      height: 55,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Transform(
                    transform: Matrix4.skewY(-0.05),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 110,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.pink,
                            Colors.purple,
                            //Color.fromRGBO(209, 4, 43, 1),
                            // Color.fromRGBO(214, 61, 99, 1),
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Diamonds',
                          style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),
                        ),
                        Text(
                          'Find out what the method',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          'are for winning gold and',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          'diamonds, and how to spend them',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w300),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 15, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /*  CircularPercentIndicator(
                                radius: 55.0,
                                lineWidth: 6.0,
                                animation: true,
                                percent: 0.2,
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Colors.black87,
                              ),

                             */
                              Transform(
                                transform: Matrix4.skewX(-0.05),
                                origin: Offset(50.0, 50.0),
                                child: Material(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30,
                                        right: 30,
                                        top: 10,
                                        bottom: 10),
                                    child: InkWell(
                                      child: Text(
                                        'See Diamonds',
                                        style: TextStyle(
                                            color: Colors.red.shade600,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onTap:(){
                                      //  showInterstialAd() .. load()..show();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) {
                                               return d1();
                                            }));
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 90,
                    left: 195,
                    child: Image(
                      image: AssetImage('assets/ff20.png'),
                      height: 80,
                    ),
                  ),
                ],
              ),
            ),



            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Transform(
                    transform: Matrix4.skewY(-0.05),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      height: 110,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.brown,
                            Colors.black12,
                            //  Color.fromRGBO(209, 4, 43, 1),
                            //  Color.fromRGBO(214, 61, 99, 1),
                            //Color.fromRGBO(209, 4, 43, 1),
                            // Color.fromRGBO(214, 61, 99, 1),
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Vehicles',
                          style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),
                        ),
                        Text(
                          'Know the Vehicles available in' ,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          'Free Fire and when to use each one',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w300),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 15, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /*  CircularPercentIndicator(
                                radius: 55.0,
                                lineWidth: 6.0,
                                animation: true,
                                percent: 0.2,
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Colors.black87,
                              ),

                             */
                              InkWell(
                                child: Transform(
                                  transform: Matrix4.skewX(-0.05),
                                  origin: Offset(50.0, 50.0),
                                  child: Material(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30,
                                          right: 30,
                                          top: 10,
                                          bottom: 10),
                                      child: InkWell(
                                        child: Text(
                                          'See Vehicles',
                                          style: TextStyle(
                                              color: Colors.red.shade600,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),

                                      ),
                                    ),
                                  ),
                                ),
                                onTap:(){

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                          return v1();
                                      }));
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 70,
                    left: 220,
                    child: Image(
                      image: AssetImage('assets/ff21.jfif'),
                      height: 70,
                    ),
                  ),
                ],
              ),
            ),


          Container(
                child:AdmobBanner(
                  adUnitId:AdsManger.BannerAdUnitIdEX,
                  adSize:AdmobBannerSize.SMART_BANNER(context),
                )
            ),


          ],
        ),
      ),
    );
  }
}