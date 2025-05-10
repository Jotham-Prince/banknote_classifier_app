import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String text;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const CustomCard({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: const Color(0xFF11161A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            children: [
              Image.asset(
                imagePath,
                width: 65,
                height: 65,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        subtitle,
                        style: GoogleFonts.openSans(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                icon,
                size: 40,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
