import 'package:fast_trivia/src/core/ui/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsContants.white,
      appBar: AppBar(
        backgroundColor: ColorsContants.white,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.history_rounded)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.admin_panel_settings_rounded)),
          ),
        ],
      ),
      body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [Text('data')],
          )),
    );
  }
}
