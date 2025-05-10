import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget accordion({
  required String title,
  required String content,
  String? subtitle,
  int features = 0,
}) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.transparent),
    ),
    child: Column(
      children: [
        ExpansionTile(
          title: Text(
            title,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                content,
                style: GoogleFonts.openSans(
                  color: const Color(0xFFB4B9BD),
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
          backgroundColor: const Color(0xFF11161A),
          collapsedBackgroundColor: const Color(0xFF11161A),
          iconColor: Colors.white,
          tilePadding: EdgeInsets.fromLTRB(0, 3.0, 0, 3.0),
          subtitle: subtitle != null
              ? Text(
                  subtitle,
                  style: GoogleFonts.openSans(
                    color: Color.fromARGB(255, 79, 151, 82),
                    fontWeight: FontWeight.w500,
                  ),
                )
              : null,
          collapsedShape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.transparent),
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.transparent),
          ),
        ),
        if (features > 0)
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$features FEATURE${features > 1 ? 'S' : ''}',
                  style: TextStyle(
                    color: Colors.cyan,
                  ),
                ),
                Text(
                  'ALL FEATURES',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
      ],
    ),
  );
}
