import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prison_foodie_delivey/features/history/history_card.dart';
import 'package:prison_foodie_delivey/theme/app_theme.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: [
        Text(
          'History',
          textAlign: TextAlign.left,
          style: GoogleFonts.poppins(
            color: tertiaryColor,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => const HistoryCard(),
          separatorBuilder: (context, index) => const SizedBox(
            height: 20,
          ),
          itemCount: 10,
        )
      ],
    );
  }
}
