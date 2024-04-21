import 'package:flutter/material.dart';
import 'package:muhammed_basil/controller/country_controller.dart';
import 'package:muhammed_basil/controller/otp_controller.dart';
import 'package:muhammed_basil/controller/terms_services_controller.dart';
import 'package:muhammed_basil/controller/user_controller.dart';
import 'package:muhammed_basil/view/on_boarding_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TermsAndConditonProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CountryController(),
        ),
        ChangeNotifierProvider(
          create: (context) => OtpController(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserController(),
        )
      ],
      builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const OnBoardingScreen()),
    );
  }
}
