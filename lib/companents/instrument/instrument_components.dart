import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import '../../controllers/api_controller.dart';
import '../../controllers/get_controller.dart';
import '../../controllers/tea.dart';
import '../../pages/auth/login_page.dart';
import '../../resource/colors.dart';
import '../filds/text_large.dart';
import '../filds/text_small.dart';
import '../text_fild.dart';

class InstrumentComponents {
  final GetController _getController = Get.put(GetController());

  final List locale =[
    {'name':'English','locale':const Locale('en','US')},
    {'name':'Русский','locale':const Locale('ru','RU')},
    {'name':'O‘zbekcha','locale':const Locale('uz','UZ')},
    {'name':'Ўзбекча','locale':const Locale('oz','OZ')},
  ];

  updateLanguage(Locale locale){
    Get.updateLocale(locale);
    _getController.saveLanguage(locale);
  }

  void showToast(context,String title,String message, error,sec) => Get.snackbar(
      title.tr,
      message.tr,
      backgroundColor: error ? Theme.of(context).colorScheme.error : Theme.of(context).colorScheme.onSurface,
      colorText: error ? Theme.of(context).colorScheme.onError : Theme.of(context).colorScheme.surface,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.only(bottom: Get.height * 0.03, left: Get.width * 0.04, right: Get.width * 0.04),
      borderRadius: 12,
      duration: Duration(seconds: sec),
      icon: error ? Icon(Icons.error, color: Theme.of(context).colorScheme.onError) : null
    );

  void showDialogConnectivity(context) => showDialog(context: context, builder: (BuildContext context) => AlertDialog(
          title: TextLarge(text: 'Diqqat!', color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400),
          content: TextSmall(text: 'Internet bog‘lanmadi'.tr, color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400),
          actions: <Widget>[TextButton(child: TextSmall(text: 'Iltimos, qayta urinib ko‘ring'.tr, color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400), onPressed: () {Navigator.of(context).pop();})]
  ));

  bottomBuildLanguageDialog(BuildContext context,title,cat) => Get.bottomSheet(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(right: Radius.circular(10.0),left: Radius.circular(10.0))),
        enableDrag: true,
        isScrollControlled: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SizedBox(
                  height: Get.height * 0.7,
                  width: double.infinity,
                  child: Column(
                      children: [
                        Container(height: Get.height * 0.005, width: Get.width * 0.2, margin: EdgeInsets.only(top: Get.height * 0.02, bottom: Get.height * 0.03), decoration: BoxDecoration(color: Theme.of(context).colorScheme.onSurface, borderRadius: BorderRadius.circular(10.0))),
                        TextLarge(text: title.toString(), color: Theme.of(context).colorScheme.onSurface, fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize),
                        SizedBox(height: Get.height * 0.02),
                        if (cat == 0)
                          Expanded(
                              child: ListView.builder(
                                  itemCount: _getController.provinceModel.value.regions!.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (index != 0) {
                                              Get.back();
                                              _getController.changeDropDownItems(0, index);
                                              ApiController().getRegions(Tea.encryptTea('{"country_id": 1,"region_id": ${_getController.provinceModel.value.regions![_getController.dropDownItems[0]].id.toString()}}',ApiController.key), 'districts');
                                            }
                                          });
                                        },
                                        child: Padding(
                                            padding: EdgeInsets.only(left: Get.width * 0.03, right: Get.width * 0.03),
                                            child: Column(
                                                children: [
                                                  SizedBox(height: Get.height * 0.01),
                                                  Container(
                                                      height: Get.height * 0.04,
                                                      width: Get.width,
                                                      margin: EdgeInsets.only(bottom: Get.height * 0.01),
                                                      child: Center(
                                                          child: Row(
                                                              children: [
                                                                TextSmall(text: _getController.provinceModel.value.regions![index].name.toString(), color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400),
                                                                const Spacer(),
                                                                if (_getController.dropDownItems[0] == index)
                                                                  Icon(TablerIcons.circle_check, color: Theme.of(context).colorScheme.onSurface)
                                                                else
                                                                  Icon(TablerIcons.circle, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5))
                                                              ]
                                                          )
                                                      )
                                                  ),
                                                  if (_getController.provinceModel.value.regions!.length - 1 != index)
                                                    const Divider(),
                                                  if (_getController.provinceModel.value.regions!.length - 1 == index)
                                                    SizedBox(height: Get.height * 0.01),
                                                ]
                                            )
                                        )
                                    );
                                  }
                              )
                          )
                        else if (cat == 1)
                          Expanded(
                              child: Obx(() => ListView.builder(
                                  itemCount: _getController.districtsModel.value.districts!.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                        onTap: () {
                                          if (index != 0) {
                                            Get.back();
                                            setState(() {
                                              _getController.changeDropDownItems(1, index);
                                            });
                                          }
                                        },
                                        child: Padding(padding: EdgeInsets.only(left: Get.width * 0.03, right: Get.width * 0.03),
                                            child: Column(
                                                children: [
                                                  SizedBox(height: Get.height * 0.01),
                                                  Container(
                                                      height: Get.height * 0.04,
                                                      width: Get.width,
                                                      margin: EdgeInsets.only(bottom: Get.height * 0.01),
                                                      child: Center(
                                                          child: Row(
                                                              children: [
                                                                TextSmall(text: _getController.districtsModel.value.districts![index].name.toString(), color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400),
                                                                const Spacer(),
                                                                if (_getController.dropDownItems[1] == index)
                                                                  Icon(TablerIcons.circle_check, color: Theme.of(context).colorScheme.onSurface)
                                                                else
                                                                  Icon(TablerIcons.circle, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5))
                                                              ]
                                                          )
                                                      )
                                                  ),
                                                  //if (_getController.state.length - 1 != index)
                                                  const Divider()
                                                ]
                                            )
                                        )
                                    );
                                  }
                              ))
                          )
                        else
                          Expanded(
                              child: ListView.builder(
                                  itemCount: _getController.dropDownItem.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                        onTap: () {
                                          setState(() {
                                            Get.back();
                                            _getController.changeDropDownItems(2, index);
                                          });
                                        },
                                        child: Padding(
                                            padding: EdgeInsets.only(left: Get.width * 0.03, right: Get.width * 0.03),
                                            child: Column(
                                                children: [
                                                  SizedBox(height: Get.height * 0.01),
                                                  Container(
                                                      height: Get.height * 0.04,
                                                      width: Get.width,
                                                      margin: EdgeInsets.only(bottom: Get.height * 0.01),
                                                      child: Center(
                                                          child: Row(
                                                              children: [
                                                                TextSmall(text: _getController.dropDownItem[index].tr, color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400),
                                                                const Spacer(),
                                                                if (_getController.dropDownItems[2] == index)
                                                                  Icon(TablerIcons.circle_check, color: Theme.of(context).colorScheme.onSurface)
                                                                else
                                                                  Icon(TablerIcons.circle, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5))
                                                              ]
                                                          )
                                                      )
                                                  ),
                                                  if (_getController.dropDownItem.length - 1 != index)
                                                    const Divider()
                                                ]
                                            )
                                        )
                                    );
                                  }
                              )
                          )
                      ]
                  )
              );
            })
    );

  bottomSheetEditName(BuildContext context, pidId) => Get.bottomSheet(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(right: Radius.circular(10.0),left: Radius.circular(10.0))),
        enableDrag: true,
        isScrollControlled: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                  height: Get.height * 0.45,
                  decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface, borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0))),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppBar(
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(right: Radius.circular(10.0),left: Radius.circular(10.0))),
                          title: TextLarge(text: 'Loyihani tahrirlash', color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400),
                          centerTitle: false,
                          backgroundColor: Theme.of(context).colorScheme.surface,
                          elevation: 0,
                          leadingWidth: 0,
                          leading: Container(),
                          actions: [
                            IconButton(onPressed: () => Get.back(), icon: Icon(TablerIcons.x, color: Theme.of(context).colorScheme.onSurface, size: Theme.of(context).buttonTheme.height))
                          ]
                        ),
                        SizedBox(height: Get.height * 0.02),
                        TextFields(title: '${'Loyiha nomi'.tr}:', hintText: 'Kiriting'.tr, controller: _getController.nameProjectController, maxLengthCharacters: 40),
                        SizedBox(height: Get.height * 0.02),
                        TextFields(title: '${'Qo‘shimcha ma’lumot'.tr}:',hintText: 'Kiriting'.tr, controller: _getController.noteProjectController, maxLengthCharacters: 128),
                        SizedBox(height: Get.height * 0.04),
                        Container(
                            width: Get.width,
                            padding: EdgeInsets.only(left: Get.width * 0.03, right: Get.width * 0.03),
                            child: ElevatedButton(
                                onPressed: () => {
                                  if (_getController.nameProjectController.text == '') {
                                    showToast(context, 'Diqqat!'.tr, 'Loyiha nomini kiriting.'.tr, true, 3)
                                  } else {
                                    ApiController().renameProjects(pidId, _getController.nameProjectController.text, _getController.noteProjectController.text)
                                  }
                                },
                                style: ElevatedButton.styleFrom(backgroundColor: AppColors.blue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                child: const TextSmall(text: 'Saqlash', color: AppColors.white, fontWeight: FontWeight.w400)
                            )
                        )
                      ]
                  )
              );
            })
    );

  bottomSwitchEditName(BuildContext context, pidId,sn,index,online) => Get.bottomSheet(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(right: Radius.circular(10.0),left: Radius.circular(10.0))),
        enableDrag: true,
        isScrollControlled: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                  height: Get.height * 0.45,
                  decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface, borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0))),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppBar(
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(right: Radius.circular(10.0),left: Radius.circular(10.0))),
                          title: TextLarge(text: 'Qurilmani tahrirlash', color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400),
                          centerTitle: false,
                          backgroundColor: Theme.of(context).colorScheme.surface,
                          elevation: 0,
                          leadingWidth: 0,
                          leading: Container(),
                          actions: [IconButton(onPressed: () => Get.back(), icon: Icon(TablerIcons.x, color: Theme.of(context).colorScheme.onSurface, size: Theme.of(context).buttonTheme.height))]
                        ),
                        SizedBox(height: Get.height * 0.02),
                        TextFields(title: '${'Qurilma nomi'.tr}:', hintText: 'Kiriting'.tr, controller: _getController.nameProjectController, maxLengthCharacters: 40),
                        SizedBox(height: Get.height * 0.02),
                        TextFields(title: '${'Qo‘shimcha ma’lumot'.tr}:',hintText: 'Kiriting'.tr, controller: _getController.noteProjectController, maxLengthCharacters: 128),
                        SizedBox(height: Get.height * 0.04),
                        Container(
                            width: Get.width,
                            padding: EdgeInsets.only(left: Get.width * 0.03, right: Get.width * 0.03),
                            child: ElevatedButton(
                                onPressed: () => {if (_getController.nameProjectController.text == '') showToast(context, 'Diqqat!'.tr, 'Qurilma nomini kiriting.'.tr, true, 3) else ApiController().renameSwitch(pidId, sn)},
                                style: ElevatedButton.styleFrom(backgroundColor: AppColors.blue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                child: const TextSmall(text: 'Saqlash', color: AppColors.white, fontWeight: FontWeight.w400)
                            )
                        )
                      ]
                  )
              );
            })
    );

  bottomSheetUsers(BuildContext context, pidId) => Get.bottomSheet(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(right: Radius.circular(10.0),left: Radius.circular(10.0))),
        enableDrag: true,
        isScrollControlled: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                  height: Get.height * 0.6,
                  decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface, borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0))),
                  width: double.infinity,
                  child: Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppBar(
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(right: Radius.circular(10.0),left: Radius.circular(10.0))),
                            title: TextLarge(text: 'Loyihani kuzatuvchilari', color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400),
                            centerTitle: false,
                            backgroundColor: Theme.of(context).colorScheme.surface,
                            elevation: 0,
                            leadingWidth: 0,
                            leading: Container(),
                            actions: [
                              IconButton(onPressed: () => Get.back(), icon: Icon(TablerIcons.x, color: Theme.of(context).colorScheme.onSurface, size: Theme.of(context).buttonTheme.height))
                            ]
                        ),
                        SizedBox(height: Get.height * 0.02),
                        if (_getController.getUsersModel.value.join != null)
                          ListView.builder(
                              itemCount: _getController.getUsersModel.value.join!.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ListTile(
                                    leading: Icon(Icons.person, color: Theme.of(context).colorScheme.onSurface, size: Theme.of(context).buttonTheme.height),
                                    title: TextSmall(text: _getController.getUsersModel.value.join![index].name.toString(), color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400),
                                    trailing: Icon(TablerIcons.circle, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5))
                                );
                              }
                          )
                      ]
                  ))
              );
            })
    );

  bottomSheetShare(BuildContext context, pidId) => Get.bottomSheet(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(right: Radius.circular(10.0),left: Radius.circular(10.0))),
        enableDrag: true,
        isScrollControlled: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                  height: Get.height * 0.45,
                  decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface, borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0))),
                  width: double.infinity,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppBar(
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(right: Radius.circular(10.0),left: Radius.circular(10.0))),
                            title: TextLarge(text: 'Loyihani ulashish', color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400),
                            centerTitle: false,
                            backgroundColor: Theme.of(context).colorScheme.surface,
                            elevation: 0,
                            leadingWidth: 0,
                            leading: Container(),
                            actions: [
                              IconButton(onPressed: () => Get.back(), icon: Icon(TablerIcons.x, color: Theme.of(context).colorScheme.onSurface, size: Theme.of(context).buttonTheme.height))
                            ]
                        ),
                        SizedBox(height: Get.height * 0.02),
                        TextFields(title: '${'Kuzatuvchi telefon raqami'.tr}:',hintText: 'Kiriting'.tr, controller: _getController.nameProjectController, maxLengthCharacters: 40),
                        SizedBox(height: Get.height * 0.02),
                        TextFields(title: '${'Kuzatuvchi nomi'.tr}:',hintText: 'Kiriting'.tr, controller: _getController.noteProjectController, maxLengthCharacters: 40),
                        SizedBox(height: Get.height * 0.04),
                        Container(
                          width: Get.width,
                            padding: EdgeInsets.only(left: Get.width * 0.03, right: Get.width * 0.03),
                            child: ElevatedButton(
                                onPressed: () => {
                                  if (_getController.nameProjectController.text == '') {
                                    showToast(context, 'Diqqat!'.tr,'Kuzatuvchi telefon raqami kiriting'.tr, true, 3)
                                  } else if (_getController.noteProjectController.text == '') {
                                    showToast(context, 'Diqqat!'.tr, 'Kuzatuvchi nomi kiriting'.tr, true, 3)
                                  } else {
                                    ApiController().projectShare(pidId)
                                  }
                                },
                                style: ElevatedButton.styleFrom(backgroundColor: AppColors.blue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                child: const TextSmall(text: 'Ulashish', color: AppColors.white, fontWeight: FontWeight.w400)
                            )
                        )
                      ]
                  )
              );
            })
    );

  bottomSheetProjectDelete(BuildContext context, pidId,name) => Get.bottomSheet(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(right: Radius.circular(10.0),left: Radius.circular(10.0))),
        enableDrag: true,
        isScrollControlled: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                  height: Get.height * 0.3,
                  decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface, borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0))),
                  width: double.infinity,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppBar(
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(right: Radius.circular(10.0),left: Radius.circular(10.0))),
                            title: TextLarge(text: 'Loyihani o’chirish', color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400),
                            centerTitle: false,
                            backgroundColor: Theme.of(context).colorScheme.surface,
                            elevation: 0,
                            leadingWidth: 0,
                            leading: Container(),
                            actions: [
                              IconButton(onPressed: () => Get.back(), icon: Icon(TablerIcons.x, color: Theme.of(context).colorScheme.onSurface, size: Theme.of(context).buttonTheme.height))
                            ]
                        ),
                        SizedBox(height: Get.height * 0.02),
                        Container(
                          padding: EdgeInsets.only(left: Get.width * 0.035, right: Get.width * 0.035),
                          width: Get.width,
                          child: TextSmall(text: '${_getController.getLanguage() == 'oz_OZ'|| _getController.getLanguage() == 'uz_UZ'? '"$name" ' :''}${'nomli loyihani haqiqatdan ham o‘chirishni xohlaysizmi?'.tr} ${_getController.getLanguage() == 'ru_RU'|| _getController.getLanguage() == 'en_US'? '"$name"?' :''}\n${'Loyihani o‘chirilganda uning ichidagi qurilmalar ham o‘chiriladi'.tr}', color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400,maxLines: 6)),
                        SizedBox(height: Get.height * 0.04),
                        Padding(
                            padding: EdgeInsets.only(left: Get.width * 0.03, right: Get.width * 0.03),
                            child: Obx(() => _getController.countdownDuration.value.inSeconds == 0
                                ? ElevatedButton(
                                onPressed: () => ApiController().projectDelete(pidId),
                                style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondaryColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                child:const Center(child: TextSmall(text: 'O‘chirishni tasdiqlang', color: AppColors.white, fontWeight: FontWeight.w400))
                            )
                                : ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(backgroundColor: AppColors.grey, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                child: Center(child: TextSmall(text: '${'O‘chirishni tasdiqlang'.tr} (${(_getController.countdownDuration.value.inSeconds % 60).toString()})', color: AppColors.white, fontWeight: FontWeight.w400)))
                            )
                        )
                      ]
                  )
              );
            }
        )
    );

  bottomSheetDeviceDelete(BuildContext context, pidId,sn,name) => Get.bottomSheet(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(right: Radius.circular(10.0),left: Radius.circular(10.0))),
        enableDrag: true,
        isScrollControlled: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                  height: Get.height * 0.25,
                  decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface, borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0))),
                  width: double.infinity,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppBar(
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(right: Radius.circular(10.0),left: Radius.circular(10.0))),
                            title: TextLarge(text: 'Qurilmani o’chirish'.tr, color: Theme.of(context).colorScheme.onSurface),
                            centerTitle: false,
                            backgroundColor: Theme.of(context).colorScheme.surface,
                            elevation: 0,
                            leadingWidth: 0,
                            leading: Container(),
                            actions: [
                              IconButton(onPressed: () => Get.back(), icon: Icon(TablerIcons.x, color: Theme.of(context).colorScheme.onSurface, size: Theme.of(context).buttonTheme.height))
                            ]
                        ),
                        SizedBox(height: Get.height * 0.02),
                        Container(
                          padding: EdgeInsets.only(left: Get.width * 0.035, right: Get.width * 0.035),
                          width: Get.width,
                          child: TextSmall(text: '${_getController.getLanguage() == 'oz_OZ'|| _getController.getLanguage() == 'uz_UZ'? '"$name" ' :''}${'nomli qurilmani haqiqatdan ham o‘chirishni xohlaysizmi?'.tr} ${_getController.getLanguage() == 'ru_RU'|| _getController.getLanguage() == 'en_US'? '"$name"?' :''}', color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400,maxLines: 6)
                        ),
                        SizedBox(height: Get.height * 0.04),
                        Padding(padding: EdgeInsets.only(left: Get.width * 0.03, right: Get.width * 0.03),
                            child: Obx(() => _getController.countdownDuration.value.inSeconds == 0
                                ? ElevatedButton(
                                onPressed: () => ApiController().deleteSwitch(pidId,sn),
                                style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondaryColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                child: const Center(child: TextSmall(text: 'O‘chirishni tasdiqlang', color: AppColors.white)))
                                : ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(backgroundColor: AppColors.grey, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                child: Center(child: TextSmall(text: '${'O‘chirishni tasdiqlang'.tr} (${(_getController.countdownDuration.value.inSeconds % 60).toString()})', color: AppColors.white)))
                            )
                        )
                      ]
                  )
              );
            }
        )
    );

  void infoPortDialog(BuildContext context) => Get.dialog(
        AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: TextLarge(text: 'Portlar holati'.tr, color: Theme.of(context).colorScheme.onSurface),
          content: SizedBox(
            width: Get.width,
            height: Get.height* 0.058,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      child: Column(
                          children: [
                            SvgPicture.asset('assets/svg_assets/port.svg', width: Get.width * 0.03, height: Get.height * 0.03,colorFilter: const ColorFilter.mode(AppColors.green, BlendMode.srcIn)),
                            TextSmall(text: 'Yaxshi'.tr, color: Theme.of(context).colorScheme.onSurface)
                          ]
                      )
                  ),
                  SizedBox(width: Get.width * 0.01),
                  SizedBox(
                      child: Column(
                          children: [
                            SvgPicture.asset('assets/svg_assets/port.svg', width: Get.width * 0.03, height: Get.height * 0.03,colorFilter: const ColorFilter.mode(AppColors.yellow, BlendMode.srcIn)),
                            TextSmall(text: 'Normal'.tr, color: Theme.of(context).colorScheme.onSurface)
                          ]
                      )
                  ),
                  SizedBox(width: Get.width * 0.01),
                  SizedBox(
                      child: Column(
                          children: [
                            SvgPicture.asset('assets/svg_assets/port.svg', width: Get.width * 0.03, height: Get.height * 0.03,colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn)),
                            TextSmall(text: 'Past'.tr, color: Theme.of(context).colorScheme.onSurface)
                          ]
                      )
                  ),
                  SizedBox(width: Get.width * 0.01),
                  SizedBox(
                      child: Column(
                          children: [
                            SvgPicture.asset('assets/svg_assets/port.svg', width: Get.width * 0.03, height: Get.height * 0.03,colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onSurface, BlendMode.srcIn)),
                            TextSmall(text: 'O`chiq'.tr, color: Theme.of(context).colorScheme.onSurface)
                          ]
                      )
                  )
                ]
            ),
          ),
          actions: [
            Column(
              children: [
                TextSmall(text: 'dialoglar'.tr, color: Theme.of(context).colorScheme.onSurface,maxLines: 10),
                Padding(padding: EdgeInsets.only(top: Get.height * 0.01), child: const Divider()),
                SizedBox(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      overlayColor: AppColors.blue.withOpacity(0.1),),
                      onPressed: () => {Get.back()}, child: TextSmall(text: 'Ok'.tr, color: Theme.of(context).colorScheme.primary))
                )
              ]
            )
          ]
        )
    );

  void loadingDialogs(BuildContext context) {
    final GetController getController = Get.put(GetController());
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        title: TextLarge(text: 'Kuting!', color: Theme.of(context).colorScheme.onSurface),
        content: SizedBox(
          height: Get.height * 0.055,
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [CircularProgressIndicator(color: Theme.of(context).colorScheme.primary,valueColor: const AlwaysStoppedAnimation<Color>(AppColors.blue))])
        )
      )
    );

    ever<bool>(getController.back, (back) {
      if (!back) {
        getController.back.value = true;  // Reset back value
        if (Get.isDialogOpen ?? false) {
          Get.back();  // Close the dialog
        }
      }
    });
  }

  void logOutDialog(BuildContext context) => Get.dialog(
        AlertDialog(
          title: TextLarge(text: 'Tasdiqlash', color: Theme.of(context).colorScheme.error),
          content: TextSmall(text: 'Hisobdan chiqishni xohlaysizmi?', color: Theme.of(context).colorScheme.onSurface),
          actions: [
            TextButton(
                onPressed: () => Get.back(),
                child: TextSmall(text: 'Bekor qilish', color: Theme.of(context).colorScheme.primary)
            ),
            TextButton(
                onPressed: () => {
                  Get.back(),
                  _getController.isRequest.value = true,
                  _getController.sec.value = 0,
                  _getController.clearKey(),
                  _getController.clearUid(),
                  _getController.clearUser(),
                  Get.offAll(() => LoginPage())
                },
                child: TextSmall(text: 'Ha', color: Theme.of(context).colorScheme.primary)
            )
          ]
        )
    );

  void restartDialog(BuildContext context,String pidId, String sn) => Get.dialog(
      AlertDialog(
          title: TextLarge(text: 'Diqqat!', color: Theme.of(context).colorScheme.error),
          content: TextSmall(text: 'Qurilmani o‘chirib yoqish'.tr, color: Theme.of(context).colorScheme.onSurface),
          actions: [
            TextButton(onPressed: () => Get.back(), child: TextSmall(text: 'Bekor qilish', color: Theme.of(context).colorScheme.primary)),
            TextButton(onPressed: () => {Get.back(), ApiController().switchReboot(pidId.toString(), sn.toString())}, child: TextSmall(text: 'Ha', color: Theme.of(context).colorScheme.primary))
          ]
      )
  );

  void languageDialog(BuildContext context) => Get.bottomSheet(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(right: Radius.circular(10.0),left: Radius.circular(10.0))),
        enableDrag: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SizedBox(
                  height: Get.height * 0.5,
                  width: double.infinity,
                  child: Column(
                      children: [
                        Container(
                            height: Get.height * 0.005,
                            width: Get.width * 0.2,
                            margin: EdgeInsets.only(top: Get.height * 0.02, bottom: Get.height * 0.03),
                            decoration: BoxDecoration(color: Theme.of(context).colorScheme.onSurface, borderRadius: BorderRadius.circular(10.0))
                        ),
                        TextLarge(text: 'Tilni tanlang'.tr, color: Theme.of(context).colorScheme.onSurface, fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize),
                        SizedBox(height: Get.height * 0.04),
                        Expanded(
                            child: ListView.builder(
                                itemCount: locale.length,
                                itemBuilder: (context, index){
                                  return Container(
                                      height: Get.height * 0.07,
                                      width: double.infinity,
                                      padding: EdgeInsets.only(left: Get.width * 0.035, right: Get.width * 0.035),
                                      child: Column(
                                        children: [
                                          InkWell(
                                              overlayColor: WidgetStateProperty.all(Colors.transparent),
                                              child: Column(
                                                children: [
                                                  Row(
                                                      children: [
                                                        TextSmall(text: locale[index]['name'], color: Theme.of(context).colorScheme.onSurface, fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize),
                                                        const Spacer(),
                                                        if (locale[index]['locale'].toString() == _getController.language.toString())
                                                          Icon(TablerIcons.circle_check, color: Theme.of(context).colorScheme.onSurface),
                                                        if (locale[index]['locale'].toString() != _getController.language.toString())
                                                          Icon(TablerIcons.circle, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5))
                                                      ]
                                                  ),
                                                  SizedBox(height: Get.height * 0.01)
                                                ]
                                              ),
                                              onTap: (){
                                                updateLanguage(locale[index]['locale']);
                                                Get.back();
                                              }
                                          ),
                                          if (index != locale.length - 1)
                                          const Divider()
                                        ],
                                      )
                                  );
                                }
                            )
                        )
                      ]
                  )
              );
            })
    );

  void rebootDialog(BuildContext context,projectId,serialNumber,index) => Get.dialog(
        AlertDialog(
          title: TextLarge(text: 'Diqqat!', color: Theme.of(context).colorScheme.error),
          content: TextSmall(text: 'Siz rostdan ham ushbu portni o‘chirib yoqishni xohlaysizmi?', color: Theme.of(context).colorScheme.onSurface,maxLines: 3),
          actions: [
            TextButton(onPressed: () => Get.back(), child: TextSmall(text: 'Bekor qilish', color: Theme.of(context).colorScheme.primary)),
            TextButton(onPressed: () => {Get.back(), ApiController().portRestart(projectId!, serialNumber!, index!)}, child: TextSmall(text: 'Ha', color: Theme.of(context).colorScheme.primary))
          ]
        )
    );

  void showRateDialog(BuildContext context) {
    Get.defaultDialog(
        title: 'Dasturni baholash'.tr,
        titleStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize),
        backgroundColor: Theme.of(context).colorScheme.surface,
        confirm: ElevatedButton(
            onPressed: () => Get.back(),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              backgroundColor: AppColors.primaryColor,
              //minimumSize: Size(Get.width * 0.4, Get.height * 0.05),
            ),
            child: TextSmall(text: 'Bekor qilish'.tr, color: AppColors.white)
        ),

        content: Column(
            children: [
              RatingBar.builder(
                  initialRating: 3,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
                  onRatingUpdate: (rating) => {
                    Get.back(),
                    Get.showSnackbar(
                        GetSnackBar(
                            title: 'Dasturni baholash'.tr,
                            message: 'Yuborildi'.tr,
                            backgroundColor: AppColors.black70.withOpacity(0.7),
                            duration: const Duration(seconds: 2),
                            margin: const EdgeInsets.all(10.0),
                            borderRadius: 10.0
                        )
                    )
                  }
              ),
              SizedBox(height: Get.height * 0.01),
            ]
        )
    );
  }
}