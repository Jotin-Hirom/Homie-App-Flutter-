import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarthomeui/provider/timer.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  // ignore: prefer_typing_uninitialized_variables
  var timer;

  @override
  void initState() {
    super.initState();
    timer = Provider.of<TimerProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: homeScreenBody(),
    );
  }

  Widget homeScreenBody() {
    return Consumer<TimerProvider>(
      builder: (context, timeprovider, widget) {
        return Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Center(
              child: Text(
                '${timer.hour} : ${timer.minute} : ${timer.seconds} ',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                (timer.startEnable)
                    ? ElevatedButton(
                        onPressed: timer.startTimer,
                        child: const Text('Start'),
                      )
                    : const ElevatedButton(
                        onPressed: null,
                        child: Text('Start'),
                      ),
                (timer.stopEnable)
                    ? ElevatedButton(
                        onPressed: timer.stopTimer,
                        child: const Text('Stop'),
                      )
                    : const ElevatedButton(
                        onPressed: null,
                        child: Text('Stop'),
                      ),
                // (timer.continueEnable)
                //     ? ElevatedButton(
                //         onPressed: timer.continueTimer,
                //         child: Text('Continue'),
                //       )
                //     : ElevatedButton(
                //         onPressed: null,
                //         child: Text('Continue'),
                //       ),
              ],
            ),
          ],
        );
      },
    );
  }
}



// Error: android:exported needs to be explicitly specified for element <receiver#com.dexterous.
// flutterlocalnotifications.ScheduledNotificationBootReceiver>. Apps targeting Android 12 and higher are required
// to specify an explicit value for `android:exported` when the corresponding component has an intent filter defined.

// <receiver android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationBootReceiver"
//           android:exported="true">   
// </receiver>