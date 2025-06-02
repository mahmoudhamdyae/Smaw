import 'package:flutter/material.dart';
import 'package:smaw/core/extensions/num_extenstions.dart';
import 'package:smaw/core/resources/sizes_manager.dart';
import 'package:smaw/features/home/domain/models/order.dart';
import 'package:smaw/features/home/presentation/components/order_item.dart';

class OrderList extends StatelessWidget {

  final List<Order> orders;
  const OrderList({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: MarginsManager.mainHorizontalMargin),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: orders.length,
      separatorBuilder: (BuildContext context, int index) => 8.ph,
      itemBuilder: (BuildContext context, int index) {
        return OrderItem(order: orders[index]);
      },
    );
  }
}
