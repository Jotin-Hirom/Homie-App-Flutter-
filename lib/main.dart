import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smarthomeui/firebase_options.dart';
import 'package:smarthomeui/pages/check_page.dart';
import 'package:smarthomeui/provider/timer.dart';
import 'package:smarthomeui/provider/theme.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:smarthomeui/provider/documentation_shared_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeSetting(),
        ),
        ChangeNotifierProvider(
          create: (context) => Documentation(),
        ),
        ChangeNotifierProvider(
          create: (context) => TimerProvider(),
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            builder: EasyLoading.init(),
            home: const CheckPage());
      },
    );
  }
}
