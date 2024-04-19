import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:muhammed_basil/controller/terms_services_provider.dart';
import 'package:provider/provider.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<TermsAndConditonProvider>(context, listen: false);
    provider.getTermsAndCondtions();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF212426),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Consumer<TermsAndConditonProvider>(
          builder: (context, value, child) => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'asset\\Close Button.png',
                      height: size.height * 0.09,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'asset\\terms_of_sevice.png',
                    height: size.height * 0.1,
                  ),
                  SizedBox(
                    width: size.width * 0.08,
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        value.termsAndConditionsModel == null
                            ? const CircularProgressIndicator()
                            : Text(
                                value.termsAndConditionsModel!.data!.title ??
                                    'No Data',
                                // 'Terms of Service',
                                style: const TextStyle(
                                  color: Color(0xFFD9896A),
                                  fontSize: 22,
                                ),
                              ),
                        value.termsAndConditionsModel == null
                            ? const CircularProgressIndicator()
                            : Text(
                                value.termsAndConditionsModel!.data!.publishedAt
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.grey.shade400, fontSize: 16),
                              ),
                      ],
                    ),
                  )
                ],
              ),
              value.termsAndConditionsModel == null
                  ? const CircularProgressIndicator()
                  : Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: HtmlWidget(
                        provider.termsAndConditionsModel!.data!.content ?? '',
                        textStyle: const TextStyle(color: Colors.white),

                        // style: const TextStyle(color: Colors.white),
                      ),
                    )
            ],
          ),
        ),
      )),
    );
  }
}
