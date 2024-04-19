import 'package:flutter/material.dart';
import 'package:muhammed_basil/utils/common_colors.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback function;
  const CommonButton({
    super.key,
    required this.text,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: function,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: mainColor,
            boxShadow: const [
              BoxShadow(
                  offset: Offset(-1, -1),
                  color: Color.fromARGB(111, 145, 145, 145),
                  blurRadius: 8,
                  spreadRadius: -2)
            ],
            borderRadius: BorderRadius.circular(30)),
        width: size.width * 0.4,
        height: size.height * 0.07,
        child: Text(
          text,
          style: const TextStyle(
              color: Color(0xFFF9D3B4),
              fontSize: 17,
              letterSpacing: 1,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
