import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:hicom/companents/filds/text_small.dart';
import 'package:hicom/controllers/api_controller.dart';
import '../../resource/colors.dart';
import '../instrument/instrument_components.dart';

class ItemSettingsData extends StatelessWidget {
  final String? projectId;
  final String? serialNumber;
  final String? portName;
  final String? poe;
  final String? extend;
  final String? reboot;
  final int? port;
  final int? poEs;
  final int? phYc;
  final String? version;
  final int? index;

  const ItemSettingsData({super.key,required this.projectId,required this.serialNumber, this.portName, this.poe, this.extend, this.reboot, this.port, this.poEs, this.phYc,required,required this.version,required this.index});

  @override
  Widget build(BuildContext context) =>
      portName == null || portName == '' ? Container() : Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(width: Get.width * 0.03),
            Center(child: Container(width: Get.width * 0.1, margin: EdgeInsets.only(top: Get.width * 0.04), child: TextSmall(text: portName ?? '--', fontWeight: FontWeight.w500, fontSize: Get.textTheme.bodyMedium!.fontSize))
          ),
            if (port != null)
              if (port! < 0)
                SizedBox(width: Get.width * 0.2, child: Center(child: Container(margin: EdgeInsets.only(top: Get.width * 0.04), child: TextSmall(text: poe ?? '--', fontWeight: FontWeight.w500, fontSize: Get.textTheme.bodyMedium!.fontSize))))
              else
                SizedBox(
                    width: Get.width * 0.2,
                    child: Center(
                        child: CupertinoSwitch(value:poEs! > 0 ? true : false,
                            onChanged: (value) {ApiController().portPOESwitch(projectId!, serialNumber!, index!, value);},
                            activeColor: AppColors.green,
                            trackColor: AppColors.grey.withOpacity(0.5),
                            focusColor: AppColors.green,
                            thumbColor: Theme.of(context).colorScheme.surface,
                            applyTheme: true
                        )
                    )
                )
            else
            SizedBox(width: Get.width * 0.2, child: Center(child: Container(margin: EdgeInsets.only(top: Get.width * 0.04), child:TextSmall(text: '--', fontWeight: FontWeight.w500, fontSize: Get.textTheme.bodyMedium!.fontSize)))),
            if(port != null)
              if (port! < 0)
                SizedBox(width: Get.width * 0.2, child: Center(child: Container(margin: EdgeInsets.only(top: Get.width * 0.04), child: TextSmall(text: extend != '0' ? extend.toString() : '--', fontWeight: FontWeight.w500, fontSize: Get.textTheme.bodyMedium!.fontSize))))
              else
                SizedBox(
                    width: Get.width * 0.2,
                    child: Center(child: CupertinoSwitch(
                        value: port != null && phYc! <= 2 ? true : false,
                        onChanged: (value) {ApiController().portExtendSwitch(projectId!, serialNumber!, index!, value, version!);},
                        activeColor: AppColors.green,
                        trackColor: AppColors.grey.withOpacity(0.5),
                        focusColor: AppColors.green,
                        thumbColor: Theme.of(context).colorScheme.surface,
                        applyTheme: true
                    ))
                )
            else
              SizedBox(width: Get.width * 0.2, child: Center(child: Container(margin: EdgeInsets.only(top: Get.width * 0.04), child:TextSmall(text: '--', fontWeight: FontWeight.w500, fontSize: Get.textTheme.bodyMedium!.fontSize)))),
            if(port != null)
              SizedBox(width: Get.width * 0.2, child: Center(child: ElevatedButton(onPressed: () {InstrumentComponents().rebootDialog(context, projectId, serialNumber, index);}, style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))), child: Icon(TablerIcons.refresh, color: Get.theme.colorScheme.onSurface, size: Get.textTheme.bodyMedium!.fontSize))))
            else
            SizedBox(width: Get.width * 0.2, child: Center(child: Container(margin: EdgeInsets.only(top: Get.width * 0.04), child: TextSmall(text: '--', fontWeight: FontWeight.w500, fontSize: Get.textTheme.bodyMedium!.fontSize))))
          ]
      );
}