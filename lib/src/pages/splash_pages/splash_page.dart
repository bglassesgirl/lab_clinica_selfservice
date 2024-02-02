import 'package:flutter/material.dart';

class SpashPage extends StatefulWidget {

  const SpashPage({ super.key });

  @override
  State<SpashPage> createState() => _SpashPageState();
}

class _SpashPageState extends State<SpashPage> {

  @override
  void initState(){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pushReplacementNamed('/auth/login');
    });
    super.initState();
  }

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           body: Center(
            child: Image.asset('assets/images/logo_vertical.png')),
       );
  }
}