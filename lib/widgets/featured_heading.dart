import 'package:flutter/material.dart';
import 'package:website/widgets/responsive.dart';

class FeaturedHeading extends StatelessWidget {
  const FeaturedHeading({
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.06,
        left: screenSize.width / 15,
        right: screenSize.width / 15,
      ),
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(),
                Text(
                  'Featured',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Electrolize',
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Web Site',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontFamily: 'Electrolize',
                  ),
                ),
                SizedBox(height: 10),
              ],
            )
          : Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Featured',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Electrolize',
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Expanded(
                  child: Text(
                    'HSC Solar',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontFamily: 'Electrolize',
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
