import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:smarthomeui/notification_services.dart';
import 'package:smarthomeui/pages/login_screen.dart';
import 'package:smarthomeui/pages/sensors_page.dart';
import 'package:smarthomeui/pages/setting_page.dart';
import 'package:smarthomeui/pages/table_sensor_page.dart';
import 'package:smarthomeui/widgets/text_widget.dart';

// ignore: must_be_immutable
class CustomDrawer extends StatefulWidget {
  CustomDrawer(
      {super.key,
      required this.displayName,
      required this.email,
      required this.photoURL});
  String displayName;
  String email;
  String photoURL;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  Future<void> signOut() async {
    AwesomeDialog(
      dialogBackgroundColor: Colors.white,
      context: context,
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      dialogType: DialogType.noHeader,
      headerAnimationLoop: true,
      animType: AnimType.scale,
      descTextStyle: const TextStyle(color: Colors.black),
      titleTextStyle:
          GoogleFonts.poppins(fontSize: 20, color: Colors.grey.shade800),
      title: 'Hey, ${widget.displayName}',
      desc: 'Do you want to log out the app?',
      buttonsTextStyle: const TextStyle(color: Colors.black),
      // showCloseIcon: true,
      btnCancelText: "Cancel",
      btnOkText: "Log out",
      buttonsBorderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
      reverseBtnOrder: true,
      barrierColor: Colors.black54,
      btnOkColor: Colors.grey.shade100,
      btnCancelColor: Colors.redAccent.shade100,
      btnOkOnPress: () async {
        EasyLoading.show(status: 'Please wait...');
        await GoogleSignIn().signOut();
        await FirebaseAuth.instance.signOut();
        EasyLoading.showSuccess('Logged out successfully!');
        await Future.delayed(const Duration(milliseconds: 200));
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ));
      },
      btnCancelOnPress: () {
        Navigator.pop(context);
      },
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Builder(builder: (context) {
                    return IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.grey,
                      ),
                    );
                  }),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: size.width * 0.2,
                    height: size.width * 0.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        onError: (exception, stackTrace) => const Icon(
                          Icons.error,
                        ),
                        image: NetworkImage(
                          widget.photoURL,
                        ), //socket error if no internet
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(width: 2, color: Colors.grey),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textWidget(
                          text: widget.displayName,
                          color: Colors.grey.shade800,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        FittedBox(
                          fit: BoxFit.contain,
                          child: textWidget(
                            text: widget.email,
                            fontSize: 12,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 0.5,
                color: Colors.black,
                height: 40,
              ),
              drawerTile(Icons.sensors, "Sensors", () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SensorPage(
                    name: widget.displayName,
                  ),
                ));
              }),
              drawerTile(CupertinoIcons.table, "Table", () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SensorTable(
                    name: widget.displayName,
                  ),
                ));
              }),
              drawerTile(CupertinoIcons.settings_solid, "Settings", () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SettingPage(
                    name: widget.displayName,
                    email: widget.email,
                  ),
                ));
              }),
              // drawerTile(Icons.notifications, "Notification", () {
              //   Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => const NotificationPage(),
              //   ));
              // }),
              const Spacer(),
              drawerTile(CupertinoIcons.power, "Logout", signOut),
            ],
          ),
        ),
      ),
    );
  }

  ListTile drawerTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 0,
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: textWidget(
        text: title,
        color: Colors.black,
      ),
    );
  }
}
