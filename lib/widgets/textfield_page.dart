import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({
    super.key,
    required this.myController,
    required this.myInput,
    required this.label,
  });
  final TextEditingController myController;
  final TextInputType myInput;
  final String label;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: GestureDetector(
        // onTap: () {
          // SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
          //   // FocusScope.of(context).requestFocus(new FocusNode());
          //   FocusManager.instance.primaryFocus?.unfocus();

          //   // FocusScopeNode currentFocus = FocusScope.of(context);
          //   // if (!currentFocus.hasPrimaryFocus) {
          //   //   currentFocus.unfocus();
          //   // }
        // },
        child: TextFormField(
          onTapOutside: (event) {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          }, 
          // minLines: 1,
          // expands: true,
          // maxLines: 10,
          controller: widget.myController,
          keyboardType: widget.myInput,
          enabled: true,
          cursorColor: Colors.black,
          // onFieldSubmitted: (value) {},
          style: GoogleFonts.poppins(color: Colors.black),
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white70,
              hintText: widget.label,
              hintStyle: GoogleFonts.poppins(color: Colors.black54),
              labelStyle: const TextStyle(color: Colors.black),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade200)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade500))),
        ),
      ),
    );
  }
}
