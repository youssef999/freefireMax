
  import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'admob.dart';
import 'adsManger.dart';

class char extends StatefulWidget {

  @override
  _charState createState() => _charState();
}

class _charState extends State<char> {
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
        //  anchorType: AnchorType.bottom,
          anchorOffset: 0.0,
          horizontalCenterOffset: 0.0,
        );
    }

   @override
   Widget build(BuildContext context) {
     return DefaultTabController(
       length:15,
       child: Scaffold(
         backgroundColor:Colors.black12,
         appBar:AppBar(
           title:Center(child: Text('CHARACTERS FF Max',style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),)),
           backgroundColor:Colors.red,
           bottom:TabBar(
              indicatorWeight:7,
               isScrollable:true,
               tabs:<Widget>[
                Tab(text:'HAYATO'),
                Tab(text:'MOCO'),
                 Tab(text:'WUKONG'),
                 Tab(text:'ANTONIO'),
                 Tab(text:'ANDREW'),
                 Tab(text:'KELLY'),
                 Tab(text:'OLIVIA'),
                 Tab(text:'FORD'),
                 Tab(text:'NIKITA'),
                 Tab(text:'MISHA'),
                 Tab(text:'MAXIM'),
                 Tab(text:'KLA'),
                 Tab(text:'PALOMA'),
                 Tab(text:'MIGUEL'),
                 Tab(text:'CAROLINE'),
           ]),
         ),
         body:TabBarView(
             children:<Widget> [

               _buildWithName('HAYATO'),
               _buildWithName('MOCO'),
               _buildWithName('WUKONG'),
               _buildWithName('ANTONIO'),
               _buildWithName('ANDREW'),
               _buildWithName('KELLY'),
               _buildWithName('OLIVIA'),
               _buildWithName('FORD'),
               _buildWithName('NIKITA'),
               _buildWithName('MISHA'),
               _buildWithName('MAXIM'),
               _buildWithName('KLA'),
               _buildWithName('PALOMA'),
               _buildWithName('MIGUEL'),
               _buildWithName('CAROLINE'),
             ],
         ),
       ),
     );
   }

 ListView _buildWithName(String s) {
     if(s=='HAYATO'){
       img='assets/h1.png';
       txt='HAYATO';
       txt2='Special ability : the less life he has, the more armor he will penetrate with his attacks. price:1999 diamonds(only in package for the moment';
       txt3='Shimada Hayato comes from an old Samurai family. He has a deep sense of honor and proudly carries the blood of his family , with its traditions but also curses. He is willing to do anything to protect his greatest secret, and , to do so,he uses the katana ,whoever his opponent is';
       txt4='this Character is tremendously useful for lovers of duels . if you try to have weapons with large magazines , in a long exchange you will end up doing more damage than your opponent , even if you have the same weapon';
     }
     if(s=='MOCO'){
       img='assets/m1.jpg';
       txt='MOCO';
       txt2='Special Ability:For a few Seconds , let your teammates see where the enemies you have shot are , price : 499 diamonds';
       txt3='Moco is one of the best hackers , known as an internet legend . she is Skillful '+
           'very intelligent , and able to get information from any where without leaving a trace - a ghost of networks !';
       txt4='if you like to play with Others , like Character helps alot in the task of ambushing enemies ,thanks to the tag or identification of enemies with their ability';
     }
     if(s=='WUKONG'){
       img='assets/w1.jpg';
       txt='WUKONG';
       txt2='Special Ability: becomes a bush, with a recharge time of several minutes.';
       txt3='Price: 499 diamonds. ';
       txt4='WUKONG is like a human who looks like a monkey. Or a monkey that looks like a human. We do not know, because he is such a mysterious character that nobody knows his past or his age. This character is good for those who want to play with a more passive style, always hidden and ready to give a death scare to an enemy who passes in front. The shotgun is your best friend!';
     }
     if(s=='ANTONIO'){
       img='assets/ant.jfif';
       txt='ANTONIO ';
       txt2='Special Ability: The game begins with more life than the rest of the characters.';
       txt3='Price: 499 diamonds. ';
       txt4='Antonio is an orphan who created his own street gang. He grew up as a gangster and in seven years managed to get rid of all his rivals. If anyone thinks of threatening his family, let him prepare himself: he will do everything possible to protect them, even if it puts his life at risk. This character is the best if we want to have the advantage in the first encounters. His increased initial life translates into more durability at the beginning of the game.';
     }
     if(s=='ANDREW'){
       img='assets/an1.jpg';
       txt='ANDREW';
       txt2='Special Ability: bulletproof vests aremore resistant, so playing with Andrew takes longer to break.';
       txt3='Price: 1000 coins (Andrew is a freecharacter if you log in from the mainmenu).';
       txt4='Andrew is a former policeman who spent much of his life chasing criminals to jail. Thanks to his experience, he became an expert in survival and armed combat In addition, Andrew is extremely resistant to injuryA useful character for those of us looking for a defensive rather than an aggressive style.';
     }
     if(s=='KELLY'){
       img='assets/k1.jpg';
       txt='KELLY';
       txt2= ' Special Ability: Kelly is sprint is faster than normal, allowing us to reach enemies, catch the loot before others or escape dangers';
      txt3='Price: 2000 coins or 399 diamonds. ';
      txt4='Kelly is real name is Shimada Kiriko. She is a teenager, still a student. She is an elite athlete who does not stop training on the athletics track or at the academy, making her the fastest character in Free Fire. Playing as Kelly will be the best option if we want to get to sites before others or have an advantage in any chase on foot.';
     }
     if(s=='OLIVIA'){
       img='assets/oli.jfif';
       txt='OLIVIA';
       txt2='Special Ability: companions receive more life by being revived by Olivia.';
       txt3='Price: 2000 coins or 399 diamonds. ';
       txt4='A nurse by profession, Olivia is a specialist in caring for others. She always says that helping people is what makes her happiest, whether they are friends or enemies, regardless of whether it is a danger to her.  She is a good character for the Duo and Squad modes, as she is able to heal teammates quickly and efficiently. However, if we choose her for Solo mode, it will be like playing with eve and  Adam, because it does not give us any personal advantage.';
     }
     if(s=='FORD'){
       img='assets/f1.jpg';
       txt='FORD';
       txt2='Special Ability: the damage received inside the radioactive zone is less with Ford than with other characters. ';
       txt3='Price: 2000 coins or 399 diamonds. ';
       txt4='Ford was a sailor. The harsh life of the oceans increased their resistance and will to survive. He is the most mysterious character, whose secrets he does not want to reveal. This man is a good choice if we want to land in the most extreme places of the map and explore with tranquility. It is also useful to hide in the radioactive zone, for a short time, and surprise our adversary with an ambush, but watch your health!';
     }
     if(s=='NIKITA'){
       img='assets/n1.png';
       txt='NIKITA';
       txt2='Special Ability: Nikita has the ability to recharge sub-machine guns more quickly, a real advantage in a one-on-one situation. ';
     txt3='Price: 2500 coins or 499 diamonds. ';
     txt4='Nikita is the professional bodyguard of Carolyn, the daughter of the president of the Free Fire organization. She has learned to use different weapons since she was a child, becoming a champion in different competitions.  This woman is useful for those of us who want to make the most of a submachine gun is shooting cadence and magazine, but watch your ammunilion!';
     }

     if(s=='MISHA'){
       img='assets/mish.jfif';
       txt='MISHA';
       txt2='Special Ability: All vehicles driven by Misha reach a higher speed and receive less damage. ';
       txt3='Price: 8000 coins or 499 diamonds. ';
       txt4='Misha is a racing specialist, a very brave girl who loves speed and loves to leave all opponents under a cloud of dust. For her there are no curves, only straight roads. She is a suitable character for those of us who use vehicles frequently and are speed lovers. Hold on!';
     }
     if(s=='MAXIM'){
       img='assets/ff1.png';
       txt='MAXIM';
       txt2='Special Skill: Maxim takes less time to heal or eat a mushroom to earn EP points.';
       txt3='Price: 8000 coins or 499 diamonds. ';
       txt4='Maxim is a regular competitor in con-tests who eats more, plus a very funny and smiling gamer. He loves streaming while playing against players from all over the world. But do not be fooled: if you think that by being bigger than him you Are going to beat him in a food contest, you are wrong. Maxim is the best for those of us who base our game on stockpiling supplies.';
     }
     if(s=='KLA'){
       img='assets/kl1.png';
       txt='KLA';
       txt2='Special Ability: Kla is punches cause the most damage throughout the game, which is essential for the first few minutes of each game. ';
       txt3='Price: 8000 coins or 499 diamonds.';
       txt4='Kla is a lonely man and a very experienced Muay Thai wrestler. He disappeared for years until he wanted to reappear, although totally changed: he has decided to take revenge with his own hands. This man is the best for those of us who like to land in places full of players; however, beware of ending up surrounded by bullets!';
     }
     if(s=='PALOMA'){
       img='assets/pa1.jpg';
       txt='PALOMA';
       txt2='Special skill: to be able to carry more AR bullets, as not all of them will take up space in our inventory. ';
       txt3='Price: 8000 coins or 499 diamonds. ';
       txt4='Paloma is an arms dealer, as beautiful as she is deadly. Years ago she was a model woman that all girls idolized, until one day she wanted to become an expert in buying and selling weapons. If there is illegal business in one place, Paloma will be there to benefit in every possible way. For those of us who want to have an advantage in ammunition and la longer in shooting exchanges, there is no one better than Paloma.';

     }
     if(s=='MIGUEL'){
       img='assets/mi1.jpg';
       txt='MIGUEL';
       txt2='Special Ability: For each enemy eliminated, Miguel gets EP points, which the rest of the characters can only get by eating a mushroom.';
       txt3='Price: 8000 coins or 499 diamonds. ';
       txt4='Miguel is a very lethal and highly trained Special Forces soldier. He, along with the comrades of his battalion, has managed to bring justice against terrorists with great efficiency, throughout his career... until one day everything went wrong. Those of us who like to play aggressively and hunt down many, enemies, this is our character.';
     }
     if(s=='CAROLINE'){
       img='assets/ca1.jpg';
       txt='CAROLINE';
      txt2='Special ability: can move faster whencarrying a shotgun in hand.';
      txt3='Price: 499 diamonds.';
       txt4='Caroline is a very, very rich girl and spends her life surrounded by fans and numerous bodyguards. She is very close to her father and brother, and loves to do cosplay.This young woman, one of the lasmembers in the ranks of Free Fire  will be our best ally if we opt for close focombat and exploration of buildings';
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
             SizedBox(
               height:10,
             ),
             Container(
               child:  Text(txt,style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),),
             ),
            Container(
              height:300,
              width:400,
              child: Image.asset(img),
            ),


             SizedBox(
               height:10,
             ),
             Container(
               child:  Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text(txt2,style:TextStyle(color:Colors.white,fontSize:14,fontWeight:FontWeight.w400),),
               ),
             ),
             SizedBox(
               height:3,
             ),
             Container(
               child:  Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text(txt3,style:TextStyle(color:Colors.white,fontSize:14,fontWeight:FontWeight.w400),),
               ),
             ),
             SizedBox(
               height:3,
             ),
             Container(
               child:  Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text(txt4,style:TextStyle(color:Colors.white,fontSize:14,fontWeight:FontWeight.w400),),
               ),
             )

           ],
         )
       ]);
 }}
