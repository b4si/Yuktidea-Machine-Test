import 'package:flutter/material.dart';

class CommonBackButton extends StatelessWidget {
  final VoidCallback ontap;
  const CommonBackButton({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: -2,
              blurRadius: 12,
              offset: const Offset(-5, -2),
            ),
          ],
        ),
        child: const CircleAvatar(
          radius: 20,
          backgroundColor: Color(0xFF282828),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
