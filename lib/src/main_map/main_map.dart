import 'package:animated_widgets/animated_widgets.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';

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
            scrollDirection: Axis.horizontal,
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/map2.png",
                ),
                Visibility(
                  visible: true,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: TranslationAnimatedWidget.tween(
                      enabled: true,
                      delay: const Duration(milliseconds: 0),
                      translationDisabled:
                          Offset(MediaQuery.of(context).size.width, 0),
                      translationEnabled: const Offset(0, 0),
                      child: OpacityAnimatedWidget.tween(
                        enabled: true,
                        opacityDisabled: 0,
                        opacityEnabled: 1,
                        child: AnimatedContainer(
                          height: 40,
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.87,
                              bottom: 12),
                          duration: const Duration(seconds: 3),
                          curve: Curves.fastOutSlowIn,
                          child: BouncingWidget(
                            duration: const Duration(milliseconds: 400),
                            scaleFactor: 1.5,
                            onPressed: () async {},
                            child: Image.asset(
                              "assets/images/message.png",
                              height: 40,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 44, top: MediaQuery.of(context).size.height * 0.68),
                  child: AnimatedContainer(
                    height: 152,
                    duration: const Duration(seconds: 3),
                    curve: Curves.fastOutSlowIn,
                    child: BouncingWidget(
                      duration: const Duration(milliseconds: 400),
                      scaleFactor: 1.5,
                      onPressed: () async {},
                      child: Image.asset(
                        "assets/images/gf2.png",
                        height: 152,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
