import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:website/api/topbar_contents_api.dart';
import 'package:website/api/works_api.dart';
import 'package:website/models/topbar_content.dart';
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
  List<TopBarContent> topBarContents = [];
  List<Work> featuredWorks = [];
  List<Work> referenceWorks = [];
  List<Widget> imageSliders = [];

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  void getWorksFromApi() {
    WorksApi.getWorks().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.featuredWorks = list.map((work) => Work.fromJson(work)).toList();
        this.referenceWorks = list.map((work) => Work.fromJson(work)).toList();
      });
    });
  }

  void getTopBarContentsFromApi() {
    TopBarContentsApi.getTopBarContents().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.topBarContents =
            list.map((content) => TopBarContent.fromJson(content)).toList();
      });
    });
  }

  Future delay() async {
    await Future.delayed(Duration(milliseconds: 1000), () => getWorksFromApi());
    await Future.delayed(
        Duration(milliseconds: 1000), () => getTopBarContentsFromApi());
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    delay();

    // referenceWorks = <Work>[];
    // featuredWorks = <Work>[];
    // imageSliders = <Widget>[];
    // topBarContents = <TopBarContent>[];
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
                  'Web Site',
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
                child: TopBarContents(
                    _opacity, _scrollPosition, onTap, topBarContents),
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
                          quickContents: onSelectedTab == 'Kurumsal'
                              ? topBarContents[0].quickContents!.toList()
                              : onSelectedTab == 'Faaliyetler'
                                  ? topBarContents[1].quickContents!.toList()
                                  : onSelectedTab == 'Projelerimiz'
                                      ? topBarContents[2]
                                          .quickContents!
                                          .toList()
                                      : topBarContents[3]
                                          .quickContents!
                                          .toList(),
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
