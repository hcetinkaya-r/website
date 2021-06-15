import 'package:flutter/material.dart';
import 'package:website/widgets/bottom_bar_column.dart';
import 'package:website/widgets/info_text.dart';
import 'package:website/widgets/responsive.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      color: Theme.of(context).bottomAppBarColor,
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomBarColumn(
                      heading: 'HAKKIMIZDA',
                      s1: 'İletişim',
                      s2: 'Biz kimiz?',
                      s3: 'Kariyer',
                    ),
                    BottomBarColumn(
                      heading: 'SOSYAL MEDYA',
                      s1: 'Twitter',
                      s2: 'Facebook',
                      s3: 'YouTube',
                    ),
                  ],
                ),
                Container(
                  color: Colors.blueGrey,
                  width: double.maxFinite,
                  height: 1,
                ),
                SizedBox(height: 20),
                InfoText(
                  type: 'Email ',
                  text: 'info@hscsolar.com',
                ),
                SizedBox(height: 5),
                InfoText(
                  type: 'Adres ',
                  text:
                      'Topselvi Mah. Topselvi Cad. No:95\nDap Teras Kule 2 Kat: 13 D:90',
                ),
                SizedBox(height: 20),
                Container(
                  color: Colors.blueGrey,
                  width: double.maxFinite,
                  height: 1,
                ),
                SizedBox(height: 20),
                Text(
                  'Copyright © 2021 | HSC SOLAR',
                  style: TextStyle(
                    color: Colors.blueGrey[300],
                    fontSize: 14,
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BottomBarColumn(
                      heading: 'HAKKIMIZDA',
                      s1: 'İletişim',
                      s2: 'Hakkımızda',
                      s3: 'Kariyer',
                    ),
                    BottomBarColumn(
                      heading: '',
                      s1: '',
                      s2: '',
                      s3: '',
                    ),
                    BottomBarColumn(
                      heading: 'SOSYAL MEDYA',
                      s1: 'Twitter',
                      s2: 'Facebook',
                      s3: 'YouTube',
                    ),
                    Container(
                      color: Colors.blueGrey,
                      width: 2,
                      height: 150,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoText(
                          type: 'Email',
                          text: '      info@hscsolar.com',
                        ),
                        SizedBox(height: 5),
                        InfoText(
                          type: 'Address',
                          text: ResponsiveWidget.isSmallScreen(context)
                              ? 'Topselvi Mah. Topselvi Cad. No:95 \nDap Teras Kule 2 Kat: 13 D:90'
                              : ResponsiveWidget.isMediumScreen(context)
                                  ? 'Topselvi Mah. Topselvi Cad. No:95 \nDap Teras Kule 2 Kat: 13 D:90'
                                  : ResponsiveWidget.isLargeScreen(context)
                                      ? 'Topselvi Mah. Topselvi Cad. No:95 Dap Teras Kule 2 Kat: 13 D:90'
                                      : '',
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.blueGrey,
                    width: double.maxFinite,
                    height: 1,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Copyright © 2021 | HSC SOLAR',
                  style: TextStyle(
                    color: Colors.blueGrey[300],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
    );
  }
}
