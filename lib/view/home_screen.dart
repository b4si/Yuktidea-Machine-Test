import 'package:flutter/material.dart';
import 'package:muhammed_basil/controller/user_controller.dart';
import 'package:muhammed_basil/utils/common_colors.dart';
import 'package:muhammed_basil/view/widgets/common_button.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: Consumer<UserController>(
          builder: (context, value, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.5),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              CommonButton(
                  text: "Logout",
                  function: () {
                    value.logOutUser(context);
                  }),
              SizedBox(
                height: size.height * 0.03,
              ),
              CommonButton(
                  text: "Delete User",
                  function: () {
                    value.deleteUser(context);
                  })
            ],
          ),
        ),
      )),
    );
  }
}
