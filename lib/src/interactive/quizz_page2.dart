import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning/src/common_widget/page_pusher_button.dart';
import 'package:learning/src/common_widget/result_dialog.dart';
import 'package:learning/src/common_widget/small_circle_container.dart';
import 'package:learning/src/interactive/quizz_page1.dart';
import 'package:learning/src/interactive/quizz_page3.dart';
import 'package:learning/src/interactive/quizz_repo/quizz_page2_list.dart';
import 'package:learning/src/learning_page/components/background_page.dart';
import 'package:learning/src/learning_page/components/section_header.dart';

class QuizzPage2 extends ConsumerStatefulWidget {
  const QuizzPage2({super.key});

  @override
  ConsumerState<QuizzPage2> createState() => _QuizzPage2State();
}

class _QuizzPage2State extends ConsumerState<QuizzPage2> {
  bool button = false;
  bool nextPage = false;
  final multiselect = quizlist2
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
  dynamic selected = '';

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
                        'Question Two',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      alignment: WrapAlignment.center,
                      direction: Axis.horizontal,
                      children: [
                        MultiSelectContainer(
                          singleSelectedItem: true,
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
                          maxSelectableCount: 1,
                          items: multiselect,
                          onChange: ((selectedItems, selectedItem) {
                            setState(() {
                              selected = selectedItem;
                              button = true;
                            });
                          }),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: !button
                          ? null
                          : () {
                              if (selected == 'Right') {
                                setState(() {
                                  nextPage = true;
                                });
                                passShowDialog(
                                  context: context,
                                );
                              } else {
                                failResultDialog(
                                    context: context,
                                    onTap: () {
                                      Navigator.pop(context);
                                    });
                              }
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
              PagePusherButton(
                forward: false,
                onTap: () {
                  ref.read(quizzIndexProvider.notifier).state = 0;
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const QuizzPage1())));
                },
              ),
              PagePusherButton(
                forward: true,
                onTap: () {
                  if (nextPage) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const QuizzPage3())));
                    ref.read(quizzIndexProvider.notifier).state = 2;
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
