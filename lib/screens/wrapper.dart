import 'package:flutter/material.dart';
import 'package:ninja_brew/models/user.dart';
import 'package:ninja_brew/screens/auth/auth.dart';
import 'package:ninja_brew/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user == null ? Auth() : Home();
  }
}
