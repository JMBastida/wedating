import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wedate/shared/shared.dart';

class ProfileData extends StatefulWidget {
  const ProfileData({Key key}) : super(key: key);

  @override
  _ProfileDataState createState() => _ProfileDataState();
}

class _ProfileDataState extends State<ProfileData> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.red, size: 20, opacity: 0.9),
        textTheme: TextTheme(
            title: TextStyle(
                color: Colors.red, fontSize: 20, fontWeight: FontWeight.w700)),
        title: Text("Profile"),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: Material(
        child: ListView(children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 15.0,
                    margin: EdgeInsets.all(5.0),
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/add-image.png',
                        width: 90.0,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                              image: AssetImage('assets/img1jorge.jpg'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 15.0,
                    margin: EdgeInsets.all(5.0),
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/add-image.png',
                        width: 90.0,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                              image: AssetImage('assets/img1jorge.jpg'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 15.0,
                    margin: EdgeInsets.all(5.0),
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/add-image.png',
                        width: 90.0,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                              image: AssetImage('assets/img1jorge.jpg'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 1.1,
                alignment: Alignment.center,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: 'What do people call you?',
                          labelText: 'Name *',
                        ),
                        onSaved: (String value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                        validator: (String value) {
                          return value.isEmpty
                              ? 'Empty'
                              : null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(FontAwesomeIcons.sortNumericDown),
                          hintText: 'How old are you?',
                          labelText: 'Age *',
                        ),
                        keyboardType: TextInputType.number,
                        onSaved: (String value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                        validator: (String value) {
                          return value.isEmpty
                              ? 'Empty'
                              : null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(FontAwesomeIcons.sortNumericDown),
                          hintText: 'Describe yourself',
                          labelText: 'Description *',
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        onSaved: (String value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                        validator: (String value) {
                          return value.isEmpty
                              ? 'Empty'
                              : null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(FontAwesomeIcons.sortNumericDown),
                          hintText: 'What do you do for getting fun?',
                          labelText: 'Your hobbies *',
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        onSaved: (String value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                        validator: (String value) {
                          return value.contains('@')
                              ? 'Do not use the @ char.'
                              : null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(FontAwesomeIcons.sortNumericDown),
                          hintText: 'What are you looking for?',
                          labelText: 'Your preferences *',
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        onSaved: (String value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                        validator: (String value) {
                          return value.contains('@')
                              ? 'Do not use the @ char.'
                              : null;
                        },
                      ),
                      ExpandedPanel(),
                      RaisedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, otherwise false.
                          if (_formKey.currentState.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.

                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text('Processing Data')));
                          }
                        },
                        child: Text('Submit'),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
