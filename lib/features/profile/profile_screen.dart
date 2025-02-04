import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prison_foodie_delivey/common_widgets/custom_button.dart';
import 'package:prison_foodie_delivey/theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: [
        Text(
          'Profile',
          style: GoogleFonts.poppins(
            color: tertiaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        ListTile(
          title: Text(
            'Ferrari Chooper',
            style: GoogleFonts.poppins(
              color: tertiaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            '#4554',
            style: GoogleFonts.poppins(
              color: tertiaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: const CircleAvatar(
            radius: 40,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomButton(
          label: 'Vehicle details',
          iconData: Icons.chevron_right,
          backGroundColor: onSurfaceColor,
          onPressed: () {},
        ),
        const SizedBox(
          height: 10,
        ),
        CustomButton(
          label: 'Logout',
          iconData: Icons.chevron_right,
          backGroundColor: onSurfaceColor,
          onPressed: () {},
        ),
        const SizedBox(
          height: 10,
        ),
        CustomButton(
          label: 'Delete account',
          iconData: Icons.chevron_right,
          backGroundColor: onSurfaceColor,
          onPressed: () {},
        ),
      ],
    );
  }
}
