import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hicom/companents/filds/text_small.dart';

class ItemPortData extends StatelessWidget {
  final String? portName;
  final String? power;
  final String? tx;
  final String? rx;
  final String? status;

  const ItemPortData({super.key,  this.portName, this.power,  this.tx,  this.rx, this.status});

  @override
  Widget build(BuildContext context) =>
     portName == null || portName == '' ? Container() : SizedBox(height: Get.height * 0.05,
         child: Row(
             children: [
               Expanded(child: Center(child: TextSmall(text: portName ?? '-', fontWeight: FontWeight.w500,fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize))),
               Expanded(child: Center(child: TextSmall(text: power ?? '-', fontWeight: FontWeight.w500,fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize))),
               Expanded(child: Center(child: TextSmall(text: tx ?? '-', fontWeight: FontWeight.w500,fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize))),
               Expanded(child: Center(child: TextSmall(text: rx ?? '-', fontWeight: FontWeight.w500,fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize))),
               Expanded(child: Center(child: TextSmall(text: status ?? '-', fontWeight: FontWeight.w500,fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize))),
             ]
         )
     );
}