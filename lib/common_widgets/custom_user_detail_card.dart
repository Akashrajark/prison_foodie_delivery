import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prison_foodie_delivey/common_widgets/custom_button.dart';
import 'package:prison_foodie_delivey/features/pickup%20order/pickup_order_screen.dart';
import 'package:prison_foodie_delivey/theme/app_theme.dart';

class CustomUserDetailCard extends StatelessWidget {
  final bool showbutton;
  final List<Widget>? children;
  const CustomUserDetailCard(
      {super.key, this.showbutton = false, this.children});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: onSurfaceColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '#456456',
                style: GoogleFonts.poppins(
                  color: tertiaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'Subtotal: \$333',
                style: GoogleFonts.poppins(
                  color: tertiaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey,
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shru Tharkuri',
                      style: GoogleFonts.poppins(
                        color: tertiaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Address: Framroz Court, Ds Phalekar Road, Above Saraswat Bank, Dadar (East)',
                      style: GoogleFonts.poppins(
                        color: tertiaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order Details',
                      style: GoogleFonts.poppins(
                        color: tertiaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Pickup 4 items',
                      style: GoogleFonts.poppins(
                        color: tertiaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Payment method: Online paid',
                textAlign: TextAlign.right,
                style: GoogleFonts.poppins(
                  color: tertiaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (showbutton)
            CustomButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PickupOrderScreen(),
                ));
              },
              label: 'Delivery order',
              iconData: Icons.chevron_right,
              color: secondaryColor,
            ),
          if (children != null && children!.isNotEmpty) ...children!
        ]),
      ),
    );
  }
}
