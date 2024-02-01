import 'package:flutter/material.dart';

class SpashPage extends StatefulWidget {

  const SpashPage({ super.key });

  @override
  State<SpashPage> createState() => _SpashPageState();
}

class _SpashPageState extends State<SpashPage> {
   @override
   Widget build(BuildContext context) {
       return Scaffold(
           body: Center(child: Image.asset('assets/images/logo_vertical.png')),
       );
  }
}