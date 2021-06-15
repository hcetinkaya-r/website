import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:website/models/topbar_content.dart';
import 'package:website/screens/home_page.dart';
import 'package:website/utils/auth.dart';
import 'package:website/utils/routes_name.dart';
import 'package:website/widgets/auth_dialog.dart';

class TopBarContents extends StatefulWidget {
  final double opacity;
  final double scrollPosition;
  final Function(String) onTap;
  final List<TopBarContent> contents;

  TopBarContents(this.opacity, this.scrollPosition, this.onTap, this.contents);

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        height: widget.scrollPosition == 0
            ? screenSize.height / 3
            : screenSize.height / 15,
        padding: EdgeInsets.symmetric(
            vertical: screenSize.height / 500,
            horizontal: screenSize.width / 500),
        color: Colors.blue.shade400.withOpacity(widget.opacity),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.scrollPosition == 0
                ? Container(
                    height: screenSize.height / 5,
                    width: screenSize.width / 8,
                    margin: EdgeInsets.only(left: 30),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/hsc-solar-logo.png',
                        ),
                      ),
                      /*  gradient: LinearGradient(
                        colors: [
                          Theme.of(context).accentColor,
                          Theme.of(context).primaryColor.withOpacity(0.7),
                        ],
                      ),*/
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                  )
                : Container(),
            Container(
              child: Row(
                children: <Widget>[
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value ? _isHovering[0] = true : _isHovering[0] = false;
                      });
                    },
                    onTap: () => widget.onTap('${widget.contents[0].name}'),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${widget.contents[0].name}',
                          style: TextStyle(
                            color: _isHovering[0]
                                ? Theme.of(context).accentColor
                                : Theme.of(context).canvasColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Visibility(
                          maintainAnimation: true,
                          maintainState: true,
                          maintainSize: true,
                          visible: _isHovering[0],
                          child: Container(
                            height: 2,
                            width: 65,
                            color: Theme.of(context).canvasColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: screenSize.width / 60),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value ? _isHovering[1] = true : _isHovering[1] = false;
                      });
                    },
                    onTap: () => widget.onTap('${widget.contents[1].name}'),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${widget.contents[1].name}',
                          style: TextStyle(
                            color: _isHovering[1]
                                ? Theme.of(context).accentColor
                                : Theme.of(context).canvasColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Visibility(
                          maintainAnimation: true,
                          maintainState: true,
                          maintainSize: true,
                          visible: _isHovering[1],
                          child: Container(
                            height: 2,
                            width: 73,
                            color: Theme.of(context).canvasColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: screenSize.width / 60),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value ? _isHovering[2] = true : _isHovering[2] = false;
                      });
                    },
                    onTap: () => widget.onTap('${widget.contents[2].name}'),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${widget.contents[2].name}',
                          style: TextStyle(
                            color: _isHovering[2]
                                ? Theme.of(context).accentColor
                                : Theme.of(context).canvasColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Visibility(
                          maintainAnimation: true,
                          maintainState: true,
                          maintainSize: true,
                          visible: _isHovering[2],
                          child: Container(
                            height: 2,
                            width: 80,
                            color: Theme.of(context).canvasColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: screenSize.width / 60),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value ? _isHovering[3] = true : _isHovering[3] = false;
                      });
                    },
                    onTap: () => widget.onTap('${widget.contents[3].name}'),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${widget.contents[3].name}',
                          style: TextStyle(
                            color: _isHovering[3]
                                ? Theme.of(context).accentColor
                                : Theme.of(context).canvasColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Visibility(
                          maintainAnimation: true,
                          maintainState: true,
                          maintainSize: true,
                          visible: _isHovering[3],
                          child: Container(
                            height: 2,
                            width: 63,
                            color: Theme.of(context).canvasColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: screenSize.width / 60),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value ? _isHovering[4] = true : _isHovering[4] = false;
                      });
                    },
                    onTap: () => Navigator.pushNamed(
                        context, RoutesName.HUMAN_RESOURCES_PAGE),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${widget.contents[4].name}',
                          style: TextStyle(
                            color: _isHovering[4]
                                ? Theme.of(context).accentColor
                                : Theme.of(context).canvasColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Visibility(
                          maintainAnimation: true,
                          maintainState: true,
                          maintainSize: true,
                          visible: _isHovering[4],
                          child: Container(
                            height: 2,
                            width: 113,
                            color: Theme.of(context).canvasColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: screenSize.width / 60),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value ? _isHovering[5] = true : _isHovering[5] = false;
                      });
                    },
                    onTap: () =>
                        Navigator.pushNamed(context, RoutesName.NEWS_PAGE),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${widget.contents[5].name}',
                          style: TextStyle(
                            color: _isHovering[5]
                                ? Theme.of(context).accentColor
                                : Theme.of(context).canvasColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Visibility(
                          maintainAnimation: true,
                          maintainState: true,
                          maintainSize: true,
                          visible: _isHovering[5],
                          child: Container(
                            height: 2,
                            width: 60,
                            color: Theme.of(context).canvasColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: screenSize.width / 60),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value ? _isHovering[6] = true : _isHovering[6] = false;
                      });
                    },
                    onTap: () =>
                        Navigator.pushNamed(context, RoutesName.CONTACT_PAGE),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'İletişim',
                          style: TextStyle(
                            color: _isHovering[6]
                                ? Theme.of(context).accentColor
                                : Theme.of(context).canvasColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Visibility(
                          maintainAnimation: true,
                          maintainState: true,
                          maintainSize: true,
                          visible: _isHovering[6],
                          child: Container(
                            height: 2,
                            width: 50,
                            color: Theme.of(context).canvasColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: screenSize.height / 3,
              margin: EdgeInsets.only(right: 15, top: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value ? _isHovering[8] = true : _isHovering[8] = false;
                      });
                    },
                    onTap: userEmail == null
                        ? () {
                            showDialog(
                              context: context,
                              builder: (context) => AuthDialog(),
                            );
                          }
                        : null,
                    child: userEmail == null
                        ? Text(
                            'Sign in',
                            style: TextStyle(
                              color: _isHovering[8]
                                  ? Theme.of(context).accentColor
                                  : Theme.of(context).canvasColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Row(
                            children: [
                              CircleAvatar(
                                radius: 15,
                                backgroundImage: imageUrl != null
                                    ? NetworkImage(imageUrl!)
                                    : null,
                                child: imageUrl == null
                                    ? Icon(
                                        Icons.account_circle,
                                        size: 30,
                                      )
                                    : Container(),
                              ),
                              SizedBox(width: 5),
                              Text(
                                (name ?? userEmail)!,
                                style: TextStyle(
                                  color: _isHovering[3]
                                      ? Theme.of(context).canvasColor
                                      : Theme.of(context).accentColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10),
                              TextButton(
                                onPressed: _isProcessing
                                    ? null
                                    : () async {
                                        setState(() {
                                          _isProcessing = true;
                                        });
                                        await signOut().then((result) {
                                          print(result);
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              fullscreenDialog: true,
                                              builder: (context) => HomePage(),
                                            ),
                                          );
                                        }).catchError((error) {
                                          print('Sign Out Error: $error');
                                        });
                                        setState(() {
                                          _isProcessing = false;
                                        });
                                      },
                                child: _isProcessing
                                    ? CircularProgressIndicator()
                                    : Text(
                                        'Sign out',
                                      ),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
