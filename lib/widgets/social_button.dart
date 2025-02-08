import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smarthomeui/pages/home_page.dart';
import 'package:smarthomeui/pallete.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smarthomeui/widgets/text_widget.dart';

class SocialButton extends StatefulWidget {
  final String iconPath;
  final String label;
  final double horizontalPadding;
  const SocialButton({
    Key? key,
    required this.iconPath,
    required this.label,
    this.horizontalPadding = 100,
  }) : super(key: key);

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  bool check = false;

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn(scopes: <String>['email']).signIn();
      EasyLoading.show(
        status: 'Signing...',
      );
      // await Future.delayed(const Duration(milliseconds: 200));
      if (googleUser != null) {
        // Obtain the auth details from the request
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Once signed in, return the UserCredential
        // ignore: non_constant_identifier_names
        var UserCredentialuser =
            (await FirebaseAuth.instance.signInWithCredential(credential)).user;
        // log(UserCredentialuser.toString());

        // try {
        //   await UserCredentialuser?.sendEmailVerification();
        // } catch (e) {
        //   log(e.toString());
        // }

        // EasyLoading.dismiss();
        // User signed in successfully
        // ignore: avoid_print
        print('User signed in: ${googleUser.email}');
        // ignore: avoid_print
        print('User signed in: ${googleUser.displayName}');
        // ignore: avoid_print
        print('User signed in: ${googleUser.photoUrl}');
        // setState(() {
        //   check = true;
        // });
        // if (check == true) {
        EasyLoading.showSuccess('Logged in successfully!');
        await Future.delayed(const Duration(milliseconds: 800));
        EasyLoading.dismiss();
        DatabaseReference reference = FirebaseDatabase.instance.ref();
        log(reference.onValue.toString());
        // ignore: unnecessary_null_comparison
        if (reference.onValue == null) {
          try {
            await FirebaseDatabase.instance
                .ref()
                .child(UserCredentialuser!.displayName.toString())
                .set({
              "Connection": false,
              "Sensors": {
                "DHT11": {"Temperature": 0}
              }
            });
          } catch (e) {
            // ignore: avoid_print
            print(e.toString());
          }
        }
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomePage(
            displayName: UserCredentialuser!.displayName.toString(),
            photoURL: UserCredentialuser.photoURL.toString(),
            email: UserCredentialuser.email.toString(),
          ),
        ));
        // }
      } else {
        // User cancelled sign-in flow
        EasyLoading.showError("Can't sign in");
      }
    } on PlatformException catch (err) {
      if (err.code == 'sign_in_canceled') {
        // Checks for sign_in_canceled exception
        EasyLoading.showError("User cancelled sign-in.");
      } else {
        log(err
            .toString()); // Throws PlatformException again because it wasn't the one we wanted
      }
    } catch (e) {
      EasyLoading.showError("Failed.");
    }
    // return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextButton.icon(
        onPressed: () async {
          EasyLoading.show(status: 'Please wait...');
          await Future.delayed(const Duration(seconds: 1));
          await signInWithGoogle();
          // Navigator.of(context).pushReplacement(MaterialPageRoute(
          //   builder: (context) => HomePage(),
        },
        label: textWidget(
          text: widget.label,
          fontSize: 20,
        ),
        icon: SvgPicture.asset(
          widget.iconPath,
          width: 25,
          // ignore: deprecated_member_use
          color: Colors.black,
        ),
        style: TextButton.styleFrom(
          foregroundColor: Colors.deepPurple,
          disabledForegroundColor: Colors.pink.withOpacity(0.38),
          padding: EdgeInsets.symmetric(
              vertical: 10, horizontal: widget.horizontalPadding),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Palette.borderColor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
