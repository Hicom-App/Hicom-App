import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hicom/companents/filds/text_large.dart';
import 'package:hicom/companents/filds/text_small.dart';

class DropdownItem extends StatelessWidget {
  final String title;
  final Function onTap;

  const DropdownItem({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
            padding: EdgeInsets.only(left: Get.width * 0.03, right: Get.width * 0.03, top: Get.height * 0.015, bottom: Get.height * 0.015),
            width: Get.width,
            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                TextSmall(text: title.tr, color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400),
                const Spacer(),
                Icon(Icons.chevron_right, size: Theme.of(context).bannerTheme.elevation, color: Theme.of(context).colorScheme.onSurface)
              ]
            )
        ),
        onTap: () => onTap()
    );
  }
}