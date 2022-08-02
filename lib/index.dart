import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:identify_mobile_number_operator/ad_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //===========================================
  // INITIALIZIN MY BODY & BOTTOM NAV BANNER AD
  //===========================================
  BodyBannerAd bodyAd = BodyBannerAd();
  BottomNavBannerAd bottomNavAd = BottomNavBannerAd();

  @override
  void initState() {
    super.initState();
    bodyAd.createBodyBannerAd(setState: () => setState(() {}));
    bottomNavAd.createBottomNavBannerAd(setState: () => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    bodyAd.bodyBannerAd.dispose();
    bottomNavAd.bottomNavBannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Identify Your Mobile Number provider"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavAd.isBottomNavBannerAdLoaded
          ? StatefulBuilder(
              builder: (context, setState) {
                return SizedBox(
                  width: bottomNavAd.bottomNavBannerAd.size.width.toDouble(),
                  height: bottomNavAd.bottomNavBannerAd.size.height.toDouble(),
                  child: AdWidget(ad: bottomNavAd.bottomNavBannerAd),
                );
              },
            )
          : null,
    );
  }
}

//==============================================================
// THE LIST THAT CONTAINS ALL MOBILE NETWORK PREFIX
//==============================================================
List<Map<String, Object>> mobileNetworkPrefix = [
  {
    "networkProvider": "NTEL",
    "prefix": ["0804"],
  },
  {
    "networkProvider": "SMILE",
    "prefix": ["0702"],
  },
  {
    "networkProvider": "ZOOM",
    "prefix": ["0707"],
  },
  {
    "networkProvider": "MULTILINKS",
    "prefix": ["07027", "0709"],
  },
  {
    "networkProvider": "STARCOMMS",
    "prefix": ["07028", "07029", "0819"],
  },
  {
    "networkProvider": "9Mobile",
    "prefix": ["0909", "0818", "0908", "0809", "0817"],
  },
  {
    "networkProvider": "GLO",
    "prefix": ["0905", "0805", "0705", "0815", "0807", "0811"],
  },
  {
    "networkProvider": "Airtel",
    "prefix": [
      "0901",
      "0808",
      "0907",
      "0812",
      "0708",
      "0701",
      "0902",
      "0802",
      "0904"
    ],
  },
  {
    "networkProvider": "MTN",
    "prefix": [
      "0806",
      "0803",
      "0704",
      "0706",
      "0906",
      "07025",
      "0814",
      "07026",
      "0810",
      "0813",
      "0816",
      "0903",
      "0703",
      "0913"
    ],
  },
];
