import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smarthomeui/provider/documentation_shared_provider.dart';
import 'package:smarthomeui/widgets/text_widget.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

// ignore: must_be_immutable
class DocumentationPage extends StatefulWidget {
  DocumentationPage({
    super.key,
    required this.name,
  });
  String name;

  @override
  State<DocumentationPage> createState() => _DocumentationPageState();
}

class _DocumentationPageState extends State<DocumentationPage> {
  @override
  void initState() {
    Provider.of<Documentation>(context, listen: false)
        .loadSetting(name: widget.name);
    super.initState();
  }

  Future<void> handleRefresh() async {
    try {
      Provider.of<Documentation>(context, listen: false)
          .loadSetting(name: widget.name);
    } catch (e) {
      debugPrint(e.toString());
    }
    return Future.delayed(const Duration(milliseconds: 600));
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Documentation>(context);
    return Scaffold(
      appBar: AppBar(
        title: textWidget(
            text: "Documentation", fontWeight: FontWeight.bold, fontSize: 25),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LiquidPullToRefresh(
              onRefresh: handleRefresh,
              showChildOpacityTransition: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textWidget(text: "Your database's map is here :"),
                  const SizedBox(
                    height: 10,
                  ),
                  Consumer<Documentation>(
                    builder: (context, value, child) {
                      return Center(
                          child: SelectableText(
                        provider.map.isEmpty
                            ? provider.textString
                            : provider.resultString,
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ));
                    },
                  ),
                ],
              ),
            ),
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
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Center(
                  child: textWidget(
                text: "This map is used for developing purposes.",
              )),
            ),
          ],
        ),
      )),
    );
  }
}
