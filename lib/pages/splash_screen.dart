import 'package:coffee_ui/components.dart';
import 'package:coffee_ui/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(('assets/images/background_optimized.png')),
                  fit: BoxFit.cover)),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.74)),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: CircleAvatar(
            radius: 140.0,
            foregroundImage: AssetImage('assets/images/splash_optimized.jpg'),
          ),
        ),
        Align(
          alignment: Alignment(0.0, 0.47),
          child: Text(
            'Coffee Shop',
            style: GoogleFonts.robotoSlab(color: Colors.white, fontSize: 50.0),
          ),
        ),
        Align(
          alignment: Alignment(0.0, 0.75),
          child: Container(
            width: 250.0,
            height: 80.0,
            decoration: BoxDecoration(
                color: btnClr,
                border: Border.all(color: btnClr),
                borderRadius: BorderRadius.circular(40.0)
            ),
            child: MaterialButton(
              onPressed: (){NavAndFinish(context, const HomePage());},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Text('get Started'.toUpperCase(), style: GoogleFonts.roboto(color: Colors.white, fontSize: 35.0),),
            ),
          ),
        )
      ],
    ));
  }
}
