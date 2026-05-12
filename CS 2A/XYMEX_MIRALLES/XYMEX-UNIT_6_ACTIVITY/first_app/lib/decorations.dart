import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var monitorScreenDec = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  boxShadow: [
    const BoxShadow(color: Color.fromRGBO(28, 19, 43, 1.0)),
    const BoxShadow(
      color: Color.fromRGBO(49, 39, 66, 1.0),
      spreadRadius: -15.0,
      blurRadius: 15.0,
    ),
  ],
);

class CRTText extends StatelessWidget {
  const CRTText(String Text, double FontSize, {super.key})
    : text = Text,
      fontSize = FontSize;

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: GoogleFonts.sixtyfour(
        fontSize: fontSize,
        color: Colors.white,
        letterSpacing: 3,
      ),
    );
  }
}

class CRTTableRow extends StatelessWidget {
  const CRTTableRow(String row1, String row2, {super.key})
    : row_1 = row1,
      row_2 = row2;
  final String row_1;
  final String row_2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 2, child: CRTText(row_1, 12)),
          Expanded(flex: 3, child: CRTText(row_2, 12)),
        ],
      ),
    );
  }
}
