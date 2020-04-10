import 'package:brewcrew/models/user.dart';
import 'package:brewcrew/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);

    //return either home or Authenticate
    if (user == null){
      return Authenticate();
    } else {
      return Home();
    }
  }
}
