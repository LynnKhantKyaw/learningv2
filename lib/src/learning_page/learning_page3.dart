import 'package:flutter/material.dart';
import 'package:learning/src/learning_page/components/background_page.dart';
import 'package:learning/src/learning_page/components/section_header.dart';
import 'package:learning/src/learning_page/learning_page2.dart';
import 'package:learning/src/learning_page/learning_page4.dart';
import 'package:video_player/video_player.dart';

import '../../tool_widgets.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';

final videoPlayerController = VideoPlayerController.asset('assets/soil.mp4');

final chewieController = ChewieController(
  videoPlayerController: videoPlayerController,
  autoPlay: false,
  looping: false,
);

final playerWidget = Chewie(
  controller: chewieController,
);

class LearningPage3 extends StatefulWidget {
  const LearningPage3({Key? key}) : super(key: key);

  @override
  State<LearningPage3> createState() => _LearningPage3State();
}

class _LearningPage3State extends State<LearningPage3> {
  @override
  void initState() {
    // chewieController.deviceOrientationsAfterFullScreen = [
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    // ];
    // super.initState();
    //  SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    // ]);
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    super.initState();
    startVideo();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  startVideo() async {
    await videoPlayerController.initialize();
  }

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
                alignment: Alignment.center,
                child: Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.08,
                        bottom: MediaQuery.of(context).size.width * 0.03),
                    child:
                        AspectRatio(aspectRatio: 6 / 4, child: playerWidget))),
            // Align(
            //     alignment: Alignment.center,
            //     child: Container(
            //         margin: EdgeInsets.only(
            //             top: 90,
            //             left: MediaQuery.of(context).size.width * 0.1,
            //             right: MediaQuery.of(context).size.width * 0.1,
            //             bottom: 40),
            //         child: playerWidget)),
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
                    videoPlayerController.pause();
                    chewieController.pause();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const LearningPage4())));
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 42,
                width: 42,
                margin: const EdgeInsets.only(bottom: 12, left: 20),
                decoration: shadowDecoration(Colors.white),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 20,
                  ),
                  onPressed: () {
                    videoPlayerController.pause();
                    chewieController.pause();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const LearningPage2())));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
