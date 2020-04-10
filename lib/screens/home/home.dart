import 'package:brewcrew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text('Brew Crew'),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('logout')
          ),
        ],
      ),
    );
  }
}
