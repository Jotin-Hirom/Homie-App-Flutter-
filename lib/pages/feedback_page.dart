import 'package:easy_loading_button/easy_loading_button.dart';
import 'package:emailjs/emailjs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:smarthomeui/widgets/text_widget.dart';
import 'package:smarthomeui/widgets/textfield_page.dart';


// ignore: must_be_immutable
class HelpPage extends StatefulWidget {
  HelpPage({super.key, required this.name, required this.email});
  String name;
  String email;
  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  // ignore: prefer_final_fields
  TextEditingController _controller = TextEditingController();
  Future sendEmailJS({required String message}) async {
    const serviceID = "service_nxwaj89";
    const templateID = "template_p1niott";
    const publicKeyID = "eY36LUJnTBCDYknuD";
    const privateKeyID = "yocBXM1DU1bku1QoK4YVb";
    try {
      await EmailJS.send(
        serviceID,
        templateID,
        {
          'user_name': widget.name,
          'user_email': widget.email,
          'user_subject': "Feedback from user",
          'user_message': message
        },
        const Options(
          publicKey: publicKeyID,
          privateKey: privateKeyID,
        ),
      );
      EasyLoading.showSuccess('SUCCESS!');
    } catch (error) {
      if (error is EmailJSResponseStatus) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text("ERROR...${error.status}: ${error.text}"),
              backgroundColor: Colors.red),
        );
      }
      EasyLoading.showError(error.toString());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textWidget(
            text: "Feedback", fontWeight: FontWeight.bold, fontSize: 25),
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
          padding: const EdgeInsets.all(15.0),
          child: Column(
              // // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    MyTextField(
                        label: "Send a query or a feedback?",
                        myController: _controller,
                        myInput: TextInputType.text),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      alignment: const Alignment(0, 0),
                      child: EasyButton(
                        onPressed: () async {
                          await sendEmailJS(message: _controller.value.text);
                          _controller.clear();
                          //   EasyLoading.showError("Can't send.");
                        },
                        type: EasyButtonType.elevated,
                        idleStateWidget: const Text(
                          'Send',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        loadingStateWidget: const CircularProgressIndicator(
                          strokeWidth: 3.0,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                        useWidthAnimation: true,
                        useEqualLoadingStateWidgetDimension: true,
                        width: 150.0,
                        height: 30.0,
                        borderRadius: 4.0,
                        elevation: 1,
                        contentGap: 6.0,
                        buttonColor: Colors.black,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 5,
                            color: Colors.black.withOpacity(.1)),
                      ],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: textWidget(
                      text:
                          "Up to now, only one timer mode is settable. Embedded host name should be your G-Mail display name. We further are doing this project. Stay tune for the updates with the great features."),
                ),
              ]),
        ),
      ),
    );
  }
}
