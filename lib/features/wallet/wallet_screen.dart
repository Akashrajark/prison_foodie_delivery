import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prison_foodie_delivey/common_widgets/custom_button.dart';
import 'package:prison_foodie_delivey/theme/app_theme.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: [
        Material(
          borderRadius: BorderRadius.circular(10),
          color: onSurfaceColor,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Earnings',
                  style: GoogleFonts.poppins(
                    color: tertiaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '\$ 5000',
                  style: GoogleFonts.poppins(
                    color: tertiaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                CustomButton(
                  onPressed: () {},
                  label: 'Withdraw',
                  color: secondaryColor,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
