import 'package:flutter/material.dart';
import 'package:prison_foodie_delivey/features/history/history_screen.dart';
import 'package:prison_foodie_delivey/features/home/home_screen.dart';
import 'package:prison_foodie_delivey/features/profile/profile_screen.dart';
import 'package:prison_foodie_delivey/features/wallet/wallet_screen.dart';
import 'package:prison_foodie_delivey/theme/app_theme.dart';

class CustomBottomNavBarScreen extends StatefulWidget {
  const CustomBottomNavBarScreen({super.key});

  @override
  State<CustomBottomNavBarScreen> createState() =>
      _CustomBottomNavBarScreenState();
}

class _CustomBottomNavBarScreenState extends State<CustomBottomNavBarScreen> {
  int selectedindex = 0;
  List pages = [
    const HomeScreen(),
    const HistoryScreen(),
    const WalletScreen(),
    const ProfileScreen()
  ];
  void onItemTapped(int index) {
    selectedindex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: pages[selectedindex],
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: primaryColor,
              fixedColor: secondaryColor,
              onTap: onItemTapped,
              currentIndex: selectedindex,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.moped,
                      size: 30,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.work_history,
                      size: 30,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.account_balance_wallet,
                      size: 30,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.account_circle,
                      size: 30,
                    ),
                    label: ''),
              ])),
    );
  }
}
