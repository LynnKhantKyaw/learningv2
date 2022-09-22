import 'package:flutter/material.dart';
import 'package:learning/tool_widgets.dart';

class PagePusherButton extends StatelessWidget {
  const PagePusherButton({
    super.key,
    required this.forward,
    required this.onTap,
  });
  final bool forward;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: forward ? Alignment.bottomRight : Alignment.bottomLeft,
      child: Container(
        height: 42,
        width: 42,
        margin: EdgeInsets.only(
            bottom: 12, right: forward ? 20 : 0, left: !forward ? 20 : 0),
        decoration: shadowDecoration(Colors.white),
        child: forward
            ? IconButton(
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 20,
                ),
                onPressed: () {
                  onTap?.call();
                },
              )
            : IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 20,
                ),
                onPressed: () {
                  onTap?.call();
                },
              ),
      ),
    );
  }
}
