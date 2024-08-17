import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hicom/companents/filds/text_large.dart';
import 'package:hicom/companents/filds/text_small.dart';
import 'package:hicom/controllers/api_controller.dart';
import 'package:hicom/resource/colors.dart';
import '../../companents/instrument/instrument_components.dart';
import '../../controllers/get_controller.dart';
import 'package:pinput/pinput.dart';

class VerifyPageNumber extends StatelessWidget {
  final String phoneNumber;
  VerifyPageNumber({super.key, required this.phoneNumber});

  final GetController _getController = Get.put(GetController());

  @override
  Widget build(BuildContext context) {
    _getController.startTimer();
    final defaultPinTheme = PinTheme(
      width: Theme.of(context).textTheme.headlineLarge!.fontSize! * 1.4,
      height: Theme.of(context).textTheme.headlineLarge!.fontSize! * 1.6,
      textStyle: Theme.of(context).textTheme.headlineSmall,
      decoration: BoxDecoration(
        border: Theme.of(context).colorScheme.onSurface.withOpacity(0.1).value == 0
            ? Border.all(color: AppColors.grey.withOpacity(0.1), width: 1)
            : Border.all(color: AppColors.grey.withOpacity(0.1)),
        color: AppColors.grey.withOpacity(0.1),
        borderRadius:BorderRadius.circular(10.r)
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.blue),
      color: AppColors.grey.withOpacity(0.1),
      borderRadius: BorderRadius.circular(10.r)
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: AppColors.grey.withOpacity(0.1)
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: AppColors.red.withOpacity(0.1),
        border: Border.all(color: AppColors.red),
        borderRadius: BorderRadius.circular(10.r)
      ),
    );

    final successPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: AppColors.green.withOpacity(0.1),
        border: Border.all(color: AppColors.green),
        borderRadius: BorderRadius.circular(10.r)
      ),
    );

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
            Obx(() => Pinput(
              length: 5,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              showCursor: false,
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              forceErrorState: _getController.errorField.value,
              errorBuilder: (context, error) {
                return TextSmall(text: error, color: AppColors.red, fontWeight: FontWeight.w500);
              },
              errorPinTheme: _getController.errorFieldOk.value ? successPinTheme : errorPinTheme,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: _getController.verifyCodeControllers,
              keyboardType: TextInputType.number,
              errorTextStyle: TextStyle(color: Theme.of(context).colorScheme.error),

              onCompleted: (value) {
                ApiController().checkCode();
              }
            )),
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
            ),
          ]
      )
    );
  }
}