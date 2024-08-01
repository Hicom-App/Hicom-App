import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hicom/companents/filds/text_small.dart';

class ItemData extends StatelessWidget {
  final String title;
  final String subtitle;
  const ItemData({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          TextSmall(text: title == '' ? '-' : title, color: Colors.black, fontWeight: FontWeight.normal, textAlign: TextAlign.start, fontSize: Get.textTheme.bodyMedium!.fontSize),
          SizedBox(width: Get.width * 0.01),
          const Spacer(),
          TextSmall(text: subtitle == '' ? '-' : subtitle, color: Colors.black, fontWeight: FontWeight.normal, textAlign: TextAlign.end, fontSize: Get.textTheme.labelMedium!.fontSize),
        ]
    );
  }
}