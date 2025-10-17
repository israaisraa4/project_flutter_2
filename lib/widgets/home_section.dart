import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HomeSection extends StatelessWidget {
  const HomeSection({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final String title;
  final void Function() onPressed;


  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        Text(
          title,
          style: GoogleFonts.nunito(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'See All',
            style: GoogleFonts.nunito(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
