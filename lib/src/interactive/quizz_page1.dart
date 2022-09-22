import 'dart:developer';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning/src/common_widget/page_pusher_button.dart';
import 'package:learning/src/common_widget/small_circle_container.dart';
import 'package:learning/src/interactive/quizz_page2.dart';
import 'package:learning/src/interactive/quizz_repo/quiz_page1_list.dart';
import 'package:learning/src/interactive/soil_page.dart';
import 'package:learning/src/learning_page/components/background_page.dart';
import 'package:learning/src/learning_page/components/section_header.dart';
import 'package:learning/tool_widgets.dart';
import 'package:riverpod/riverpod.dart';

class QuizzPage1 extends ConsumerStatefulWidget {
  const QuizzPage1({super.key});

  @override
  ConsumerState<QuizzPage1> createState() => _QuizzPage1State();
}

class _QuizzPage1State extends ConsumerState<QuizzPage1> {
  dynamic answer = '';
  List<dynamic> answerList = [];
  bool answerCount = false;
  final checkanswer = quizList1.map((e) => e.answer).toList();
  final multiselect = quizList1
      .map(
        (e) => MultiSelectCard(
          value: e.multiSelect,
          label: e.multiSelect,
          margin: const EdgeInsets.symmetric(
            horizontal: 80,
            vertical: 15,
          ),
        ),
      )
      .toList();
  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor:
            mqData.textScaleFactor > 1.0 ? 1.0 : mqData.textScaleFactor);
    return MediaQuery(
      data: mqData,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 225, 255, 147),
        body: SafeArea(
          child: Stack(
            children: [
              const BackgroundPage(),
              const SessionHeader(),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      width: double.infinity,
                      height: 80,
                      color: Colors.black38,
                      child: const Text(
                        'Question One',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                        alignment: WrapAlignment.center,
                        direction: Axis.horizontal,
                        children: [
                          MultiSelectContainer(
                            controller: MultiSelectController(),
                            itemsDecoration: const MultiSelectDecorations(
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              disabledDecoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              selectedDecoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                            ),
                            maxSelectableCount: 2,
                            items: multiselect,
                            onChange: ((selectedItems, selectedItem) {
                              answerList.add(selectedItems);
                              setState(() {
                                answer = selectedItem;
                                answerCount = true;
                              });
                              log(answerList.toString());
                            }),
                          ),
                        ]),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        log(answer);
                        //    log(checkanswer[0].toString());
                        if (answer == checkanswer[0] &&
                            answer == checkanswer[1]) {
                          //log("success");
                        } else {
                          //  log('fail');
                        }
                        setState(() {});
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8))),
                        width: 130,
                        height: 45,
                        child: const Text(
                          'check answer',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: QuizCircleIndex(),
              ),
              if (answerCount)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    alignment: Alignment.center,
                    width: 600,
                    height: 30,
                    color: Colors.black54,
                    child: const Text(
                      'answer 2 khu shi p dl',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              PagePusherButton(
                forward: false,
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const SoilPageScreen())));
                },
              ),
              PagePusherButton(
                forward: true,
                onTap: () {
                  ref.read(quizzIndexProvider.notifier).state = 1;
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizzPage2(),
                      ));
                  setState(() {
                    answerCount = false;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final quizzIndexProvider = StateProvider<int>((ref) {
  return 0;
});
