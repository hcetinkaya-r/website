import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  /*static const String route = 'news-page';*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HSC Solar'),
      ),
      body: Center(
        child: Text('Haberler'),
      ),
    );
  }
}
