import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Screens/aboutPage.dart';
import '../widgets/homeWidget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final PageController _pageController = PageController();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double? aboutstopPosition;

  @override
  void dispose() {
    widget._pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Positioned.fill(
          child: PageView(
            controller: widget._pageController,
            children: [
              HomeWidget(
                homeWidget: widget,
                navigate2Help: () {
                  Navigator.pushNamed(context, "/About the app");
                },
              ),
              Scaffold(
                backgroundColor: const Color(0xFF11161A),
                appBar: AppBar(
                  backgroundColor: const Color(0xFF242A2F),
                  title: Center(
                      child: Text(
                    "About the Ugandan Currency.",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  )),
                ),
                body: AboutPage(),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 15,
          child: SmoothPageIndicator(
            controller: widget._pageController,
            count: 2,
            effect: JumpingDotEffect(
                radius: 10,
                activeDotColor: const Color(0xFF11161A),
                dotColor: const Color(0xFFDDDDDD)),
          ),
        ),
      ],
    );
  }
}
