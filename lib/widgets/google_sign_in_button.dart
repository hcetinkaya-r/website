import 'package:flutter/material.dart';
import 'package:website/screens/home_page.dart';
import 'package:website/utils/auth.dart';

class GoogleButton extends StatefulWidget {
  @override
  _GoogleButtonState createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async {
        setState(() {
          _isProcessing = true;
        });
        await signInWithGoogle().then((result) {
          print(result);
          if (result != null) {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) => HomePage(),
              ),
            );
          }
        }).catchError((error) {
          print('Registration Error: $error');
        });
        setState(() {
          _isProcessing = false;
        });
      },
      style: OutlinedButton.styleFrom(
        shape: StadiumBorder(),
        side: BorderSide(
          width: 2,
          color: Theme.of(context).primaryColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: _isProcessing
            ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor,
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/images/google_logo.png"),
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Continue with Google',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blueGrey,
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
