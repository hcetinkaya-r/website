// ignore: import_of_legacy_library_into_null_safe

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:website/models/work.dart';
import 'package:website/widgets/responsive.dart';

class ReferenceCarousel extends StatefulWidget {
  final List<Work> referenceWorks;
  final List<Widget> imageSliders;

  const ReferenceCarousel(this.imageSliders, this.referenceWorks);

  @override
  _ReferenceCarouselState createState() => _ReferenceCarouselState();
}

class _ReferenceCarouselState extends State<ReferenceCarousel> {
  final CarouselController _controller = CarouselController();

  List _isHovering = [false, false, false, false, false, false, false];
  List _isSelected = [true, false, false, false, false, false, false];

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    print(widget.imageSliders.length);

    return Stack(
      children: [
        CarouselSlider(
          items: widget.imageSliders,
          options: CarouselOptions(
              scrollPhysics: ResponsiveWidget.isSmallScreen(context)
                  ? PageScrollPhysics()
                  : NeverScrollableScrollPhysics(),
              enlargeCenterPage: true,
              aspectRatio: 18 / 8,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                  for (int i = 0; i < widget.imageSliders.length; i++) {
                    if (i == index) {
                      _isSelected[i] = true;
                    } else {
                      _isSelected[i] = false;
                    }
                  }
                });
              }),
          carouselController: _controller,
        ),
        AspectRatio(
          aspectRatio: 18 / 8,
          child: Center(
            child: Text(
              widget.referenceWorks[_current].title!,
              style: TextStyle(
                letterSpacing: 8,
                fontSize: screenSize.width / 25,
                color: Colors.orange,
              ),
            ),
          ),
        ),
        ResponsiveWidget.isSmallScreen(context)
            ? Container()
            : AspectRatio(
                aspectRatio: 17 / 8,
                child: Center(
                  heightFactor: 1,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: screenSize.width / 8,
                        right: screenSize.width / 8,
                      ),
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: screenSize.height / 50,
                            bottom: screenSize.height / 50,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (int i = 0;
                                  i < widget.referenceWorks.length;
                                  i++)
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      onHover: (value) {
                                        setState(() {
                                          value
                                              ? _isHovering[i] = true
                                              : _isHovering[i] = false;
                                        });
                                      },
                                      onTap: () {
                                        _controller.animateToPage(i);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: screenSize.height / 80,
                                            bottom: screenSize.height / 90),
                                        child: Text(
                                          widget.referenceWorks[i].title!,
                                          style: TextStyle(
                                            color: _isHovering[i]
                                                ? Theme.of(context).accentColor
                                                : Theme.of(context)
                                                    .primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      maintainSize: true,
                                      maintainAnimation: true,
                                      maintainState: true,
                                      visible: _isSelected[i],
                                      child: AnimatedOpacity(
                                        duration: Duration(milliseconds: 400),
                                        opacity: _isSelected[i] ? 1 : 0,
                                        child: Container(
                                          height: 5,
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).accentColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          width: screenSize.width / 10,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
