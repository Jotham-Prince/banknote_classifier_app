import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widgets/helpWidget.dart';

class AppBrief extends StatefulWidget {
  const AppBrief({super.key});

  @override
  State<AppBrief> createState() => _AppBriefState();
}

class _AppBriefState extends State<AppBrief> {
  final PageController _pageController = PageController();
  final List<Color> backgroudColor = [
    const Color(0xFF11161A),
  ];
  int currentpage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF11161A),
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: PageView(
              controller: _pageController,
              onPageChanged: (nextpage) {
                setState(() {
                  currentpage = nextpage;
                });
              },
              children: const [
                HelpPageContent(
                  // Wellcome message
                  message: "Hello there!",
                  subtext: "I will help show you around!.",
                  animation: 'assets/images/character_one.png',
                ),
                HelpPageContent(
                  // Application Aim
                  message: "Aim...",
                  subtext: "Counterfeit bank note-detection.",
                  animation: 'assets/lottie/money.json',
                ),
                HelpPageContent(
                  // Take pictures
                  message: "Camera",
                  subtext: "An option to take snapshots of suspected notes.",
                  animation: 'assets/lottie/snapPhoto.json',
                ),
                HelpPageContent(
                  // Brouse phone storage
                  message: "Gallery ",
                  subtext:
                      "An option to Select images from your phone's gallery.",
                  animation: 'assets/images/gallery.png',
                ),
                HelpPageContent(
                  // choose multiple
                  message: "Multiple Choice",
                  subtext:
                      "Enhance speed and flexibility by processing multiple images simultaneously.",
                  animation: 'assets/lottie/ChooseMultipleTransparent.json',
                ),
                HelpPageContent(
                  // Classification
                  message: "Scan ...",
                  subtext: "Initiate image scanning and analysis",
                  animation: 'assets/lottie/analyse.json',
                ),
                HelpPageContent(
                  // Result presentation
                  message: "Detection Results",
                  subtext:
                      "AI Image recognition results will be displayed there after.",
                  animation: 'assets/images/results.png',
                ),
                HelpPageContent(
                  // Get stated
                  message: "Feeling Confident !!!.",
                  subtext:
                      "Take another tour? \n Or should we just get-started?",
                  animation: 'assets/images/confidence.png',
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: (currentpage == 7)
                      ? () {
                          _pageController.animateToPage(0,
                              duration: const Duration(seconds: 2),
                              curve: Curves.easeInOut);
                          setState(() {
                            currentpage = 0;
                          });
                        }
                      : () {
                          _pageController.animateToPage(7,
                              duration: const Duration(seconds: 2),
                              curve: Curves.easeInOut);
                          setState(() {
                            currentpage = 7;
                          });
                        },
                  icon: Icon(currentpage == 7 ? Icons.home : Icons.skip_next),
                  label: Text(
                    currentpage == 7 ? "Yes" : "Skip",
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                  iconAlignment: IconAlignment.end,
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF242A2F),
                  ),
                ),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 8,
                  effect: SlideEffect(
                      dotHeight: 8.0, // Reduced dot height
                      dotWidth: 8.0,
                      radius: 7,
                      activeDotColor:
                          Theme.of(context).colorScheme.primary.withOpacity(.7),
                      dotColor: Colors.yellow.shade200),
                ),
                TextButton.icon(
                  onPressed: () {
                    (currentpage == 7)
                        ? Navigator.pushNamed(context, "/")
                        : _pageController.nextPage(
                            duration: const Duration(microseconds: 500),
                            curve: Curves.easeIn);
                  },
                  icon: Icon(
                      currentpage == 7 ? Icons.close : Icons.arrow_forward),
                  label: Text(
                    currentpage == 7 ? "No" : "Next",
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                  iconAlignment: IconAlignment.end,
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF242A2F),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
