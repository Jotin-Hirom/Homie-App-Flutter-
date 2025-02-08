import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:smarthomeui/pages/documentation_page.dart';
import 'package:smarthomeui/pages/feedback_page.dart';
// import 'package:smarthomeui/provider/theme.dart';
import 'package:smarthomeui/widgets/text_widget.dart';

// ignore: must_be_immutable
class SettingPage extends StatefulWidget {
  SettingPage({super.key, required this.name, required this.email});
  String name;
  String email;

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textWidget(
            text: "Setting Page", fontWeight: FontWeight.bold, fontSize: 25),
        backgroundColor: Colors.grey,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              CupertinoIcons.back,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              drawerTile(Icons.sensors, "Documentation", () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DocumentationPage(
                    name: widget.name,
                  ),
                ));
              }),
              drawerTile(Icons.feedback_outlined, "Feedback", () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      HelpPage(name: widget.name, email: widget.email),
                ));
              }),
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
