import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prison_foodie_delivey/theme/app_theme.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: onSurfaceColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Order Id:',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.poppins(
                        color: iconColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      '#273647',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.poppins(
                        color: tertiaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Date:',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.poppins(
                        color: iconColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      '15/03/2005',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.poppins(
                        color: tertiaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Payment Method:',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.poppins(
                        color: iconColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Online',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.poppins(
                        color: tertiaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Total Payment:',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.poppins(
                        color: iconColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      '\$36',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.poppins(
                        color: tertiaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '15/03/2005',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.poppins(
                        color: tertiaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: mutedIconColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order Status:',
                        style: GoogleFonts.poppins(
                          color: tertiaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Delivered',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.poppins(
                          color: accentColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
