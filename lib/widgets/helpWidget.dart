import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpPageContent extends StatefulWidget {
  const HelpPageContent(
      {super.key, this.message, this.subtext, required this.animation});
  final String? message;
  final String? subtext;
  final String animation;

  @override
  State<HelpPageContent> createState() => _HelpPageContentState();
}

class _HelpPageContentState extends State<HelpPageContent> {
  Widget pickAsset() {
    if (widget.animation.split("/")[1] == "images") {
      if (widget.animation == "assets/images/Getstarted.png") {
        return RotatedBox(
          quarterTurns: 1,
          child: Image.asset(widget.animation),
        );
      }
      return Image.asset(widget.animation);
    } else {
      if (widget.animation == "assets/images/Getstarted.png") {}
      return Lottie.asset(widget.animation, fit: BoxFit.fill);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.message ?? "",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              // const SizedBox(
              //   height: 5,
              // ),
              Text(
                widget.subtext ?? "",
                textAlign: TextAlign.center,
                style:
                    GoogleFonts.openSans(fontSize: 15.0, color: Colors.white70),
              )
            ],
          ),
          pickAsset()
        ],
      ),
    );
  }
}
