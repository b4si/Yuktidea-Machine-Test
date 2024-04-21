import 'package:flutter/material.dart';
import 'package:muhammed_basil/controller/country_controller.dart';
import 'package:muhammed_basil/utils/common_colors.dart';
import 'package:muhammed_basil/view/home_screen.dart';
import 'package:muhammed_basil/view/widgets/common_back_button.dart';
import 'package:muhammed_basil/view/widgets/common_button.dart';
import 'package:provider/provider.dart';

class DesiredCountrySelectionScreen extends StatelessWidget {
  const DesiredCountrySelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: CommonBackButton(
              ontap: () {},
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Select Country',
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
                  'Please select the country where you want to study',
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: Consumer<CountryController>(
                builder: (context, value, child) => GridView.builder(
                  itemCount: value.desiredCountries.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    final isSelected = index == value.selectedIndex;
                    return GestureDetector(
                      onTap: () {
                        value.toggleSelection(index);
                        value.saveSelectedCountry(
                            value.desiredCountries[index].id ?? 0);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 4,
                                    color: isSelected
                                        ? Colors.amber
                                        : Colors.transparent),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  // "https://studylancer-bucket.blr1.cdn.digitaloceanspaces.com/system/canada.png",
                                  value.desiredCountries[index].image ?? '',
                                  height: size.height * 0.1,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              // 'India',
                              value.desiredCountries[index].name ?? '',
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.amber
                                    : Colors.grey.shade400,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonButton(
                  text: "Proceed",
                  function: () {
                    final provder =
                        Provider.of<CountryController>(context, listen: false);
                    if (provder.selectedIndex != -1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    }
                  }),
            ],
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Can’t see the country of your interest?',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.005,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Consult with us',
                style: TextStyle(
                  color: Color(0xFFD9896A),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
        ],
      )),
    );
  }
}
