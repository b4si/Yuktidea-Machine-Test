import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:muhammed_basil/view/country_select_screen.dart';
import 'package:muhammed_basil/view/terms_and_conditions_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'asset\\onboardong_image.png',
            ),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.65,
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.35,
              decoration: const BoxDecoration(
                color: Color(0xFF292929),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0), // Adjust the radius as needed
                  topRight:
                      Radius.circular(30.0), // Adjust the radius as needed
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 18,
                  ),
                  const Text(
                    'Welcome to study lancer',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1),
                  ),
                  Text(
                    'Please selecy your role to get registered',
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const CountrySelectScreen(),
                              ));
                            },
                            child: Image.asset(
                              'asset\\student.png',
                              height: size.height * 0.16,
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: size.height * 0.14,
                              ),
                              const Text(
                                'Student',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          )
                        ],
                      ),
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const CountrySelectScreen(),
                              ));
                            },
                            child: Image.asset(
                              'asset\\agent.png',
                              height: size.height * 0.16,
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: size.height * 0.14,
                              ),
                              const Text(
                                'Agent',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'By continuing you agree to our ',
                      style: const TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: 'Terms and Conditions',
                          style: const TextStyle(
                            color: Colors.orange,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const TermsAndConditionsScreen(),
                                  ));
                            },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
