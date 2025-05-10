import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Screens/homePage.dart';
import '../widgets/bottomCard.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required this.homeWidget,
    required this.navigate2Help,
  });

  final MyHomePage homeWidget;
  final VoidCallback navigate2Help;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF11161A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF242A2F),
        title: Center(
          child: Text(
            homeWidget.title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        elevation: 0.0,
        actions: [
          IconButton(
            tooltip: 'Need Help?',
            icon: Image.asset(
              'assets/images/help_icon.png',
              width: 30.0,
              height: 30.0,
            ),
            onPressed: navigate2Help,
          )
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 70.0,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Welcome To Note Scan!',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Our Aim is to detect Counterfeit Bank Notes in Uganda and all over the world making Uganda a safer place.',
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Action Center',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: BottomCard(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
