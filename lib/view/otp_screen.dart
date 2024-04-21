import 'package:flutter/material.dart';
import 'package:muhammed_basil/controller/country_controller.dart';
import 'package:muhammed_basil/controller/otp_controller.dart';
import 'package:muhammed_basil/utils/common_colors.dart';
import 'package:muhammed_basil/view/desired_country_selection_screen.dart';
import 'package:muhammed_basil/view/widgets/common_back_button.dart';
import 'package:muhammed_basil/view/widgets/common_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  OtpScreenState createState() => OtpScreenState();
}

class OtpScreenState extends State<OtpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    final provider = Provider.of<OtpController>(context, listen: false);
    super.initState();
    provider.startCountDown();
  }

  @override
  void dispose() {
    final provider = Provider.of<OtpController>(context, listen: false);
    provider.timer.cancel();
    super.dispose();
  }

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
              child: CommonBackButton(
                ontap: () {
                  Navigator.pop(context);
                },
              ),
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
              child: Consumer<OtpController>(
                builder: (context, value, child) => Form(
                  key: _formKey,
                  child: PinCodeTextField(
                    controller: value.otpController,
                    appContext: context,
                    length: 4,
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      activeColor: const Color(0xFFD9896A),
                      inactiveColor: Colors.grey,
                      selectedColor: const Color(0xFFD9896A),
                    ),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 4) {
                        return 'Please enter valid otp';
                      }
                      return null;
                    },
                    onChanged: (value) {},
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<OtpController>(
                  builder: (context, value, child) => Text(
                    value.isResendEnabled
                        ? "Didn't receive OTP?"
                        : "Resend OTP in ${value.countDown} seconds",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<OtpController>(
                  builder: (context, value, child) => GestureDetector(
                    onTap: value.isResendEnabled
                        ? () {
                            final provider = Provider.of<CountryController>(
                                context,
                                listen: false);

                            value.resendOtp(provider.selectedCountryCode +
                                provider.phoneNumberController.text);
                          }
                        : () {},
                    child: Text(
                      'Resend OTP',
                      style: TextStyle(
                          color: value.isResendEnabled
                              ? const Color(0xFFD9896A)
                              : Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonButton(
                    text: 'Verify',
                    function: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const DesiredCountrySelectionScreen(),
                        ),
                      );
                      final countryProvider = Provider.of<CountryController>(
                          context,
                          listen: false);
                      final otpProvider =
                          Provider.of<OtpController>(context, listen: false);
                      if (_formKey.currentState!.validate()) {
                        otpProvider.verifyOtp(
                            countryProvider.selectedCountryCode +
                                countryProvider.phoneNumberController.text,
                            otpProvider.otpController.text,
                            context);
                      }
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
