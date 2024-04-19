import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muhammed_basil/controller/country_controller.dart';
import 'package:muhammed_basil/view/widgets/common_back_button.dart';
import 'package:provider/provider.dart';

class CountrySelectScreen extends StatefulWidget {
  const CountrySelectScreen({Key? key}) : super(key: key);

  @override
  _CountrySelectScreenState createState() => _CountrySelectScreenState();
}

class _CountrySelectScreenState extends State<CountrySelectScreen> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = Provider.of<CountryController>(context, listen: false);
    provider.getCountryList();
    return Scaffold(
      backgroundColor: const Color(0xFF212426),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: CommonBackButton(ontap: () {
                Navigator.of(context).pop();
              }),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Select your country',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade700,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: 19,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xFFD9896A),
                      size: 26,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 20,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Consumer<CountryController>(
                builder: (context, countryController, child) {
                  final filteredCountries = countryController.countryList
                      .where((country) => country.name!.toLowerCase().contains(
                            searchQuery.toLowerCase(),
                          ))
                      .toList();
                  return ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: 0.1,
                      );
                    },
                    itemCount: filteredCountries.length,
                    itemBuilder: (context, index) {
                      final country = filteredCountries[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: InkWell(
                          onTap: () {},
                          child: SizedBox(
                            width: size.width,
                            height: size.height * 0.09,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: size.width * 0.08,
                                        ),
                                        SizedBox(
                                          height: size.width * 0.1,
                                          width: size.width * 0.1,
                                          child: country.flag!.isEmpty
                                              ? const CircularProgressIndicator()
                                              : SvgPicture.network(
                                                  country.flag ?? ''),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SizedBox(
                                          width: size.width * 0.5,
                                          child: Text(
                                            country.name ?? '',
                                            style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: size.width * 0.16,
                                          child: Text(
                                            country.telCode ?? '',
                                            style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.05,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
