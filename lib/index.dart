import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:identify_mobile_number_operator/ad_helper.dart';
import 'package:url_launcher/url_launcher.dart';

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
        backgroundColor: Colors.purple,
        title: const Text("Identify Your Mobile Number provider"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 80.0,
          padding: EdgeInsets.only(
            bottom: bottomNavAd.isBottomNavBannerAdLoaded ? 60.0 : 10.0,
            top: 10.0,
            left: 10.0,
            right: 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 45.0,
                        margin: const EdgeInsets.only(right: 10.0),
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: TextField(
                          cursorColor: Colors.purple,
                          keyboardType: TextInputType.number,
                          controller: _searchInputController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter your mobile number here...",
                          ),
                          onChanged: (val) => _checkInputVal(val),
                          onSubmitted: (val) => _checkInputVal(val),
                          onEditingComplete: () =>
                              _checkInputVal(_searchInputController.text),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Material(
                        color: Colors.purple,
                        child: IconButton(
                          onPressed: () =>
                              _checkInputVal(_searchInputController.text),
                          splashColor: Colors.purple.withOpacity(0.5),
                          icon: const Icon(
                            Icons.search_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "Your Mobile Number Belong to: $provider",
                  style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              bodyAd.isBodyBannerAdLoaded
                  ? StatefulBuilder(
                      builder: (context, setState) {
                        return SizedBox(
                          width: bodyAd.bodyBannerAd.size.width.toDouble(),
                          height: bodyAd.bodyBannerAd.size.height.toDouble(),
                          child: AdWidget(ad: bodyAd.bodyBannerAd),
                        );
                      },
                    )
                  : const SizedBox(),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Click on any Image Below to Know your Mobile Number:",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (Map<String, String> i in _imgName)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: InkWell(
                        onTap: () => _knowMyNumber(i['ussd'] as String),
                        child: Image(
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.cover,
                          image: AssetImage("assets/imgs/${i['img']}"),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
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

// NB: Due to the mobile number portability introduced in 2013 in Nigeria, a person can also port their numbers from any of the said providers to another, so the list does not guarantee that all names using the above prefixes must be fixated to the same networks as listed.

//================================================================
//
//================================================================
String provider = '';
TextEditingController _searchInputController = TextEditingController();
List<Map<String, String>> _imgName = [
  {'img': 'mtn.png', 'ussd': '*663#'},
  {'img': 'glo.png', 'ussd': '*135*8#'},
  {'img': 'airtel.png', 'ussd': '*121*3*4#'},
  {'img': '9mobile.png', 'ussd': '*248#'},
  {'img': 'ntel.png', 'ussd': ''}
];

//================================================================
// TEXT INPUT AND SEARCH BTN FUNCTION
//================================================================
_checkInputVal(String val) {
  print(val);
}

//================================================================
// CLICK TO DIAL FUNCTION (URL LUNCHER)
//================================================================
_knowMyNumber(String val) {
  final Uri launchUri = Uri(scheme: 'tel', path: val);
  canLaunchUrl(launchUri).then((bool result) async {
    if (result) await launchUrl(launchUri);
  });
}
