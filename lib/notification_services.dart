// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  String? data;
  // FirebaseMessaging messaging = FirebaseMessaging.instance;
  @override
  void initState() {
    // messaging.getToken().then((value) => data = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(data!),
    );
  }
}
