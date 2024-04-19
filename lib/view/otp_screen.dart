import 'package:flutter/material.dart';
import 'package:muhammed_basil/utils/common_colors.dart';
import 'package:muhammed_basil/view/widgets/common_back_button.dart';
import 'package:muhammed_basil/view/widgets/common_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mainColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: CommonBackButton(ontap: () {
                Navigator.pop(context);
              }),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Verify Number',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width * 0.75,
                  child: const Text(
                    'Please enter the OTP received to verify your number  ',
                    style: TextStyle(
                      color: Color(0xFFD9896A),
                      fontSize: 16,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            const Divider(
              thickness: 0.4,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
              child: PinCodeTextField(
                appContext: context,
                length: 4,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  activeColor: const Color(0xFFD9896A),
                  inactiveColor: Colors.grey,
                  selectedColor: const Color(0xFFD9896A),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn't recieve OTP?",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Resend OTP',
                  style: TextStyle(
                      color: Color(0xFFD9896A),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonButton(text: 'Verify', function: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
