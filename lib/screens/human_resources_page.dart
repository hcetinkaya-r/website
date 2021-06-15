
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:website/models/web_user.dart';
import 'package:website/utils/validation.dart';

class HumanResourcesPage extends StatefulWidget {
  @override
  _HumanResourcesPageState createState() => _HumanResourcesPageState();
}

class _HumanResourcesPageState extends State<HumanResourcesPage>
    with Validation {
  WebUser? _webUser = WebUser.withoutInfo();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('İnsan Kaynakları'),
      ),
      body: Container(
        width: screenSize.width / 1.9,
        height: screenSize.height / 1.5,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Card(
          color: Theme.of(context).canvasColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(
              style: BorderStyle.solid,
              color: Theme.of(context).primaryColor,
            ),
          ),
          child: Container(
            width: screenSize.width / 2.2,
            height: screenSize.height / 1.4,
            margin: EdgeInsets.symmetric(
              horizontal: screenSize.width / 50,
              vertical: screenSize.height / 50,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: screenSize.width / 50,
              vertical: screenSize.height / 50,
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildFirstNameField(),
                  buildLastNameField(),
                  buildEmailField(),
                  buildMobileField(),
                  buildSubmitButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildFirstNameField() {
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(
        labelText: 'Ad',
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
          ),
        ),
      ),
      validator: (value) => validateFirstName(value!),
      onSaved: (value) {
        _webUser?.firstName = value!;
      },
    );
  }

  TextFormField buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Soyad',
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
          ),
        ),
      ),
      validator: (value) => validateLastName(value!),
      onSaved: (String? value) {
        _webUser?.lastName = value!;
      },
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
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
          ),
        ),
      ),
      validator: (value) => validateEmail(value!),
      onSaved: (value) {
        _webUser?.email = value!;
      },
    );
  }

  TextFormField buildMobileField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: 'Mobile',
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
          ),
        ),
      ),
      validator: (value) => validatePhone(value!),
      onSaved: (value) {
        _webUser?.phoneNumber = value!;
      },
    );
  }

  Widget buildSubmitButton() {
    return Flexible(
      flex: 1,
      child: Container(
        width: double.maxFinite,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
            }
            print(
                "${_webUser?.firstName} - ${_webUser?.lastName} - ${_webUser?.email}");
          },
          child: Text('Kaydet'),
        ),
      ),
    );
  }
}
