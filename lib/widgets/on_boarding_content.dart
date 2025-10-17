import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({super.key,required this.title,required this.subTitle ,required this.image});
  final String image;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('images/$image.png',height: 317,),
        SizedBox(height: 19),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: Column(
            children: [
              Text(
                title,
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color(0xFF23203F),
                ),
              ),

              SizedBox(height: 20.8),
              Text(
                subTitle,
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w300,
                  fontSize: 17,
                  color: Color(0xFF716F87),
                )
                ,textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
