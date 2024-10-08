import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hicom/companents/filds/text_small.dart';
import 'package:hicom/controllers/get_controller.dart';

class PortItems extends StatelessWidget {

  final List<String> data;
  final List<int>? ports;
  final List<int>? portsIcons;

  const PortItems({super.key, required this.data, this.ports,required this.portsIcons});


  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5), width: Get.height * 0.003), color: Theme.of(context).colorScheme.surface),
        margin: EdgeInsets.only(bottom: Get.height * 0.01),
        padding: EdgeInsets.all(Get.height * 0.01),
        child:  data.isEmpty
            ? Row(
            children: [
              Expanded(
                  flex: 1,
                  child: SizedBox(
                      width: Get.width * 0.06,
                      child: Column(
                          children: [
                              SvgPicture.asset(GetController().getPortTypes(portsIcons?[0] ?? 0),
                                  width: Get.width * 0.022,
                                  height: Get.height * 0.022,
                                  colorFilter: ColorFilter.mode(ports?[0] == 0 ? Colors.orange : ports?[0] == 1 ? Colors.green : ports?[0] == 2 ? Colors.yellow : Theme.of(context).colorScheme.onSurface, BlendMode.srcIn)),
                            TextSmall(text: data[0], color: Theme.of(context).colorScheme.onSurface)
                          ]
                      )
                  )
              ),
              Expanded(
                  flex: 1,
                  child: SizedBox(
                      width: Get.width * 0.06,
                      child: Column(
                          children: [
                              SvgPicture.asset(GetController().getPortTypes(portsIcons?[1] ?? 0),
                                  width: Get.width * 0.022,
                                  height: Get.height * 0.022,
                                  colorFilter: ColorFilter.mode(ports?[0] == 0 ? Colors.orange : ports?[0] == 1 ? Colors.green : ports?[0] == 2 ? Colors.yellow : Theme.of(context).colorScheme.onSurface, BlendMode.srcIn)),
                            TextSmall(text: data[0], color: Theme.of(context).colorScheme.onSurface)
                          ]
                      )
                  )
              ),
              Expanded(
                  flex: 1,
                  child: SizedBox(
                      width: Get.width * 0.06,
                      child: Column(
                          children: [
                              SvgPicture.asset(GetController().getPortTypes(portsIcons?[2] ?? 0),
                                  width: Get.width * 0.022,
                                  height: Get.height * 0.022,
                                  colorFilter: ColorFilter.mode(ports?[0] == 0 ? Colors.orange : ports?[0] == 1 ? Colors.green : ports?[0] == 2 ? Colors.yellow : Theme.of(context).colorScheme.onSurface, BlendMode.srcIn)),
                            TextSmall(text: data[0], color: Theme.of(context).colorScheme.onSurface)
                          ]
                      )
                  )
              ),
              Expanded(
                  flex: 1,
                  child: SizedBox(
                      width: Get.width * 0.06,
                      child: Column(
                          children: [
                              SvgPicture.asset(GetController().getPortTypes(portsIcons?[3] ?? 0),
                                  width: Get.width * 0.022,
                                  height: Get.height * 0.022,
                                  colorFilter: ColorFilter.mode(ports?[0] == 0 ? Colors.orange : ports?[0] == 1 ? Colors.green : ports?[0] == 2 ? Colors.yellow : Theme.of(context).colorScheme.onSurface, BlendMode.srcIn)),
                            TextSmall(text: data[0], color: Theme.of(context).colorScheme.onSurface)
                          ]
                      )
                  )
              ),
              Expanded(
                  flex: 1,
                  child: SizedBox(
                      width: Get.width * 0.06,
                      child: Column(
                          children: [
                              SvgPicture.asset(GetController().getPortTypes(portsIcons?[4] ?? 0),
                                  width: Get.width * 0.022,
                                  height: Get.height * 0.022,
                                  colorFilter: ColorFilter.mode(ports?[0] == 0 ? Colors.orange : ports?[0] == 1 ? Colors.green : ports?[0] == 2 ? Colors.yellow : Theme.of(context).colorScheme.onSurface, BlendMode.srcIn)),
                            TextSmall(text: data[0], color: Theme.of(context).colorScheme.onSurface)
                          ]
                      )
                  )
              ),
              Expanded(
                  flex: 1,
                  child: SizedBox(
                      width: Get.width * 0.06,
                      child: Column(
                          children: [
                              SvgPicture.asset(GetController().getPortTypes(portsIcons?[5] ?? 0),
                                  width: Get.width * 0.022,
                                  height: Get.height * 0.022,
                                  colorFilter: ColorFilter.mode(ports?[0] == 0 ? Colors.orange : ports?[0] == 1 ? Colors.green : ports?[0] == 2 ? Colors.yellow : Theme.of(context).colorScheme.onSurface, BlendMode.srcIn)),
                            TextSmall(text: data[0], color: Theme.of(context).colorScheme.onSurface)
                          ]
                      )
                  )
              ),
              Expanded(
                  flex: 1,
                  child: SizedBox(
                      width: Get.width * 0.06,
                      child: Column(
                          children: [
                              SvgPicture.asset(GetController().getPortTypes(portsIcons?[6] ?? 0),
                                  width: Get.width * 0.022,
                                  height: Get.height * 0.022,
                                  colorFilter: ColorFilter.mode(ports?[0] == 0 ? Colors.orange : ports?[0] == 1 ? Colors.green : ports?[0] == 2 ? Colors.yellow : Theme.of(context).colorScheme.onSurface, BlendMode.srcIn)),
                            TextSmall(text: data[0], color: Theme.of(context).colorScheme.onSurface)
                          ]
                      )
                  )
              ),
              Expanded(
                  flex: 1,
                  child: SizedBox(
                      width: Get.width * 0.06,
                      child: Column(
                          children: [
                              SvgPicture.asset(GetController().getPortTypes(portsIcons?[7] ?? 0),
                                  width: Get.width * 0.022,
                                  height: Get.height * 0.022,
                                  colorFilter: ColorFilter.mode(ports?[0] == 0 ? Colors.orange : ports?[0] == 1 ? Colors.green : ports?[0] == 2 ? Colors.yellow : Theme.of(context).colorScheme.onSurface, BlendMode.srcIn)),
                            TextSmall(text: data[0], color: Theme.of(context).colorScheme.onSurface)
                          ]
                      )
                  )
              ),
              Expanded(
                  flex: 1,
                  child: SizedBox(
                      width: Get.width * 0.06,
                      child: Column(
                          children: [
                              SvgPicture.asset(GetController().getPortTypes(portsIcons?[8] ?? 0),
                                  width: Get.width * 0.022,
                                  height: Get.height * 0.022,
                                  colorFilter: ColorFilter.mode(ports?[0] == 0 ? Colors.orange : ports?[0] == 1 ? Colors.green : ports?[0] == 2 ? Colors.yellow : Theme.of(context).colorScheme.onSurface, BlendMode.srcIn)),
                            TextSmall(text: data[0], color: Theme.of(context).colorScheme.onSurface)
                          ]
                      )
                  )
              ),
              Expanded(
                  flex: 1,
                  child: SizedBox(
                      width: Get.width * 0.06,
                      child: Column(
                          children: [
                              SvgPicture.asset(GetController().getPortTypes(portsIcons?[9] ?? 0),
                                  width: Get.width * 0.022,
                                  height: Get.height * 0.022,
                                  colorFilter: ColorFilter.mode(ports?[0] == 0 ? Colors.orange : ports?[0] == 1 ? Colors.green : ports?[0] == 2 ? Colors.yellow : Theme.of(context).colorScheme.onSurface, BlendMode.srcIn)),
                            TextSmall(text: data[0], color: Theme.of(context).colorScheme.onSurface)
                          ]
                      )
                  )
              ),
            ]
        )
            : Row(
            children: [
              Expanded(
                  flex: 1,
                  child: SizedBox(
                      width: Get.width * 0.06,
                      child: Column(
                          children: [
                            if (data[0] != '')
                              SvgPicture.asset(GetController().getPortTypes(portsIcons?[0] ?? 0),
                                  width: Get.width * 0.022,
                                  height: Get.height * 0.022,
                                  colorFilter: ColorFilter.mode(ports?[0] == 0 ? Colors.orange : ports?[0] == 1 ? Colors.green : ports?[0] == 2 ? Colors.yellow : Theme.of(context).colorScheme.onSurface, BlendMode.srcIn))
                            else
                              SizedBox(width: Get.width * 0.03, height: Get.height * 0.022),
                            TextSmall(text: data[0], color: Theme.of(context).colorScheme.onSurface)
                          ]
                      )
                  )
              ),
              Expanded(
                  flex: 1,
                  child:  SizedBox(
                      width: Get.width * 0.06,
                      child: Column(
                          children: [
                            if (data[1] != '')
                              SvgPicture.asset(GetController().getPortTypes(portsIcons?[1] ?? 0),
                                  width: Get.width * 0.022,
                                  height: Get.height * 0.022,
                                  colorFilter: ColorFilter.mode(ports?[1] == 0 ? Colors.orange : ports?[1] == 1 ? Colors.green : ports?[1] == 2 ? Colors.yellow : Theme.of(context).colorScheme.onSurface, BlendMode.srcIn))
                            else
                              SizedBox(width: Get.width * 0.03, height: Get.height * 0.022),
                            TextSmall(text: data[1], color: Theme.of(context).colorScheme.onSurface)
                          ]
                      )
                  )
              ),
              Expanded(
                  flex: 1,
                  child:  SizedBox(
                      width: Get.width * 0.06,
                      child: Column(
                          children: [
                            if (data[2] != '')
                              SvgPicture.asset(GetController().getPortTypes(portsIcons?[2] ?? 0),
                                  width: Get.width * 0.022,
                                  height: Get.height * 0.022,
                                  colorFilter: ColorFilter.mode(ports?[2] == 0 ? Colors.orange : ports?[2] == 1 ? Colors.green : ports?[2] == 2 ? Colors.yellow : Theme.of(context).colorScheme.onSurface, BlendMode.srcIn))
                            else
                              SizedBox(width: Get.width * 0.03, height: Get.height * 0.022),
                            TextSmall(text: data[2], color: Theme.of(context).colorScheme.onSurface)
                          ]
                      )
                  )
              ),
              Expanded(
                  flex: 1,
                  child:  SizedBox(
                      width: Get.width * 0.06,
                      child: Column(
                          children: [
                            if (data[3] != '')
                              SvgPicture.asset(GetController().getPortTypes(portsIcons?[3] ?? 0),
                                  width: Get.width * 0.022,
                                  height: Get.height * 0.022,
                                  colorFilter: ColorFilter.mode(ports?[3] == 0 ? Colors.orange : ports?[3] == 1 ? Colors.green : ports?[3] == 2 ? Colors.yellow : Theme.of(context).colorScheme.onSurface, BlendMode.srcIn))
                            else
                              SizedBox(width: Get.width * 0.03, height: Get.height * 0.022),
                            TextSmall(text: data[3], color: Theme.of(context).colorScheme.onSurface)
                          ]
                      )
                  )
              ),
              Expanded(
                  flex: 1, // Occupies 8/12 columns
                  child:  SizedBox(
                      width: Get.width * 0.06,
                      child: Column(
                          children: [
                            if (data[4] != '')
                              SvgPicture.asset(GetController().getPortTypes(portsIcons?[4] ?? 0),
                                  width: Get.width * 0.022,
                                  height: Get.height * 0.022,
                                  colorFilter: ColorFilter.mode(ports?[4] == 0 ? Colors.orange : ports?[4] == 1 ? Colors.green : ports?[4] == 2 ? Colors.yellow : Theme.of(context).colorScheme.onSurface, BlendMode.srcIn))
                            else
                              SizedBox(width: Get.width * 0.03, height: Get.height * 0.022),
                            TextSmall(text: data[4], color: Theme.of(context).colorScheme.onSurface)
                          ]
                      )
                  )
              ),
              Expanded(
                  flex: 1, // Occupies 8/12 columns
                  child:  SizedBox(
                      width: Get.width * 0.06,
                      child: Column(
                          children: [
                            if (data[5] != '')
                              SvgPicture.asset(GetController().getPortTypes(portsIcons?[5] ?? 0),
                                  width: Get.width * 0.022,
                                  height: Get.height * 0.022,
                                  colorFilter: ColorFilter.mode(ports?[5] == 0 ? Colors.orange : ports?[5] == 1 ? Colors.green : ports?[5] == 2 ? Colors.yellow : Theme.of(context).colorScheme.onSurface, BlendMode.srcIn))
                            else
                              SizedBox(width: Get.width * 0.03, height: Get.height * 0.022),
                            TextSmall(text: data[5], color: Theme.of(context).colorScheme.onSurface)
                          ]
                      )
                  )
              )
              ,Expanded(
                  flex: 1, // Occupies 8/12 columns
                  child:  SizedBox(
                      width: Get.width * 0.06,
                      child: Column(
                          children: [
                            if (data[6] != '')
                              SvgPicture.asset(GetController().getPortTypes(portsIcons?[6] ?? 0),
                                  width: Get.width * 0.022,
                                  height: Get.height * 0.022,
                                  colorFilter: ColorFilter.mode(ports?[6] == 0 ? Colors.orange : ports?[6] == 1 ? Colors.green : ports?[6] == 2 ? Colors.yellow : Theme.of(context).colorScheme.onSurface, BlendMode.srcIn))
                            else
                              SizedBox(width: Get.width * 0.03, height: Get.height * 0.022),
                            TextSmall(text: data[6], color: Theme.of(context).colorScheme.onSurface)
                          ]
                      )
                  )
              ),Expanded(
                  flex: 1, // Occupies 8/12 columns
                  child:  SizedBox(
                      width: Get.width * 0.06,
                      child: Column(
                          children: [
                            if (data[7] != '')
                              SvgPicture.asset(GetController().getPortTypes(portsIcons?[7] ?? 0),
                                  width: Get.width * 0.022,
                                  height: Get.height * 0.022,
                                  colorFilter: ColorFilter.mode(ports?[7] == 0 ? Colors.orange : ports?[7] == 1 ? Colors.green : ports?[7] == 2 ? Colors.yellow : Theme.of(context).colorScheme.onSurface, BlendMode.srcIn))
                            else
                              SizedBox(width: Get.width * 0.03, height: Get.height * 0.022),
                            TextSmall(text: data[7], color: Theme.of(context).colorScheme.onSurface)
                          ]
                      )
                  )
              ),Expanded(
                  flex: 1, // Occupies 8/12 columns
                  child:  SizedBox(
                      width: Get.width * 0.06,
                      child: Column(
                          children: [
                            if (data[8] != '')
                              SvgPicture.asset(GetController().getPortTypes(portsIcons?[8] ?? 0),
                                  width: Get.width * 0.022,
                                  height: Get.height * 0.022,
                                  colorFilter: ColorFilter.mode(ports?[8] == 0 ? Colors.orange : ports?[8] == 1 ? Colors.green : ports?[8] == 2 ? Colors.yellow : Theme.of(context).colorScheme.onSurface, BlendMode.srcIn))
                            else
                              SizedBox(width: Get.width * 0.03, height: Get.height * 0.022),
                            TextSmall(text: data[8], color: Theme.of(context).colorScheme.onSurface)
                          ]
                      )
                  )
              ),Expanded(
                  flex: 1, // Occupies 8/12 columns
                  child:  SizedBox(
                      width: Get.width * 0.06,
                      child: Column(
                          children: [
                            if (data[9] != '')
                              SvgPicture.asset(GetController().getPortTypes(portsIcons?[9] ?? 0),
                                  width: Get.width * 0.022,
                                  height: Get.height * 0.022,
                                  colorFilter: ColorFilter.mode(ports?[9] == 0 ? Colors.orange : ports?[9] == 1 ? Colors.green : ports?[9] == 2 ? Colors.yellow : Theme.of(context).colorScheme.onSurface, BlendMode.srcIn))
                            else
                              SizedBox(width: Get.width * 0.03, height: Get.height * 0.022),
                            TextSmall(text: data[9], color: Theme.of(context).colorScheme.onSurface)
                          ]
                      )
                  )
              ),
              Expanded(
                  flex: 1, // Occupies 8/12 columns
                  child:  SizedBox(
                      width: Get.width * 0.06,
                      child: Column(
                          children: [
                            if (data[10] != '')
                              SvgPicture.asset(GetController().getPortTypes(portsIcons?[10] ?? 0),
                                  width: Get.width * 0.022,
                                  height: Get.height * 0.022,
                                  colorFilter: ColorFilter.mode(ports?[10] == 0 ? Colors.orange : ports?[10] == 1 ? Colors.green : ports?[10] == 2 ? Colors.yellow : Theme.of(context).colorScheme.onSurface, BlendMode.srcIn))
                            else
                              SizedBox(width: Get.width * 0.03, height: Get.height * 0.022),
                            TextSmall(text: data[10], color: Theme.of(context).colorScheme.onSurface)
                          ]
                      )
                  )
              ),
              Expanded(
                  flex: 1, // Occupies 8/12 columns
                  child:  SizedBox(
                      width: Get.width * 0.06,
                      child: Column(
                          children: [
                            if (data[11] != '')
                              SvgPicture.asset(GetController().getPortTypes(portsIcons?[11] ?? 0),
                                  width: Get.width * 0.022,
                                  height: Get.height * 0.022,
                                  colorFilter: ColorFilter.mode(ports?[11] == 0 ? Colors.orange : ports?[11] == 1 ? Colors.green : ports?[11] == 2 ? Colors.yellow : Theme.of(context).colorScheme.onSurface, BlendMode.srcIn))
                            else
                              SizedBox(width: Get.width * 0.03, height: Get.height * 0.022),
                            TextSmall(text: data[11], color: Theme.of(context).colorScheme.onSurface)
                          ]
                      )
                  )
              )
            ]
        )
    );
  }
}