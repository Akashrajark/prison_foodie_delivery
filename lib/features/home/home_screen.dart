import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart';

import '../../common_widgets/custom_alert_dialog.dart';
import '../../common_widgets/custom_order_card.dart';
import '../../util/check_login.dart';
import 'bloc/orders_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final OrdersBloc _ordersBloc = OrdersBloc();

  Map<String, dynamic> params = {
    'query': null,
    'status': null,
  };

  List<Map<String, dynamic>> _orders = [];

  @override
  void initState() {
    checkLogin(context);
    getOrders();
    super.initState();
  }

  void getOrders() {
    _ordersBloc.add(GetAllOrdersEvent(params: params));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _ordersBloc,
      child: BlocConsumer<OrdersBloc, OrdersState>(
        listener: (context, state) {
          if (state is OrdersFailureState) {
            showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                title: 'Failure',
                description: state.message,
                primaryButton: 'Try Again',
                onPrimaryPressed: () {
                  getOrders();
                  Navigator.pop(context);
                },
              ),
            );
          } else if (state is OrdersGetSuccessState) {
            _orders = state.orders;
            Logger().w(_orders);
            setState(() {});
          } else if (state is OrdersSuccessState) {
            getOrders();
          }
        },
        builder: (context, state) {
          if (state is OrdersGetSuccessState && _orders.isEmpty) {
            return const Center(
              child: Text('No Order found'),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
            shrinkWrap: true,
            itemBuilder: (context, index) => CustomOrderCard(
              orderDetails: _orders[index],
            ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: _orders.length,
          );
        },
      ),
    );
  }
}
