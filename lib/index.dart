import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
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
