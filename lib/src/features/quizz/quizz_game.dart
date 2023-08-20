import 'package:flutter/material.dart';

class QuizzGame extends StatefulWidget {

  const QuizzGame({ super.key });

  @override
  State<QuizzGame> createState() => _QuizzGameState();
}

class _QuizzGameState extends State<QuizzGame> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text(''),),
           body: Container(),
       );
  }
}