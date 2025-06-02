import 'package:flutter/material.dart';
import 'package:smaw/core/resources/colors_manager.dart';
import 'package:smaw/core/resources/fonts_manager.dart';
import 'package:smaw/core/resources/language_manager.dart';
import 'package:smaw/core/resources/strings_manager.dart';
import 'package:smaw/features/home/domain/models/order.dart';

class OrderItem extends StatelessWidget {

  final Order order;
  const OrderItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: ColorsManager.gray200
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        spacing: 8,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                order.type == OrderType.absence ?
                StringsManager.homeLeaveOfAbsence.trans(context) :
                    order.type == OrderType.delay ?
                    StringsManager.homeLeaveOfDelay.trans(context) : ''
                ,
                style: FontsManager.heading4Bold(),
              ),
              Text(
                '${order.time} ${order.date}',
                style: FontsManager.captionS(),
              )
            ],
          ),

          Row(
            spacing: 8,
            children: [
              // Order Status
              Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: order.status == OrderStatus.pending ?
                  ColorsManager.supportOrangeLight :
                  order.status == OrderStatus.accepted ?
                  ColorsManager.secondaryGreenLight : Colors.transparent
                ),
                child: Row(
                  spacing: 4,
                  children: [
                    // Circle
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: order.status == OrderStatus.pending ?
                        ColorsManager.supportOrange :
                        order.status == OrderStatus.accepted ?
                        ColorsManager.supportGreen : Colors.transparent
                      ),
                    ),
                    Text(
                      order.status == OrderStatus.pending ? StringsManager.homePending.trans(context) :
                          order.status == OrderStatus.accepted ? StringsManager.homeAccepted.trans(context) :
                              StringsManager.homeAccepted.trans(context),
                      style: FontsManager.captionSBold(
                          color: order.status == OrderStatus.pending ?
                          ColorsManager.supportOrange :
                          order.status == OrderStatus.accepted ?
                          ColorsManager.supportGreen : Colors.transparent
                      ),
                    )
                  ],
                ),
              ),

              // Order Reason
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: ColorsManager.gray100
                ),
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Row(
                  spacing: 4,
                  children: [
                    Text(
                      order.type == OrderType.absence ? StringsManager.homeAbsenceReason.trans(context) :
                        order.type == OrderType.delay ? StringsManager.homeDelayReason.trans(context) :
                        StringsManager.homeDelayReason.trans(context),
                      style: FontsManager.captionS(),
                    ),
                    Text(
                      order.reasonTitle ?? '',
                      style: FontsManager.captionSBold(),
                    )
                  ],
                ),
              )
            ],
          ),

          Text(
            order.reason ?? '',
            style: FontsManager.heading5(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
