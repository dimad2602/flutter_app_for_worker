// import 'package:flutter/material.dart';

// import '../locator_get.dart';
// import '../utils/constants.dart';

// class BigText extends StatelessWidget {
//   final Color? color;
//   final String text;
//   final double size;
//   final TextOverflow overflow;
//   final bool bold;
//   final int? maxLines;
//   final FontWeight fontWeight;
//   const BigText({
//     super.key,
//     this.color = const Color(0xFF332d2b),
//     required this.text,
//     this.size = 0,
//     this.overflow = TextOverflow.ellipsis,
//     this.bold = false,
//     this.maxLines = 1, 
//     this.fontWeight = FontWeight.w400,
//   });

//   @override
//   Widget build(BuildContext context) {
//     var sizeConstants = locator.get<Constants>();
//     return Text(
//       text,
//       maxLines: maxLines,
//       overflow: overflow,
//       style: TextStyle(
//         fontFamily: 'Roboto',
//         color: color,
//         fontSize: size==0?sizeConstants.getFont12():size,
//           fontWeight: bold==false?fontWeight:FontWeight.bold
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../locator_get.dart';
import '../utils/constants.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final TextOverflow overflow;
  final bool bold;
  final int? maxLines;
  final bool appbar;

  const BigText({
    Key? key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.size = 0,
    this.overflow = TextOverflow.ellipsis,
    this.bold = false,
    this.maxLines = 1,
    this.appbar = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizeConstants = locator.get<Constants>();
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: appbar?sizeConstants.getFont16():size==0?sizeConstants.getFont12():size,
          fontWeight: bold==false?FontWeight.w400:FontWeight.bold
      ),
    );
  }
}
