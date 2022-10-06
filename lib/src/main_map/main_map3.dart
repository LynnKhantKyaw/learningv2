import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:learning/src/learning_page/learning_page1.dart';
import 'package:learning/src/main_map/main_map1.dart';
import 'package:learning/src/main_map/main_map2.dart';
import 'package:learning/tool_widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MainMapThirdScreen extends StatefulWidget {
  const MainMapThirdScreen({Key? key}) : super(key: key);

  @override
  State<MainMapThirdScreen> createState() => _MainMapThirdScreenState();
}

class _MainMapThirdScreenState extends State<MainMapThirdScreen> {
  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor:
            mqData.textScaleFactor > 1.0 ? 1.0 : mqData.textScaleFactor);

    return MediaQuery(
        data: mqDataNew,
        child: Scaffold(
          body: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/rubber.jpg",
                        width: 1024,
                      ),
                    ],
                  ),
                ),
              ),

              //Stable
              Positioned(
                left: 20,
                top: 8,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/wooden_small.png",
                      width: MediaQuery.of(context).size.width * 0.23,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0, left: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/frame1.png",
                            width: 28,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 4,
                              ),
                              const Text(
                                "Phyu Thant",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: [
                                  Image.asset("assets/images/ic_trophy.png",
                                      width: 18,
                                      color: const Color.fromARGB(
                                          255, 82, 57, 59)),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Image.asset("assets/images/ic_trophy.png",
                                      width: 18,
                                      color: const Color.fromARGB(
                                          255, 82, 57, 59)),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Image.asset("assets/images/ic_trophy.png",
                                      width: 18,
                                      color: const Color.fromARGB(
                                          255, 82, 57, 59)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                top: 90,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/panels_right.png",
                      height: MediaQuery.of(context).size.height * 0.6,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22, left: 14),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/frame2.png",
                            width: 28,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            "assets/images/frame2.png",
                            width: 28,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            "assets/images/frame2.png",
                            width: 28,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            "assets/images/frame2.png",
                            width: 28,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              BouncingWidget(
                duration: const Duration(milliseconds: 400),
                scaleFactor: 1.5,
                onPressed: () async {
                  Future.delayed(const Duration(milliseconds: 800), () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainMapFirstScreen()));
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(
                      top: 4, left: MediaQuery.of(context).size.width * 0.27),
                  decoration: shadowDecorationWithBorderColor(
                      const Color.fromARGB(255, 45, 99, 48),
                      const Color.fromARGB(255, 45, 99, 48),
                      0),
                  padding: const EdgeInsets.only(top: 12),
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: 60,
                  child: const Text(
                    "စိုက်ပျိုးဂေဟစနစ်ဆိုင်ရာ \nအလေ့အထများ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, height: 1.3, fontSize: 11),
                  ),
                ),
              ),
              BouncingWidget(
                duration: const Duration(milliseconds: 400),
                scaleFactor: 1.5,
                onPressed: () async {
                  Future.delayed(const Duration(milliseconds: 800), () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainMapSecondScreen()));
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(
                      top: 4, left: MediaQuery.of(context).size.width * 0.58),
                  decoration: shadowDecorationWithBorderColor(
                      const Color.fromARGB(255, 45, 99, 48),
                      const Color.fromARGB(255, 45, 99, 48),
                      0),
                  padding: const EdgeInsets.only(top: 4),
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: 60,
                  child: const Text(
                    "Developing and\nStrengthening\nFarmer Associations",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, height: 1.3, fontSize: 12),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 32, left: MediaQuery.of(context).size.width * 0.42),
                decoration: shadowDecorationWithBorderColor(
                    const Color(0xffe0e0e0), const Color(0xffe0e0e0), 0),
                padding: const EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width * 0.16,
                height: 70,
                child: const Text(
                  "Substainable\nNatural Rubber",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.black, height: 1.3, fontSize: 12),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.4,
                top: 0,
                child: Image.asset(
                  "assets/images/blue_fabric.png",
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 4, left: MediaQuery.of(context).size.width * 0.43),
                padding: const EdgeInsets.only(top: 12),
                width: MediaQuery.of(context).size.width * 0.15,
                height: 60,
                child: const Text(
                  "WWF App",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.white, height: 1.3, fontSize: 16),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.82,
                top: 8,
                child: BouncingWidget(
                  duration: const Duration(milliseconds: 400),
                  scaleFactor: 1.5,
                  onPressed: () async {},
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/button_small.png",
                        width: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 16),
                        child: Image.asset(
                          "assets/images/ic_noti.png",
                          width: 28,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.9,
                top: 8,
                child: BouncingWidget(
                  duration: const Duration(milliseconds: 400),
                  scaleFactor: 1.5,
                  onPressed: () async {},
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/button_small.png",
                        width: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 16),
                        child: Image.asset(
                          "assets/images/ic_menu.png",
                          width: 28,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.82,
                top: MediaQuery.of(context).size.height * 0.83,
                child: BouncingWidget(
                  duration: const Duration(milliseconds: 400),
                  scaleFactor: 1.5,
                  onPressed: () async {},
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/button_small.png",
                        width: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 16),
                        child: Image.asset(
                          "assets/images/ic_book.png",
                          width: 28,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.9,
                top: MediaQuery.of(context).size.height * 0.83,
                child: BouncingWidget(
                  duration: const Duration(milliseconds: 400),
                  scaleFactor: 1.5,
                  onPressed: () async {},
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/button_small.png",
                        width: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 16),
                        child: Image.asset(
                          "assets/images/ic_media.png",
                          width: 28,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget keyLock(double width, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: Image.asset(
        "assets/images/key_lock.png",
        color: Colors.yellow,
        width: width,
      ),
    );
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
            style: const TextStyle(color: Colors.black, fontSize: 10),
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
            style: const TextStyle(
                color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold),
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
                      fontSize: 12,
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
