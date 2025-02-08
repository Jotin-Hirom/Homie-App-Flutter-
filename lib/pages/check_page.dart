import 'dart:async';
// import 'dart:developer';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:smarthomeui/pages/home_page.dart';
import 'package:smarthomeui/pages/login_screen.dart';
// import 'package:smarthomeui/widgets/text_widget.dart';

// ignore: must_be_immutable
class CheckPage extends StatefulWidget {
  const CheckPage({super.key});

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  // ConnectivityResult connectionStatus = ConnectivityResult.none;
  // ConnectivityResult? result;

  final Connectivity _connectivity = Connectivity();

  // late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    // initConnectivity();
    // _connectivitySubscription =
    //     _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  // Future<void> initConnectivity() async {
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     result = await _connectivity.checkConnectivity();
  //     log(result.toString());
  //   } on PlatformException catch (e) {
  //     // ignore: avoid_print
  //     print('Couldn\'t check connectivity status error: $e');
  //     return;
  //   }

  // return _updateConnectionStatus(result!);
  // }

  // Future<void> _updateConnectionStatus(ConnectivityResult result) async {
  //   if (result == ConnectivityResult.mobile ||
  //       result == ConnectivityResult.wifi ||
  //       result == ConnectivityResult.ethernet) {
  //     setState(() {
  //       connectionStatus = result;
  //     });
  //   }
  // }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder<ConnectivityResult>(
          stream: _connectivity.onConnectivityChanged,
          builder: (BuildContext context,
              AsyncSnapshot<ConnectivityResult> snapshot) {
            if (!snapshot.hasData) {
              // ignore: avoid_print
              print("connection status changed to ${snapshot.data}");
            }
            return Padding(
              padding: const EdgeInsets.all(10),
              child: CheckInternetConnectionWidget(
                  snapshot: snapshot,
                  widget: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            "assets/lottie/78499-smart-appliances.json",
                            // repeat: false,
                            animate: true,
                            fit: BoxFit.cover,
                            onLoaded: (p0) async {
                              await Future.delayed(
                                  const Duration(milliseconds: 2500));
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          FirebaseAuth.instance.currentUser !=
                                                  null
                                              ? HomePage(
                                                  displayName: FirebaseAuth
                                                      .instance
                                                      .currentUser!
                                                      .displayName
                                                      .toString(),
                                                  email: FirebaseAuth.instance
                                                      .currentUser!.email
                                                      .toString(),
                                                  photoURL: FirebaseAuth
                                                      .instance
                                                      .currentUser!
                                                      .photoURL
                                                      .toString(),
                                                )
                                              : const LoginScreen()));
                            },
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const CircularProgressIndicator(
                            color: Colors.orangeAccent,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          AnimatedTextKit(
                            repeatForever: true,
                            isRepeatingAnimation: true,
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'A Homie app that connects the room.',
                                curve: Curves.easeInToLinear,
                                speed: const Duration(milliseconds: 10),
                                textStyle: GoogleFonts.poppins(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade800),
                              ),
                            ],
                          ),
                        ]),
                  )),
            );
          },
        ),
      ),
    );
  }
}

class CheckInternetConnectionWidget extends StatelessWidget {
  final AsyncSnapshot<ConnectivityResult> snapshot;
  final Widget widget;
  const CheckInternetConnectionWidget(
      {Key? key, required this.snapshot, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (snapshot.connectionState) {
      case ConnectionState.active:
        final state = snapshot.data!;
        switch (state) {
          case ConnectivityResult.none:
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: CircularProgressIndicator(
                  color: Colors.black,
                )),
              ],
            );
          default:
            return widget;
        }
        // ignore: dead_code
        break;
      default:
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              height: 600,
              child: Center(
                child: Lottie.asset(
                  "assets/lottie/no-internet.json",
                  fit: BoxFit.fill,
                  // repeat: false,
                ),
              ),
            ),
          ),
        );
    }
  }
}
