import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prison_foodie_delivey/features/pickup%20order/pickup_order_screen.dart';
import 'package:prison_foodie_delivey/theme/app_theme.dart';
import 'package:prison_foodie_delivey/util/format_function.dart';

class CustomOrderCard extends StatelessWidget {
  final Map<String, dynamic> orderDetails;
  const CustomOrderCard({
    super.key,
    required this.orderDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: secondaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PickupOrderScreen(
                orderDetails: orderDetails,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '#${formatValue(orderDetails['order_id'])}',
                    style: GoogleFonts.poppins(
                      color: onSecondaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Total: ${formatValue(orderDetails['order_price'])}',
                    style: GoogleFonts.poppins(
                      color: onSecondaryColor,
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
                          '#${formatValue(orderDetails['user_name'])}',
                          style: GoogleFonts.poppins(
                            color: onSecondaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ), //TODO:address also backend(rpc)
                        Text(
                          'Address: Framroz Court, Ds Phalekar Road, Above Saraswat Bank, Dadar (East)',
                          style: GoogleFonts.poppins(
                            color: onSecondaryColor,
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
                            color: onSecondaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'Pickup ${formatValue(orderDetails['order_item_count'])} items',
                          style: GoogleFonts.poppins(
                            color: onSecondaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //TODO:amount driver recive
                  Text(
                    'Payment method: Online paid',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.poppins(
                      color: onSecondaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
