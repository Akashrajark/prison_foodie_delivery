import 'package:flutter/material.dart';
import 'package:prison_foodie_delivey/common_widgets/custom_cupertin_switch.dart';
import 'package:prison_foodie_delivey/common_widgets/custom_user_detail_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: CustomCupertinoSwitch(
              value: false,
              onChanged: (value) {},
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomUserDetailCard(
            showbutton: true,
          )
        ],
      ),
    );
  }
}
