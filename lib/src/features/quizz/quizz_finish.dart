import 'package:flutter/material.dart';

import '../../core/ui/constants.dart';
import '../../core/ui/widget/alert.dart';
import '../../core/ui/widget/fixed_spacer.dart';

class QuizzFinish extends StatefulWidget {
  const QuizzFinish({super.key});

  @override
  State<QuizzFinish> createState() => _QuizzFinishState();
}

class _QuizzFinishState extends State<QuizzFinish> {
  Future<bool> _onWillPop() async {
    _showExitAlert(context);
    return false;
  }

  void _showExitAlert(BuildContext context) {
    Alert(
            onConfirmPressed: () {
              Navigator.of(context).pushReplacementNamed('/home/home');
            },
            onCancelPressed: () {},
            title: 'Sair do quizz',
            context: context,
            type: AlertType.yesNo,
            message:
                'Ao sair todos dados serão perdidos \n Tem certeza que deseja sair?')
        .show();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: ColorsContants.quizzBackground,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 32.0, 10.0, 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FixedSpacer.vNormal,
              // countdown e saída do quizz
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      _showExitAlert(context);
                    },
                    icon: const Icon(
                      size: 38,
                      Icons.close_rounded,
                      color: ColorsContants.white,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(
                          '/home/user_history',
                        );
                      },
                      color: ColorsContants.white,
                      icon: const Icon(size: 36, Icons.history_rounded)),
                ],
              ),
              // imagem do tema
              FixedSpacer.vSmall,
              SizedBox(
                width: double.infinity,
                height: 180,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      12.0), // Adjust the radius as needed
                  child: const DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          ImageConstants.backgroundImage,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              // contagem das questões
              FixedSpacer.vSmall,
            ],
          ),
        ),
      ),
    );
  }
}
