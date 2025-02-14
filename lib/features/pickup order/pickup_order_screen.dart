import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prison_foodie_delivey/common_widgets/custom_item_list.dart';
import 'package:prison_foodie_delivey/theme/app_theme.dart';

import '../../util/format_function.dart';

class PickupOrderScreen extends StatefulWidget {
  final Map<String, dynamic> orderDetails;
  const PickupOrderScreen({super.key, required this.orderDetails});

  @override
  State<PickupOrderScreen> createState() => _PickupOrderScreenState();
}

class _PickupOrderScreenState extends State<PickupOrderScreen> {
  List _orderItems = [];

  @override
  void initState() {
    _orderItems = widget.orderDetails['order_items'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Material(
                color: secondaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '#${formatValue(widget.orderDetails['order_id'])}',
                            style: GoogleFonts.poppins(
                              color: onSecondaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Total: ${formatValue(widget.orderDetails['order_price'])}',
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
                                  '#${formatValue(widget.orderDetails['user_name'])}',
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
                                  'Pickup ${formatValue(widget.orderDetails['order_item_count'])} items',
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
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => CustomItemList(
                    orderItemDetails: _orderItems[index],
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: _orderItems.length,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Material(
        color: primaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Text(
            textAlign: TextAlign.center,
            'Pickup Order',
            style: GoogleFonts.poppins(
              color: secondaryColor,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
