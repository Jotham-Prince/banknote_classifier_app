import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildFeatureTile({
  required IconData icon,
  required String title,
  required String subtitle,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: ListTile(
      leading: Icon(
        icon,
        color: Colors.cyan,
      ),
      title: Text(
        title,
        style: GoogleFonts.openSans(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.openSans(
          color: Color(0xFFB4B9BD),
          fontSize: 12,
        ),
      ),
    ),
  );
}
