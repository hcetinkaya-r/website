import 'package:flutter/material.dart';
import 'package:website/screens/home_page.dart';
import 'package:website/utils/auth.dart';
import 'package:website/utils/validation.dart';

import 'google_sign_in_button.dart';

class AuthDialog extends StatefulWidget {
  @override
  _AuthDialogState createState() => _AuthDialogState();
}

class _AuthDialogState extends State<AuthDialog> with Validation {
  TextEditingController? textControllerEmail;
  FocusNode? textFocusNodeEmail;
  bool _isEditingEmail = false;

  TextEditingController? textControllerPassword;
  FocusNode? textFocusNodePassword;
  bool _isEditingPassword = false;

  bool _isRegistering = false;
  bool _isLoggingIn = false;

  String? loginStatus;
  Color loginStringColor = Colors.green;

  @override
  void initState() {
    textControllerEmail = TextEditingController();
    textControllerPassword = TextEditingController();
    textControllerEmail!.text;
    textControllerPassword!.text;
    textFocusNodeEmail = FocusNode();
    textFocusNodePassword = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).canvasColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: 400,
            color: Theme.of(context).canvasColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'HSC SOLAR',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 24,
                          fontFamily: 'Electrolize',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3,
                        ),
                      ),
                      SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          color: Theme.of(context).textTheme.headline1!.color,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    bottom: 8,
                  ),
                  child: Text(
                    'Email address',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.subtitle2!.color,
                      fontSize: 18,
                      // fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      // letterSpacing: 3,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20,
                  ),
                  child: buildEmailTextField(context),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    bottom: 8,
                  ),
                  child: Text(
                    'Password',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.subtitle2!.color,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      // letterSpacing: 3,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20,
                  ),
                  child: buildPasswordTextField(context),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          width: double.maxFinite,
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                _isLoggingIn = true;
                                textFocusNodeEmail!.unfocus();
                                textFocusNodePassword!.unfocus();
                              });
                              if (validateEmail(textControllerEmail!.text) ==
                                      null &&
                                  validatePassword(
                                          textControllerPassword!.text) ==
                                      null) {
                                await signInWithEmailPassword(
                                        textControllerEmail!.text,
                                        textControllerPassword!.text)
                                    .then((result) {
                                  if (result != null) {
                                    print(result);
                                    setState(() {
                                      loginStatus =
                                          'You have successfully logged in';
                                      loginStringColor = Colors.green;
                                    });
                                    Future.delayed(Duration(milliseconds: 500),
                                        () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context)
                                          .pushReplacement(MaterialPageRoute(
                                        fullscreenDialog: true,
                                        builder: (context) => HomePage(),
                                      ));
                                    });
                                  }
                                }).catchError((error) {
                                  print('Login Error: $error');
                                  setState(() {
                                    loginStatus =
                                        'Error occured while logging in';
                                    loginStringColor = Colors.red;
                                  });
                                });
                              } else {
                                setState(() {
                                  loginStatus = 'Please enter email & password';
                                  loginStringColor = Colors.red;
                                });
                              }
                              setState(() {
                                _isLoggingIn = false;
                                textControllerEmail!.text = '';
                                textControllerPassword!.text = '';
                                _isEditingEmail = false;
                                _isEditingPassword = false;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 15.0,
                                bottom: 15.0,
                              ),
                              child: _isLoggingIn
                                  ? SizedBox(
                                      height: 16,
                                      width: 16,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.white,
                                        ),
                                      ),
                                    )
                                  : Text(
                                      'Log in',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Flexible(
                        flex: 1,
                        child: Container(
                          width: double.maxFinite,
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                textFocusNodeEmail!.unfocus();
                                textFocusNodePassword!.unfocus();
                              });
                              if (validateEmail(textControllerEmail!.text) ==
                                      null &&
                                  validatePassword(
                                          textControllerPassword!.text) ==
                                      null) {
                                setState(() {
                                  _isRegistering = true;
                                });
                                await registerWithEmailPassword(
                                        textControllerEmail!.text,
                                        textControllerPassword!.text)
                                    .then((result) {
                                  if (result != null) {
                                    setState(() {
                                      loginStatus =
                                          'You have registered successfully';
                                      loginStringColor = Colors.green;
                                    });
                                    print("Auth result: " + result);
                                  }
                                }).catchError((error) {
                                  print('Registration Error: $error');
                                  setState(() {
                                    loginStatus =
                                        'Error occured while registering';
                                    loginStringColor = Colors.red;
                                  });
                                });
                              } else {
                                setState(() {
                                  loginStatus = 'Please enter email & password';
                                  loginStringColor = Colors.red;
                                });
                              }
                              setState(() {
                                _isRegistering = false;

                                textControllerEmail!.text = '';
                                textControllerPassword!.text = '';
                                _isEditingEmail = false;
                                _isEditingPassword = false;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 15.0,
                                bottom: 15.0,
                              ),
                              child: _isRegistering
                                  ? SizedBox(
                                      height: 16,
                                      width: 16,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.white,
                                        ),
                                      ),
                                    )
                                  : Text(
                                      'Sign up',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                loginStatus != null
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 20.0,
                          ),
                          child: Text(
                            loginStatus!,
                            style: TextStyle(
                              color: loginStringColor,
                              fontSize: 14,
                              // letterSpacing: 3,
                            ),
                          ),
                        ),
                      )
                    : Container(),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Container(
                    height: 1,
                    width: double.maxFinite,
                    color: Colors.blueGrey[200],
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: GoogleButton(),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'By proceeding, you agree to our Terms of Use and confirm you have read our Privacy Policy.',
                    maxLines: 2,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.subtitle2!.color,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      // letterSpacing: 3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextField buildPasswordTextField(BuildContext context) {
    return TextField(
      focusNode: textFocusNodePassword,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      controller: textControllerPassword,
      obscureText: true,
      autofocus: false,
      onChanged: (value) {
        setState(() {
          _isEditingPassword = true;
        });
      },
      onSubmitted: (value) {
        textFocusNodePassword!.unfocus();
        FocusScope.of(context).requestFocus(textFocusNodePassword);
      },
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        border: new OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.blueGrey[800]!,
            width: 3,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).accentColor,
            )),
        filled: true,
        hintStyle: new TextStyle(
          color: Colors.blueGrey[300],
        ),
        hintText: "Password",
        fillColor: Colors.white,
        errorText: _isEditingPassword
            ? validatePassword(textControllerPassword!.text)
            : null,
        errorStyle: TextStyle(
          fontSize: 12,
          color: Colors.redAccent,
        ),
      ),
    );
  }

  TextField buildEmailTextField(BuildContext context) {
    return TextField(
      focusNode: textFocusNodeEmail,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      controller: textControllerEmail,
      autofocus: false,
      onChanged: (value) {
        setState(() {
          _isEditingEmail = true;
        });
      },
      onSubmitted: (value) {
        textFocusNodeEmail!.unfocus();
        FocusScope.of(context).requestFocus(textFocusNodePassword);
      },
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.blueGrey[800]!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).accentColor,
            )),
        filled: true,
        hintStyle: new TextStyle(
          color: Colors.blueGrey[300],
        ),
        hintText: "Email",
        fillColor: Colors.white,
        errorText:
            _isEditingEmail ? validateEmail(textControllerEmail!.text) : null,
        errorStyle: TextStyle(
          fontSize: 12,
          color: Colors.redAccent,
        ),
      ),
    );
  }
}
