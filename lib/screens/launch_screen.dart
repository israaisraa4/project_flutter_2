import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){
      // Navigator.pushReplacementNamed(context, '/home_screen');
      Navigator.pushReplacementNamed(context, '/bottom_navigation_screen');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            end: AlignmentDirectional.topStart,
            begin: AlignmentDirectional.bottomEnd,

              colors:const [
                 Color(0xFFA6D1E6),
                 Color(0xFFFEFBF6),
          ])
        ),
        child: Text('UI App',
        style: GoogleFonts.montserrat(
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),) ,
      ),
    );
  }
}
