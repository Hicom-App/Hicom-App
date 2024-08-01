import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hicom/companents/filds/text_large.dart';
import 'package:hicom/companents/filds/text_small.dart';
import 'package:hicom/controllers/api_controller.dart';
import '../../companents/instrument/instrument_components.dart';
import '../../controllers/get_controller.dart';

class VerifyPageNumber extends StatelessWidget {
  final String phoneNumber;
  VerifyPageNumber({super.key, required this.phoneNumber});

  final GetController _getController = Get.put(GetController());

  @override
  Widget build(BuildContext context) {
    _getController.startTimer();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,surfaceTintColor: Colors.transparent,
          leading: IconButton(icon: Icon(Icons.arrow_back, size: Theme.of(context).iconTheme.fill), onPressed: () => Get.back()),
          actions: [
            IconButton(icon: Icon(Icons.language, size: Theme.of(context).iconTheme.fill), onPressed: () {InstrumentComponents().languageDialog(context);})
          ]
      ),
      body: Column(
        children: [
          SizedBox(height: Get.height * 0.03),
          Container(
            width: Get.width,
            margin: EdgeInsets.only(left: Get.width * 0.03, right: Get.width * 0.13),
            child: TextLarge(text: '${'Kodni kiriting'.tr}:', color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w500)
          ),
          Container(
              width: Get.width,
              margin: EdgeInsets.only(top: Get.height * 0.01, left: Get.width * 0.03, right: Get.width * 0.03,bottom: Get.height * 0.04),
              child: TextSmall(text: '${'Faollashtirish kodi'.tr} $phoneNumber ${'raqamiga SMS tarzida yuborildi.'.tr}', color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7), fontWeight: FontWeight.w500,maxLines: 10)
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: Theme.of(context).textTheme.headlineLarge!.fontSize! * 1.4,
                    height: Theme.of(context).textTheme.headlineLarge!.fontSize! * 1.6,
                    margin: EdgeInsets.only(right: 5.w, left: 5.w),
                    decoration: BoxDecoration(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: _getController.verifyCodeControllers[0],
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        } else if (value.isEmpty) {
                          FocusScope.of(context).previousFocus();
                        } else {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                    )
                ),
                Container(
                    width: Theme.of(context).textTheme.headlineLarge!.fontSize! * 1.4,
                    height: Theme.of(context).textTheme.headlineLarge!.fontSize! * 1.6,
                    margin: EdgeInsets.only(right: 5.w,left: 5.w),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextField(
                      controller: _getController.verifyCodeControllers[1],
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        } else if (value.isEmpty) {
                          FocusScope.of(context).previousFocus();
                        } else {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                    )
                ),
                Container(
                    width: Theme.of(context).textTheme.headlineLarge!.fontSize! * 1.4,
                    height: Theme.of(context).textTheme.headlineLarge!.fontSize! * 1.6,
                    margin: EdgeInsets.only(right: 5.w,left: 5.w),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextField(
                      controller: _getController.verifyCodeControllers[2],
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        } else if (value.isEmpty) {
                          FocusScope.of(context).previousFocus();
                        } else {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                    )
                ),
                Container(
                    width: Theme.of(context).textTheme.headlineLarge!.fontSize! * 1.4,
                    height: Theme.of(context).textTheme.headlineLarge!.fontSize! * 1.6,
                    margin: EdgeInsets.only(right: 5.w,left: 5.w),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextField(
                      controller: _getController.verifyCodeControllers[3],
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall,
                      decoration: const InputDecoration(border: InputBorder.none),
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        } else if (value.isEmpty) {
                          FocusScope.of(context).previousFocus();
                        } else {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                    )
                ),
                Container(
                    width: Theme.of(context).textTheme.headlineLarge!.fontSize! * 1.4,
                    height: Theme.of(context).textTheme.headlineLarge!.fontSize! * 1.6,
                    margin: EdgeInsets.only(right: 5.w,left: 5.w),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextField(
                        controller: _getController.verifyCodeControllers[4],
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall,
                        decoration: const InputDecoration(border: InputBorder.none),
                        onChanged: (value) {
                          if (value.length == 1 && _getController.verifyCodeControllers[0].text.length == 1 && _getController.verifyCodeControllers[1].text.length == 1 && _getController.verifyCodeControllers[2].text.length == 1 && _getController.verifyCodeControllers[3].text.length == 1) {
                            FocusScope.of(context).nextFocus();
                            ApiController().checkCode();
                          } else if (value.isEmpty) {
                            FocusScope.of(context).previousFocus();
                          }
                        }
                    )
                )
              ]
          ),
          Padding(padding: EdgeInsets.only(left: Get.width * 0.05, right: Get.width * 0.03,top: Get.height * 0.02),
              child: Obx(() =>_getController.countdownDuration.value.inSeconds == 0
                  ? TextButton(
                  style: ButtonStyle(overlayColor: WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.onSurface.withOpacity(0.1))),
                  onPressed: () {ApiController().sendCode();_getController.resetTimer();},
                  child: TextSmall(text: 'Kodni qayta yuborish', color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6), fontWeight: FontWeight.w500))
              :TextButton(
                  style: ButtonStyle(overlayColor: WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.onSurface.withOpacity(0.1))),
                  onPressed: () {},
                  child: TextSmall(text: '${'Kodni qayta yuborish'.tr}: ${_getController.countdownDuration.value.inMinutes.toString().padLeft(2, '0')}:${(_getController.countdownDuration.value.inSeconds % 60).toString().padLeft(2, '0')}', color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6), fontWeight: FontWeight.w500))
              )
          )
        ]
      )
    );
  }
}