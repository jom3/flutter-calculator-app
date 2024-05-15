import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  final Function callback;
  final String text;
  final double textSize;
  final int bgColor;

  const CalcButton({
    super.key,
    required this.callback,
    required this.text,
    this.textSize = 28,
    this.bgColor = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        child: SizedBox(
          width: 65,
          height: 65,
          child: TextButton(
            onPressed: () => {callback(text)},
            style: TextButton.styleFrom(
                backgroundColor: Color(bgColor),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                textStyle: const TextStyle(fontSize: 20)),
            child: Text(
              text,
              style:
                  GoogleFonts.rubik(textStyle: TextStyle(fontSize: textSize, fontWeight: FontWeight.w800)),
            ),
          ),
        ));
  }
}
