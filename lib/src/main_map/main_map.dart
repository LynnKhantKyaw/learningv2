import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:learning/src/learning_page/learning_page1.dart';
import 'package:learning/tool_widgets.dart';

class MainMapScreen extends StatefulWidget {
  const MainMapScreen({Key? key}) : super(key: key);

  @override
  State<MainMapScreen> createState() => _MainMapScreenState();
}

class _MainMapScreenState extends State<MainMapScreen> {
  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor:
            mqData.textScaleFactor > 1.0 ? 1.0 : mqData.textScaleFactor);

    return MediaQuery(
        data: mqDataNew,
        child: Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/farm.png",
                    width: MediaQuery.of(context).size.width * 1.7,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.68,
                        top: MediaQuery.of(context).size.height * 0.2),
                    child: AnimatedContainer(
                      height: 82,
                      duration: const Duration(seconds: 3),
                      curve: Curves.fastOutSlowIn,
                      child: BouncingWidget(
                        duration: const Duration(milliseconds: 400),
                        scaleFactor: 1.5,
                        onPressed: () async {},
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/images/title_leaf.png",
                              height: 82,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 68, top: 24),
                              child: Text(
                                "စိုက်ပျိုးစနစ်ဆိုင်ရာ \nအလေ့အထများ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    height: 1.2,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LearningPage1()));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.75,
                          top: MediaQuery.of(context).size.height * 0.48),
                      child: AnimatedContainer(
                        height: 62,
                        duration: const Duration(seconds: 3),
                        curve: Curves.fastOutSlowIn,
                        child: BouncingWidget(
                          duration: const Duration(milliseconds: 400),
                          scaleFactor: 1.5,
                          onPressed: () async {},
                          child: Image.asset(
                            "assets/images/fhl.png",
                            height: 62,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LearningPage1()));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.73,
                          top: MediaQuery.of(context).size.height * 0.73),
                      child: AnimatedContainer(
                        height: 40,
                        duration: const Duration(seconds: 3),
                        curve: Curves.fastOutSlowIn,
                        child: BouncingWidget(
                          duration: const Duration(milliseconds: 400),
                          scaleFactor: 1.5,
                          onPressed: () async {},
                          child: Image.asset(
                            "assets/images/f8.png",
                            height: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LearningPage1()));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.342,
                          top: MediaQuery.of(context).size.height * 0.7),
                      child: AnimatedContainer(
                        height: 152,
                        duration: const Duration(seconds: 3),
                        curve: Curves.fastOutSlowIn,
                        child: BouncingWidget(
                          duration: const Duration(milliseconds: 400),
                          scaleFactor: 1.5,
                          onPressed: () async {},
                          child: Image.asset(
                            "assets/images/f1.png",
                            height: 152,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LearningPage1()));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.32,
                          top: MediaQuery.of(context).size.height * 0.52),
                      child: Container(
                        padding: const EdgeInsets.only(left: 12),
                        alignment: Alignment.centerLeft,
                        decoration: shadowDecorationWithBorderColor(
                            const Color.fromARGB(100, 113, 101, 45),
                            const Color.fromARGB(100, 113, 101, 45),
                            20),
                        margin: const EdgeInsets.symmetric(horizontal: 60),
                        width: MediaQuery.of(context).size.width * 0.18,
                        height: 80,
                        child: const Text(
                          '၁။ အခြေခံမြေဆီလွှာနှင့် \n  ကောင်းမွန်သော \n  မြေဆီလွှာအကြောင်း',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LearningPage1()));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.45,
                          top: MediaQuery.of(context).size.height * 0.77),
                      child: AnimatedContainer(
                        height: 48,
                        duration: const Duration(seconds: 3),
                        curve: Curves.fastOutSlowIn,
                        child: BouncingWidget(
                          duration: const Duration(milliseconds: 400),
                          scaleFactor: 1.5,
                          onPressed: () async {},
                          child: Image.asset(
                            "assets/images/target1.png",
                            height: 48,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
