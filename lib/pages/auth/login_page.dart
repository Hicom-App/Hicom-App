import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hicom/companents/filds/text_large.dart';
import 'package:hicom/companents/filds/text_small.dart';
import 'package:hicom/companents/instrument/instrument_components.dart';
import 'package:hicom/controllers/api_controller.dart';
import 'package:hicom/resource/colors.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../controllers/get_controller.dart';

class LoginPage extends StatelessWidget {

  LoginPage({super.key});

  final GetController _getController = Get.put(GetController());

  @override
  Widget build(BuildContext context) {
    _getController.phoneController.clear();
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,surfaceTintColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: IconButton(icon: Icon(Icons.arrow_back, size: Theme.of(context).iconTheme.fill), onPressed: () => Get.back()),
            actions: [
              IconButton(icon: Icon(Icons.language, size: Theme.of(context).iconTheme.fill), onPressed:() => InstrumentComponents().languageDialog(context)),
            ]
        ),
        body: Column(
            children: [
              SizedBox(height: Get.height * 0.03),
              Container(
                  width: Get.width,
                  margin: EdgeInsets.only(left: Get.width * 0.03, right: Get.width * 0.13),
                  child: TextLarge(text: 'Telefon raqamingizni kiriting', color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w500)
              ),
              Container(
                  width: Get.width,
                  margin: EdgeInsets.only(top: Get.height * 0.01, left: Get.width * 0.03, right: Get.width * 0.03,bottom: Get.height * 0.03),
                  child: TextSmall(text: 'Biz Tasdiqlash kodini jo‘natamiz', color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),fontWeight: FontWeight.w500,maxLines: 3)
              ),
              Container(
                  width: Get.width,
                  margin: EdgeInsets.only(left: Get.width * 0.03, right: Get.width * 0.03),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1)),
                  child: Center(
                    child: IntlPhoneField(
                      controller: _getController.phoneController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      flagsButtonPadding: EdgeInsets.only(left: Get.width * 0.01, right: Get.width * 0.01),
                      onChanged: (phone) {
                        if (phone.countryISOCode != 'uz') {
                          _getController.countryCode.value = phone.countryISOCode;
                        }
                      },
                      onCountryChanged: (phone) {
                        _getController.code.value = '+${phone.fullCountryCode}';
                        _getController.countryCode.value = phone.regionCode;
                        _getController.phoneController.clear();
                      },
                      invalidNumberMessage: null,
                      decoration: InputDecoration(
                          hintText: 'Telefon raqam'.tr,
                          hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5), fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,),
                          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(7)), borderSide: BorderSide.none),
                          counterText: '',
                          counter: null,
                          semanticCounterText: null,
                          error: null,
                          errorText: null,
                          isDense: true
                      ),
                      style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,),
                      showCountryFlag: true,
                      showCursor: true,
                      showDropdownIcon: false,
                      initialCountryCode: 'UZ',
                      dropdownTextStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,),
                    )
                  )
              ),
              const Spacer(),
              Container(
                  width: Get.width,
                  height: 50.h,
                  margin: EdgeInsets.only(left: Get.width * 0.03, right: Get.width * 0.03),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.blue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      onPressed: () => {ApiController().sendCode()},
                      child: const TextSmall(text: 'Tasdiqlash', color: AppColors.white, fontWeight: FontWeight.w500)
                  )
              ),
              SizedBox(height: Get.height * 0.05)
            ]
        )
    );
  }
}