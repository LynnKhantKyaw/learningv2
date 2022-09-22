import 'package:flutter/material.dart';
import 'package:learning/src/learning_page/components/background_page.dart';
import 'package:learning/src/learning_page/components/section_header.dart';
import 'package:learning/src/learning_page/learning_page2.dart';
import 'package:learning/src/responsive.dart';
import 'package:photo_view/photo_view.dart';
import 'package:just_audio/just_audio.dart' as justAudio;

import '../../tool_widgets.dart';

class LearningPage1 extends StatefulWidget {
  const LearningPage1({Key? key}) : super(key: key);

  @override
  State<LearningPage1> createState() => _LearningPage1State();
}

class _LearningPage1State extends State<LearningPage1> {
  bool textpopUpVisible = false;
  bool imagepopUpVisible = false;
  String imageChoosen = "assets/images/l1.png";
  final player = justAudio.AudioPlayer();
  String txt =
      "ကမ္ဘာမြေရဲ့ တစ်နေရာနဲ့ တစ်နေရာ၊ လယ်ကွင်းတစ်ခုရဲ့ တစ်နေရာနဲ့ တစ်နေရာ‌ပေါ် မူတည်ပြီး မြေဆီလွှာ‌တွေက ကွဲပြားမှု ရှိပါတယ်။ သူတို့ ဘယ်လိုဖြစ်‌ပေါ်လာလဲဆိုတဲ့ အပေါ်မူတည်ပြီးတော့လည်း မြေဆီလွှာတွေက ကွဲပြားမှုရှိကြပါတယ်။ မြေဆီလွှာကို ဖြစ်ပေါ်စေတဲ့ အကြောင်းအရာတွေကြောင့် မတူကွဲပြားတဲ့ မြေဆီလွှာအမျိုးမျိုး ဖြစ်ပေါ်လာရပါတယ်။ ";

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor:
            mqData.textScaleFactor > 1.0 ? 1.0 : mqData.textScaleFactor);

    return MediaQuery(
      data: mqDataNew,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 225, 255, 147),
        body: Stack(
          children: [
            const BackgroundPage(),
            const SessionHeader(),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(right: 52),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () async {
                        await playSound();
                      },
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          margin: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height * 0.3,
                              right: 12),
                          child: Image.asset(
                            "assets/images/profile1.png",
                            width: 52,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: const Color.fromARGB(200, 113, 101, 45),
                      margin: const EdgeInsets.only(top: 60),
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.54,
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.1,
                          right: 12,
                          top: 12,
                          bottom: 12),
                      child: Stack(
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              setState(() {
                                imagepopUpVisible = true;
                              });
                            },
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Image.asset(
                                "assets/images/expand.png",
                                width: 28,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Image.asset(
                            imageChoosen,
                            width: MediaQuery.of(context).size.width * 0.32,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.26,
                  width: MediaQuery.of(context).size.width * 0.74,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.1,
                      right: MediaQuery.of(context).size.width * 0.1,
                      bottom: 8),
                  padding: const EdgeInsets.only(
                      left: 24, top: 8, bottom: 8, right: 8),
                  decoration: shadowDecorationWithBorderColor(
                      const Color.fromARGB(200, 113, 101, 45),
                      const Color.fromARGB(200, 113, 101, 45),
                      4),
                  child: Stack(
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          setState(() {
                            textpopUpVisible = true;
                          });
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Image.asset(
                            "assets/images/expand.png",
                            width: 28,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Scrollbar(
                          trackVisibility: true,
                          thumbVisibility: true,
                          child: SingleChildScrollView(
                              child: Text(
                            txt,
                            style: TextStyle(
                                height: 1.7,
                                color: Colors.white,
                                fontSize:
                                    Responsive.isMobile(context) ? 16 : 19),
                          )),
                        ),
                      ),
                    ],
                  )),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Visibility(
                  visible: textpopUpVisible, child: textPopUpWidget()),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Visibility(
                  visible: imagepopUpVisible, child: imagePopUpWidget()),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 42,
                width: 42,
                margin: const EdgeInsets.only(bottom: 12, right: 20),
                decoration: shadowDecoration(Colors.white),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 20,
                  ),
                  onPressed: () {
                    if (player.playing) {
                      player.stop();
                    }
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const LearningPage2())));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> playSound() async {
    if (player.playing) {
      player.stop();
    }
    await player.setAsset('assets/audio/s1.wav', preload: true);

    await player.play();
  }

  Widget textPopUpWidget() {
    return GestureDetector(
      onTap: () {},
      child: Container(
          width: MediaQuery.of(context).size.width * 0.58,
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.13,
              bottom: Responsive.isMobile(context)
                  ? 40
                  : MediaQuery.of(context).size.height * 0.26),
          decoration: shadowDecorationWithBorderColor(
              const Color.fromARGB(255, 182, 184, 216),
              const Color.fromARGB(255, 182, 184, 216),
              12),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      textpopUpVisible = false;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/close.png",
                      width: Responsive.isMobile(context) ? 32 : 38,
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                padding: const EdgeInsets.only(
                    top: 30, left: 30, bottom: 16, right: 50),
                child: SingleChildScrollView(
                  child: Text(
                    txt,
                    textAlign: TextAlign.left,
                    style: const TextStyle(height: 1.8, fontSize: 17),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget imagePopUpWidget() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: shadowDecorationWithBorderColor(
            const Color.fromARGB(180, 0, 0, 0),
            const Color.fromARGB(180, 113, 101, 45),
            4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.98,
                    child: PhotoView(
                      imageProvider: AssetImage(imageChoosen),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        imagepopUpVisible = false;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        "assets/images/close.png",
                        width: Responsive.isMobile(context) ? 32 : 38,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
