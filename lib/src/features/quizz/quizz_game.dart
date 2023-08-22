import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:fast_trivia/src/core/ui/constants.dart';
import 'package:fast_trivia/src/core/ui/widget/messages_helpers.dart';
import 'package:fast_trivia/src/core/ui/widget/alert.dart';
import 'package:fast_trivia/src/core/ui/widget/fixed_spacer.dart';
import 'package:fast_trivia/src/features/home/home_page.dart';
import 'package:fast_trivia/src/features/quizz/quizz_text.dart';

import '../../models/quiz_model.dart';
import 'quizz_finish.dart';

class QuizzGame extends StatefulWidget {
  const QuizzGame({
    Key? key,
    this.themeImage,
    this.quizzModel,
  }) : super(key: key);

  final String? themeImage;
  final QuizzModel? quizzModel;

  @override
  State<QuizzGame> createState() => _QuizzGameState();
}

class _QuizzGameState extends State<QuizzGame> {
  final CountDownController _controller = CountDownController();
  int questionActive = 0;
  int questionsLength = -1;
  int questionDuration = 8;
  bool selected = false;
  int? selectedOptionIndex;
  int points = 0;

  @override
  void initState() {
    initializeData();
    super.initState();
  }

  void initializeData() {
    questionActive = widget.quizzModel!.questoes[0].questaoId;
    questionsLength = widget.quizzModel!.questoes.length;
    _controller.start();
  }

  Future<bool> _onWillPop() async {
    _showExitAlert(context);
    return false;
  }

  void _showExitAlert(BuildContext context) {
    Alert(
      onConfirmPressed: () async {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false,
        );
        return false;
      },
      onCancelPressed: () {},
      title: 'Sair do quizz',
      context: context,
      type: AlertType.yesNo,
      message:
          'Ao sair todos dados serão perdidos \n Tem certeza que deseja sair?',
    ).show();
  }

  void _handleSingleOptionTap() {
    if (!selected) {
      setState(() {
        selected = true;
        selectedOptionIndex = questionActive;
      });
      Future.delayed(const Duration(milliseconds: 500), () {
        _controller.restart(duration: questionDuration);
      });

      if (questionActive == questionsLength - 1) {
        Future.delayed(const Duration(milliseconds: 500), () {
          _navigateToQuizzFinish();
        });
      } else {
        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            questionActive += 1;
            selected = false;
            selectedOptionIndex = null;
          });
          _controller.start();
        });
      }
    }
  }

  void _pointsCount(int userChoice, int resposta, BuildContext context) {
    if (userChoice == resposta) {
      points += 1;
      MessagesHelper.showSuccess('Certa resposta', context);
      debugPrint('$points');
      debugPrint('$resposta');
    } else {
      MessagesHelper.showError('Resposta Errada', context);
    }
  }

  Widget _buildOptionItem(int index) {
    final optionText =
        widget.quizzModel!.questoes[questionActive].alternativas[index];
    final int resposta = widget.quizzModel!.questoes[questionActive].resposta;

    final isSelected = selected && selectedOptionIndex == questionActive;
    final isCorrect = isSelected && index == resposta;

    return Container(
      height: 60,
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Card(
        elevation: 4,
        color: isSelected
            ? (isCorrect ? Colors.green : Colors.red)
            : ColorsContants.blue,
        child: InkWell(
          onTap: () {
            _pointsCount(index, resposta, context);
            _handleSingleOptionTap();
          },
          child: Text(
            optionText,
            maxLines: 3,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : ColorsContants.white,
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToQuizzFinish() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => QuizzFinish(
          points: points,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.quizzModel!.questoes[questionActive].pergunta;

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      _showExitAlert(context);
                    },
                    icon: const Icon(
                      Icons.close_rounded,
                      size: 38,
                      color: ColorsContants.white,
                    ),
                  ),
                  CircularCountDownTimer(
                    autoStart: true,
                    controller: _controller,
                    isReverse: true,
                    width: 38,
                    height: 38,
                    textStyle: const TextStyle(
                      color: ColorsContants.white,
                      fontSize: 18,
                    ),
                    duration: questionDuration,
                    fillColor: ColorsContants.red,
                    ringColor: ColorsContants.white,
                    onComplete: () {
                      MessagesHelper.showError('Tempo Esgotado', context);
                      if (questionActive == questionsLength - 1) {
                        Future.delayed(const Duration(milliseconds: 500), () {
                          _navigateToQuizzFinish();
                        });
                      } else {
                        setState(() {
                          questionActive += 1;
                        });
                        Future.delayed(const Duration(milliseconds: 500), () {
                          _controller.start();
                        });
                      }
                    },
                  ),
                ],
              ),
              FixedSpacer.vSmall,
              SizedBox(
                width: double.infinity,
                height: 180,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.themeImage!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              FixedSpacer.vSmall,
              QuizzText(
                text: "Questões restantes: ${questionsLength - questionActive}",
                size: 20,
                maxLines: 4,
                textAlign: TextAlign.center,
              ),
              FixedSpacer.vSmall,
              QuizzText(
                fontWeight: FontWeight.w600,
                text: question.toUpperCase(),
                size: 28,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget
                      .quizzModel!.questoes[questionActive].alternativas.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return _buildOptionItem(index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
