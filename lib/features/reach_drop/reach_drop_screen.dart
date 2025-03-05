import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prison_foodie_delivey/common_widgets/custom_order_card.dart';
import 'package:prison_foodie_delivey/theme/app_theme.dart';

class ReachDropScreen extends StatelessWidget {
  const ReachDropScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomSheet: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: const BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20))),
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.call,
                              color: tertiaryColor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Call",
                              style: GoogleFonts.poppins(
                                color: tertiaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20))),
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.map,
                              color: secondaryColor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Go to Map",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Material(
          color: primaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            child: Text(
              textAlign: TextAlign.center,
              'Reach Drop',
              style: GoogleFonts.poppins(
                color: secondaryColor,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: const [
            SizedBox(height: 20),
            CustomOrderCard(
              orderDetails: {},
              // children: [
              //   CustomItemList(),
              //   CustomItemList(),
              //   CustomItemList(),
              //   CustomItemList(),
              //   CustomItemList(),
              //   CustomItemList(),
              //   CustomItemList(),
              //   CustomItemList(),
              // ],
            ),
            SizedBox(height: 90), // Adds spacing to prevent overlap
          ],
        ),
      ),
    );
  }
}
