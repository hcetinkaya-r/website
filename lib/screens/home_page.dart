import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:website/api/work_api.dart';
import 'package:website/models/work.dart';
import 'package:website/widgets/bottom_bar.dart';
import 'package:website/widgets/explore_drawer.dart';
import 'package:website/widgets/featured_heading.dart';
import 'package:website/widgets/featured_tiles.dart';
import 'package:website/widgets/floating_quick_access_bar.dart';
import 'package:website/widgets/reference_carousel.dart';
import 'package:website/widgets/reference_heading.dart';
import 'package:website/widgets/responsive.dart';
import 'package:website/widgets/top_bar_contents.dart';
import 'package:website/widgets/web_scrollbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String onSelectedTab = 'Kurumsal';
  late ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;
  List<Work> featuredWorks = <Work>[];
  List<Work> referenceWorks = [];
  List<Widget> imageSliders = [];

  List<String> items1 = [
    'Hakkımızda',
    'Değerlerimiz',
    'Politikamız',
    'Çözüm Ortaklarımız'
  ];
  List<String> items2 = [
    'Endüstriyel Çatı Güneş Enerji Santralleri',
    'Arazi Tipi Güneş Enerji Santralleri',
    'Uzaktan İzleme Sistemi - Bakım & Onarım',
    'Proje, Mühendislik ve Yatırım Danışmanlığı'
  ];

  List<String> items3 = [
    'YEDPA Çatı GES Uygulaması',
    'Second Project',
    'Third Project',
    'Fourth Project'
  ];
  List<String> items4 = [
    'Güneş Enerji Sistemleri',
    'İnşaat & Taahhüt ',
    'Yazılım Uygulamaları',
    'İklim Soğutma'
  ];

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  void getWorksFromApi() {
    WorkApi.getWorks().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.featuredWorks = list.map((work) => Work.fromJson(work)).toList();
        this.referenceWorks = list.map((work) => Work.fromJson(work)).toList();
      });
      print('ReferenceWorks home: ' + referenceWorks.length.toString());
      print('FeaturedWorks home: ' + featuredWorks.length.toString());
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    referenceWorks = <Work>[];
    getWorksFromApi();

    super.initState();
  }

  void onTap(String val) {
    setState(() {
      onSelectedTab = val;
    });
  }

  List<Widget> generateImageTiles() {
    return referenceWorks
        .map((element) => ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                element.image!,
                fit: BoxFit.cover,
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles();

    _opacity = _scrollPosition < screenSize.width * 0.40
        ? _scrollPosition / (screenSize.width * 0.40)
        : 1;

    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100.withOpacity(0.3),
        extendBodyBehindAppBar: true,
        appBar: ResponsiveWidget.isSmallScreen(context)
            ? AppBar(
                backgroundColor:
                    Theme.of(context).bottomAppBarColor.withOpacity(_opacity),
                elevation: 0,
                centerTitle: true,
                title: Text(
                  'Eda Group Solar',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: screenSize.height / 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: screenSize.width / 200,
                  ),
                ),
              )
            : PreferredSize(
                preferredSize: Size(screenSize.width, 1000),
                child: TopBarContents(_opacity, _scrollPosition, onTap),
              ),
        drawer: ExploreDrawer(),
        body: WebScrollbar(
          color: Colors.blueGrey,
          backgroundColor: Colors.blueGrey.withOpacity(0.3),
          width: screenSize.width / 120,
          heightFraction: 0.3,
          controller: _scrollController,
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      child: SizedBox(
                        height: screenSize.height * 0.45,
                        width: screenSize.width,
                        child: Image.asset(
                          'assets/images/ges.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        FloatingQuickAccessBar(
                          screenSize: screenSize,
                          items: onSelectedTab == 'Kurumsal'
                              ? items1
                              : onSelectedTab == 'Faaliyetler'
                                  ? items2
                                  : onSelectedTab == 'Projelerimiz'
                                      ? items3
                                      : items4,
                          selectedTap: onSelectedTab,
                        ),
                        Container(
                          child: Column(
                            children: [
                              FeaturedHeading(
                                screenSize: screenSize,
                              ),
                              FeaturedTiles(
                                screenSize: screenSize,
                                featuredWorks: featuredWorks,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                // SizedBox(height: screenSize.height / 8),
                ReferenceHeading(screenSize: screenSize),
                ReferenceCarousel(imageSliders, referenceWorks),
                SizedBox(height: screenSize.height / 10),
                BottomBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
