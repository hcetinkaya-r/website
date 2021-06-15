
import 'package:flutter/material.dart';
import 'package:website/utils/google_map_marker.dart';
import 'package:website/widgets/responsive.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  late ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              centerTitle: true,
              title: Text(
                'Eda Group Solar',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: screenSize.height / 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: screenSize.width / 200,
                ),
              ),
            )
          : AppBar(
              title: Text(
                'HSC Solar',
                style: TextStyle(color: Theme.of(context).canvasColor),
              ),
            ),
      body: ResponsiveWidget.isSmallScreen(context)
          ? ListView(
              children: <Widget>[
                Text(
                  'İletişim',
                  textScaleFactor: 4,
                ),
                SizedBox(height: 5),
                Text(
                  'Merkez Ofis',
                  textScaleFactor: 2,
                ),
                SizedBox(height: 5),
                Text(
                  'Adres: Topaselvi Mah. Topselvi Cad. No: 95 DAP Teras Kule-2 Kat: 13 D: 90 Kartal/İSTANBUL',
                  textScaleFactor: 1,
                ),
                SizedBox(height: 5),
                Text(
                  'Telefon: +90 216 XXX XX XX',
                  textScaleFactor: 1,
                ),
                SizedBox(height: 5),
                Text(
                  'Kurtköy Ofis ( İklimSA )',
                  textScaleFactor: 2,
                ),
                SizedBox(height: 5),
                Text(
                  'Adres: Ankara Cad. No: 370/B Kurtköy/İSTANBUL',
                  textScaleFactor: 1,
                ),
                SizedBox(height: 5),
                Text(
                  'Telefon: +90 216 XXX XX XX',
                  textScaleFactor: 1,
                ),
                SizedBox(height: 5),
                GoogleMapMarker(),
              ],
            )
          : Container(
              margin: EdgeInsets.symmetric(
                horizontal: screenSize.width / 50,
                vertical: screenSize.height / 50,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: screenSize.height / 2,
                    width: screenSize.width / 2.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          'İletişim',
                          textScaleFactor: 4,
                        ),
                        Text(
                          'Merkez Ofis',
                          textScaleFactor: 2,
                        ),
                        Text(
                          'Adres: Topaselvi Mah. Topselvi Cad. No: 95 DAP Teras Kule-2 Kat: 13 D: 90 Kartal/İSTANBUL',
                          textScaleFactor: 1,
                        ),
                        Text(
                          'Telefon: +90 216 XXX XX XX',
                          textScaleFactor: 1,
                        ),
                        Text(
                          'Kurtköy Ofis ( İklimSA )',
                          textScaleFactor: 2,
                        ),
                        Text(
                          'Adres: Ankara Cad. No: 370/B Kurtköy/İSTANBUL',
                          textScaleFactor: 1,
                        ),
                        Text(
                          'Telefon: +90 216 XXX XX XX',
                          textScaleFactor: 1,
                        ),
                      ],
                    ),
                  ),
                  GoogleMapMarker(),
                ],
              ),
            ),
    );
  }
}
