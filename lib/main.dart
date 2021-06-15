import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:website/utils/auth.dart';
import 'package:website/utils/routes_generator.dart';
import 'package:website/utils/routes_name.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future getUserInfo() async {
    await getUser();
    setState(() {});
    print(uid);
  }

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesGenerator.generateRoute,
      initialRoute: RoutesName.HOME_PAGE,
      title: "EDA GROUP SOLAR",
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.orange,
        fontFamily: 'Electrolize',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(
              fontSize: 15,
              fontFamily: 'Electrolize',
            ),
            padding: EdgeInsets.all(15),
            primary: Theme.of(context).accentColor,
            minimumSize: Size(20, 20),
            onPrimary: Theme.of(context).canvasColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: TextStyle(
              fontSize: 15,
              fontFamily: 'Electrolize',
            ),
            padding: EdgeInsets.all(15),
            primary: Theme.of(context).indicatorColor,
          ),
        ),
      ),
    );
  }
}
