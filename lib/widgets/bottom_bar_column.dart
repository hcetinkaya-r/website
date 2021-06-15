import 'package:flutter/material.dart';
import 'package:website/utils/routes_name.dart';

class BottomBarColumn extends StatefulWidget {
  final String heading;
  final String s1;
  final String s2;
  final String s3;

  BottomBarColumn({
    required this.heading,
    required this.s1,
    required this.s2,
    required this.s3,
  });

  @override
  _BottomBarColumnState createState() => _BottomBarColumnState();
}

class _BottomBarColumnState extends State<BottomBarColumn> {
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.heading,
            style: TextStyle(
              color: Colors.blueGrey[300],
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onHover: (value) {
              setState(() {
                value ? _isHovering[0] = true : _isHovering[0] = false;
              });
            },
            onTap: () => Navigator.pushNamed(context, RoutesName.CONTACT_PAGE),
            child: Text(
              widget.s1,
              style: TextStyle(
                color: _isHovering[0]
                    ? Theme.of(context).accentColor
                    : Colors.blueGrey[100],
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(height: 5),
          InkWell(
            onHover: (value) {
              setState(() {
                value ? _isHovering[1] = true : _isHovering[1] = false;
              });
            },
            onTap: () => Navigator.pushNamed(context, RoutesName.NEWS_PAGE),
            child: Text(
              widget.s2,
              style: TextStyle(
                color: _isHovering[1]
                    ? Theme.of(context).accentColor
                    : Colors.blueGrey[100],
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(height: 5),
          InkWell(
            onHover: (value) {
              setState(() {
                value ? _isHovering[2] = true : _isHovering[2] = false;
              });
            },
            onTap: () =>
                Navigator.pushNamed(context, RoutesName.HUMAN_RESOURCES_PAGE),
            child: Text(
              widget.s3,
              style: TextStyle(
                color: _isHovering[2]
                    ? Theme.of(context).accentColor
                    : Colors.blueGrey[100],
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
