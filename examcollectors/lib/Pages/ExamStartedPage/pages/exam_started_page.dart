import 'package:examcollectors/Models/examQuestionModel.dart';
import 'package:examcollectors/Pages/ExamPage/Bloc/exam_bloc.dart';
import 'package:examcollectors/services/examProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../utils/AppColorCollections.dart';
import '../../../widgets/AllCommonWidget.dart';
import '../widgets/examStartedWidget.dart';

class ExamStartedPage extends StatefulWidget {
  final String? courseName;

  const ExamStartedPage({
    super.key,
    this.courseName,
  });

  @override
  State<ExamStartedPage> createState() => _ExamStartedPageState();
}

class _ExamStartedPageState extends State<ExamStartedPage> {
  // Track selected options for each question (for multiple-choice)
  final Map<int, int?> _selectedOptions = {};
  bool _showResults = false;
  int _correctAnswers = 0;
  int _shortAnswerCount = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = (ModalRoute.of(context)!.settings.arguments as List).cast<String?>();
      final durationMinutes = int.tryParse(args[1] ?? '0') ?? 0;

      // Count short-answer questions when initializing
      if (BlocProvider.of<ExamBloc>(context).state is ExamLoadedState) {
        final state = BlocProvider.of<ExamBloc>(context).state as ExamLoadedState;
        _shortAnswerCount = state.questionsModelList.questionList
            .where((q) => !q.isOption)
            .length;
      }

      final timerProvider = Provider.of<ExamTimerProvider>(context, listen: false);
      timerProvider.startTimer(durationMinutes);
      print("$_shortAnswerCount .......");
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List<String?>;
    final timerProvider = Provider.of<ExamTimerProvider>(context);

    if (timerProvider.isFinished && !_showResults) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showTimeUpDialog(context);
      });
    }

    return BlocConsumer<ExamBloc, ExamState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is ExamLoadedState) {
          final stateValue = state.questionsModelList;

          // Check if all questions are answered (only multiple-choice)
          final allQuestionsAnswered = _areAllQuestionsAnswered(stateValue.questionList);

          return Scaffold(
            backgroundColor: ColorCollections.PageColor,
            appBar: AppBar(
              backgroundColor: ColorCollections.TextColor,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableText(
                    TextString: args[0] ?? '',
                    FontSize: 20,
                    TextColor: ColorCollections.WhiteColor,
                    TextFontWeight: FontWeight.w700,
                  ),
                  Row(
                    children: [
                      ReusableText(
                        TextString: "${timerProvider.formattedTime} min",
                        FontSize: 18,
                        FromRight: 15,
                        TextColor: ColorCollections.WhiteColor,
                        TextFontWeight: FontWeight.w500,
                      ),
                      InkWell(
                        onTap: () {
                          timerProvider.pauseTimer();
                          ExamBetweenShowDialogue(context: context, arguments: [
                            _correctAnswers.toString(),
                            args[2]!,
                            timerProvider.elapsedSeconds.toString()
                          ]);
                        },
                        child: ReusableText(
                          TextString: 'Stop',
                          FontSize: 18,
                          TextColor: ColorCollections.RedColor,
                          TextFontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            body: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(),
                          padding: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorCollections.WhiteColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: stateValue.questionList.length,
                                itemBuilder: (context, index) {
                                  final question = stateValue.questionList[index];
                                  return QuestionWidget(
                                    question: question,
                                    questionIndex: index,
                                    selectedOptionIndex: _selectedOptions[index],
                                    onOptionSelected: (selectedIndex) {
                                      setState(() {
                                        _selectedOptions[index] = selectedIndex;
                                        if (question.isOption &&
                                            question.options[selectedIndex].isCorrect) {
                                          _correctAnswers++;
                                        }
                                        if (_areAllQuestionsAnswered(stateValue.questionList)) {
                                          _showResults = true;
                                        }
                                      });
                                    },
                                    showResults: _showResults,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: InkWell(
              onTap: () {
                print("short answer number is : $_shortAnswerCount");
                Navigator.pushNamedAndRemoveUntil(
                    context, '/result_page', (predicate) => false, arguments: [
                  (_correctAnswers+_shortAnswerCount).toString(),
                  args[2],
                  timerProvider.elapsedSeconds.toString()
                ]);
              },
              child: Container(
                height: 50,
                width: 110,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorCollections.TextColor.withOpacity(0.5)),
                child: Center(
                  child: ReusableText(
                    TextString: 'Finish Exam',
                    FontSize: 16,
                    TextColor: ColorCollections.WhiteColor,
                    TextFontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        } else if (state is ExamInitial) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Center(child: Text("Error loading exam"));
        }
      },
    );
  }

  bool _areAllQuestionsAnswered(List<QuestionModel> questions) {
    // Only check multiple-choice questions
    for (int i = 0; i < questions.length; i++) {
      if (questions[i].isOption && _selectedOptions[i] == null) {
        return false;
      }
    }
    return true;
  }

  void _showTimeUpDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Time Up!'),
        content: const Text(
            'The exam time has finished. Do you want to submit your answers?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() => _showResults = true);
            },
            child: const Text('Submit'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Review'),
          ),
        ],
      ),
    );
  }
}

class QuestionWidget extends StatelessWidget {
  final QuestionModel question;
  final int questionIndex;
  final int? selectedOptionIndex;
  final Function(int) onOptionSelected;
  final bool showResults;

  const QuestionWidget({
    super.key,
    required this.question,
    required this.questionIndex,
    required this.selectedOptionIndex,
    required this.onOptionSelected,
    required this.showResults,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 150),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReusableText(
            FromLeft: 30,
            TextColor: ColorCollections.TextColor,
            TextString: "${questionIndex + 1}. ${question.title}",
            FontSize: 18,
            TextFontWeight: FontWeight.w500,
          ),
          SizedBox(height: 10),

          if (question.isOption)
          // Multiple choice question
            ..._buildOptions(context)
          else
          // Short answer question - just show the explanation
            _buildShortAnswerExplanation(),
        ],
      ),
    );
  }

  List<Widget> _buildOptions(BuildContext context) {
    return [
      ...question.options.map((option) {
        final index = question.options.indexOf(option);
        final isSelected = selectedOptionIndex == index;
        final letter = String.fromCharCode(65 + index); // A, B, C, D, etc.

        return QuizReusableChoiceContainer(
          choiceContent: "$letter. ${option.value}",
          isCorrect: option.isCorrect,
          isSelected: isSelected,
          onTap: () => onOptionSelected(index),
          showResults: showResults,
        );
      }),
      if (selectedOptionIndex != null && showResults)
        _buildExplanation(),
    ];
  }

  Widget _buildShortAnswerExplanation() {
    return ExpansionTile(
      title: ReusableText(
        TextColor: ColorCollections.TextColor,
        TextString: "Explanation",
        FontSize: 18,
      ),
      children: [
        ReusableText(
          FromLeft: 10,
          FromRight: 10,
          TextColor: ColorCollections.TextColor,
          TextString: question.explanations,
          FontSize: 16,
        ),
      ],
    );
  }

  Widget _buildExplanation() {
    return ExpansionTile(
      title: ReusableText(
        TextColor: ColorCollections.TextColor,
        TextString: "Explanation",
        FontSize: 18,
      ),
      children: [
        ReusableText(
          FromLeft: 10,
          FromRight: 10,
          TextColor: ColorCollections.TextColor,
          TextString: question.explanations,
          FontSize: 16,
        ),
      ],
    );
  }
}

class QuizReusableChoiceContainer extends StatelessWidget {
  final String choiceContent;
  final bool isCorrect;
  final bool isSelected;
  final VoidCallback onTap;
  final bool showResults;

  const QuizReusableChoiceContainer({
    super.key,
    required this.choiceContent,
    required this.isCorrect,
    required this.isSelected,
    required this.onTap,
    required this.showResults,
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor = Colors.grey.shade200;
    Color bgColor = Colors.transparent;
    Color textColor = Theme.of(context).colorScheme.primary;

    if (isSelected || showResults) {
      borderColor = isCorrect ? Colors.green : Colors.red;
      bgColor = isCorrect
          ? Colors.green.withOpacity(0.2)
          : Colors.red.withOpacity(0.2);
      textColor = isCorrect ? Colors.green : Colors.red;
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 5, left: 10, right: 10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: borderColor,
            width: isSelected || showResults ? 2 : 1,
          ),
        ),
        width: double.infinity,
        child: Text(
          choiceContent,
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}