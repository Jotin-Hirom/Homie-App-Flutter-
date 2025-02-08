import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:smarthomeui/constants/app_text_const.dart';
import 'package:smarthomeui/widgets/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  DateTime other = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(other);
        other = DateTime.now();
        if (difference >= const Duration(seconds: 2)) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                "Double click to close the app",
                style: TextStyle(color: Colors.grey.shade800),
              ),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              )));
          return false;
        } else { 
          SystemNavigator.pop(animated: true);
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset("assets/lottie/login.json",
                fit: BoxFit.fill, height: 300),
            const Spacer(),
            AnimatedTextKit(
              repeatForever: true,
              isRepeatingAnimation: true,
              animatedTexts: [
                TyperAnimatedText(
                  'Please sign in to continue using our app',
                  curve: Curves.slowMiddle,
                  speed: const Duration(milliseconds: 100),
                  textStyle: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const SocialButton(
                iconPath: 'assets/svgs/g_logo.svg',
                label: 'Sign with Google',
                horizontalPadding: 40),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 12),
                    children: [
                      const TextSpan(
                        text: "${AppConstants.byCreating} ",
                      ),
                      TextSpan(
                          text: "${AppConstants.termsOfService} ",
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                      const TextSpan(
                        text: "and ",
                      ), 
                      TextSpan(
                          text: "${AppConstants.privacyPolicy}.",
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                    ]),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}


