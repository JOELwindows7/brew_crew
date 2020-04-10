import 'package:brewcrew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView; //store a Function method such as void method. can be outside scope of this instance!
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to Brew Crew'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: (){
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Register'),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val){
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                validator: (val) => val.length < 6 ? 'Enter an password 6+ chars long' : null,
                obscureText: true,
                onChanged: (val){
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                    'Sign in',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async{
                  if(_formKey.currentState.validate()){
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if(result == null){
                      setState(() {
                        error = 'could not sign in with those credential';
                      });
                    }
                  } else {

                  }
                },
              ),
              SizedBox(height: 12.0,),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
RaisedButton(
          child: Text('Sign in anon'),
          onPressed: () async {
            dynamic result = await _auth.signInAnon();
            if (result == null){
              print('error signing in');
            } else {
              print('signed in');
              print(result.uid);
            }
          }
 */
