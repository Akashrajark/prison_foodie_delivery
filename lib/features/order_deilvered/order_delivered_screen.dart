import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prison_foodie_delivey/common_widgets/custom_item_list.dart';
import 'package:prison_foodie_delivey/common_widgets/custom_user_detail_card.dart';
import 'package:prison_foodie_delivey/theme/app_theme.dart';

class OrderDeliveredScreen extends StatelessWidget {
  const OrderDeliveredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: Material(
            color: primaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              child: Text(
                textAlign: TextAlign.center,
                'Order Delivered',
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
              SizedBox(
                height: 20,
              ),
              CustomUserDetailCard(
                children: [
                  CustomItemList(),
                  CustomItemList(),
                  CustomItemList(),
                  CustomItemList(),
                  CustomItemList(),
                  CustomItemList(),
                  CustomItemList(),
                  CustomItemList(),
                ],
              )
            ],
          )),
    );
  }
}
