import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hicom/companents/filds/text_large.dart';
import 'package:hicom/companents/filds/text_small.dart';
import '../resource/colors.dart';

class SettingsSupportItem extends StatelessWidget {

  final Icon icon;
  final String title;
  final String subTitle;
  final Function onTap;
  final Color color;
  final bool isNightMode;
  final bool isLanguage;

  const SettingsSupportItem({super.key, required this.icon, required this.title, required this.subTitle, required this.onTap, required this.color, required this.isNightMode, required this.isLanguage});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          icon,
          SizedBox(width: Get.width * 0.03),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextLarge(text: title, color: color.withOpacity(0.6), fontWeight: FontWeight.w400),
              TextSmall(text: subTitle, color: color,  fontWeight: FontWeight.w400)
            ]
          ),
          const Spacer(),
          if (isLanguage)
            TextLarge(text: Get.locale == const Locale('uz', 'UZ') ? 'O‘zbekcha' : Get.locale == const Locale('oz', 'OZ') ? 'Узбекча' : Get.locale == const Locale('ru', 'RU') ? 'Русский' : 'English', color: color.withOpacity(0.5), fontWeight: FontWeight.w500),
          if (!isNightMode)
            IconButton(onPressed: () => onTap(), icon: Icon(Icons.chevron_right, size:  Theme.of(context).iconTheme.fill, color: color))
          else
            CupertinoSwitch(
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (value) {AdaptiveTheme.of(context).brightness == Brightness.light ? AdaptiveTheme.of(context).setDark() : AdaptiveTheme.of(context).setLight();},
              activeColor: AppColors.green,
              trackColor: AppColors.grey.withOpacity(0.5),
              focusColor: AppColors.green,
              thumbColor: Theme.of(context).colorScheme.surface,
              applyTheme: true
            )
        ]
      ),
      onTap: () => onTap()
    );
  }
}