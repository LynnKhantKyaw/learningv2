import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:learning/src/learning_page/learning_page1.dart';
import 'package:learning/tool_widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

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
                    width: 1500,
                  ),
                  titleSubject(
                      "စိုက်ပျိုးဂေဟစနစ်ဆိုင်ရာ \nအလေ့အထများ", 470, 80),

                  chapterButton(
                    "assets/images/f1.png",
                    166,
                    294,
                    280,
                  ),
                  subjectText(
                    "၁။ အခြေခံမြေဆီလွှာနှင့် \n  ကောင်းမွန်သော \n  မြေဆီလွှာအကြောင်း",
                    130,
                    80,
                    294,
                    210,
                  ),
                  subjectIcon(
                    "assets/images/target1.png",
                    40,
                    390,
                    300,
                  ),
                  percentIndicator(0.5, 70, 8, 380, 350),
                  //House 1
                  chapterButton(
                    "assets/images/fhl.png",
                    64,
                    550,
                    310,
                  ),
                  chapterText(
                    "၁.၁။ မြေဆီလွှာ \n အကြောင်းအခြေခံ ",
                    110,
                    54,
                    456,
                    262,
                  ),
                  percentIndicator(
                    0.7,
                    70,
                    8,
                    550,
                    370,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget percentIndicator(
      double percent, double width, double height, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: LinearPercentIndicator(
        width: width,
        animation: true,
        lineHeight: height,
        animationDuration: 1000,
        percent: percent,
        center: const Text(
          "",
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
        barRadius: const Radius.circular(14),
        progressColor: Colors.yellow,
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget chapterText(
      String text, double width, double height, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LearningPage1()));
        },
        child: Container(
          padding: const EdgeInsets.only(left: 12),
          alignment: Alignment.centerLeft,
          decoration: shadowDecorationWithBorderColor(
              const Color.fromARGB(100, 255, 255, 255),
              const Color.fromARGB(100, 255, 255, 255),
              20),
          margin: const EdgeInsets.symmetric(horizontal: 60),
          width: width,
          height: height,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black, fontSize: 11),
          ),
        ),
      ),
    );
  }

  Widget subjectText(
      String text, double width, double height, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LearningPage1()));
        },
        child: Container(
          padding: const EdgeInsets.only(left: 12),
          alignment: Alignment.centerLeft,
          decoration: shadowDecorationWithBorderColor(
              const Color.fromARGB(100, 255, 255, 255), Colors.yellow, 20),
          margin: const EdgeInsets.symmetric(horizontal: 60),
          width: width,
          height: height,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black, fontSize: 11),
          ),
        ),
      ),
    );
  }

  Widget chapterButton(String image, double size, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: AnimatedContainer(
        height: size,
        duration: const Duration(seconds: 3),
        curve: Curves.fastOutSlowIn,
        child: BouncingWidget(
          duration: const Duration(milliseconds: 400),
          scaleFactor: 1.5,
          onPressed: () async {
            Future.delayed(const Duration(milliseconds: 800), () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LearningPage1()));
            });
          },
          child: Image.asset(
            image,
            height: size,
          ),
        ),
      ),
    );
  }

  Widget subjectIcon(String image, double size, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: AnimatedContainer(
        height: size,
        duration: const Duration(seconds: 3),
        curve: Curves.fastOutSlowIn,
        child: BouncingWidget(
          duration: const Duration(milliseconds: 400),
          scaleFactor: 1.5,
          onPressed: () async {
            Future.delayed(const Duration(milliseconds: 800), () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LearningPage1()));
            });
          },
          child: Image.asset(
            image,
            height: size,
          ),
        ),
      ),
    );
  }

  Widget titleSubject(String text, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: AnimatedContainer(
        height: 56,
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
                height: 56,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 54, top: 14),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      height: 1.2,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
