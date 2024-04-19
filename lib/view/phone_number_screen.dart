import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muhammed_basil/controller/country_controller.dart';
import 'package:muhammed_basil/controller/otp_controller.dart';
import 'package:muhammed_basil/utils/common_colors.dart';
import 'package:muhammed_basil/view/otp_screen.dart';
import 'package:muhammed_basil/view/widgets/common_back_button.dart';
import 'package:muhammed_basil/view/widgets/common_button.dart';
import 'package:provider/provider.dart';

class PhoneNumberScreen extends StatelessWidget {
  PhoneNumberScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                  'Enter phone number',
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
                    'Please enter your 10 digit mobile number to receive OTP',
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
            Consumer<CountryController>(
              builder: (context, value, child) => Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: size.width * 0.27,
                      child: TextFormField(
                        readOnly: true,
                        initialValue: "   ${value.selectedCountryCode}",
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: SizedBox(
                            width: 40,
                            height: 30,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: SvgPicture.network(
                                value.selectedCountry,
                                placeholderBuilder: (context) =>
                                    const CircularProgressIndicator(),
                              ),
                            ),
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.6,
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: value.phoneNumberController,
                          decoration: const InputDecoration(
                              hintText: '999999999',
                              hintStyle: TextStyle(color: Colors.grey)),
                          keyboardType: TextInputType.phone,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          validator: (value) {
                            if (value!.isEmpty || value.length < 10) {
                              return 'Please enter a valid number';
                            }
                            return null;
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(
                              10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<CountryController>(
                  builder: (context, value, child) => CommonButton(
                    text: 'Get OTP',
                    function: () {
                      if (_formKey.currentState!.validate()) {
                        Provider.of<OtpController>(context, listen: false)
                            .sendStudentOtpFunction(value.selectedCountryCode,
                                value.phoneNumberController.text, context);
                      }
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
