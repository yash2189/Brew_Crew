import 'package:brew_crew/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    // Return either Home or Authenticate Widget
    return Authenticate();
  }
}