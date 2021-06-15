import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:website/widgets/responsive.dart';

class FloatingQuickAccessBar extends StatefulWidget {
  const FloatingQuickAccessBar(
      {required this.screenSize,
      /*required this.items,*/
      required this.selectedTap,
      required this.quickContents});

  final Size screenSize;
  /*final List<String> items;*/
  final String selectedTap;
  final List<String> quickContents;

  @override
  _FloatingQuickAccessBarState createState() => _FloatingQuickAccessBarState();
}

class _FloatingQuickAccessBarState extends State<FloatingQuickAccessBar> {
  List _isHovering = [false, false, false, false];
  List<Widget> rowElements = [];
  late Widget elementTile;

  List<IconData> icons = [
    Icons.location_on,
    Icons.date_range,
    Icons.people,
    Icons.wb_sunny
  ];

  List<Widget> generateRowElements() {
    rowElements.clear();
    for (int i = 0; i < widget.quickContents.length; i++) {
      Widget elementTile = InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onHover: (value) {
          setState(() {
            value ? _isHovering[i] = true : _isHovering[i] = false;
          });
        },
        onTap: () {},
        child: Text(
          widget.quickContents[i],
          style: TextStyle(
            color: _isHovering[i]
                ? Theme.of(context).accentColor
                : Theme.of(context).primaryColor,
          ),
        ),
      );
      Widget spacer = SizedBox(
        height: widget.screenSize.height / 20,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: VerticalDivider(
            width: 1,
            color: Colors.blueGrey[100],
            thickness: 1,
          ),
        ),
      );
      rowElements.add(elementTile);
      if (i < widget.quickContents.length - 1) {
        rowElements.add(spacer);
      }
    }

    return rowElements;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: Padding(
        padding: EdgeInsets.only(
          top: widget.screenSize.height * 0.40,
          left: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 12
              : widget.screenSize.width / 10,
          right: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 12
              : widget.screenSize.width / 10,
        ),
        child: ResponsiveWidget.isSmallScreen(context)
            ? Column(
                children: [
                  ...Iterable<int>.generate(widget.quickContents.length).map(
                    (int pageIndex) => Padding(
                      padding:
                          EdgeInsets.only(top: widget.screenSize.height / 80),
                      child: Card(
                        color: Theme.of(context).cardColor,
                        elevation: 4,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: widget.screenSize.height / 45,
                              bottom: widget.screenSize.height / 45,
                              left: widget.screenSize.width / 20),
                          child: Row(
                            children: [
                              Icon(
                                icons[pageIndex],
                                color: Theme.of(context).iconTheme.color,
                              ),
                              SizedBox(width: widget.screenSize.width / 20),
                              InkWell(
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                onTap: () {},
                                child: Text(
                                  widget.quickContents[pageIndex].toString(),
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .primaryTextTheme
                                          .button!
                                          .color,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Card(
                elevation: 5,
                child: Padding(
                    padding: EdgeInsets.only(
                      top: widget.screenSize.height / 50,
                      bottom: widget.screenSize.height / 50,
                      right: widget.screenSize.width / 50,
                      left: widget.screenSize.width / 50,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: generateRowElements(),
                      ),
                    )),
              ),
      ),
    );
  }
}
