import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:hicom/companents/instrument/instrument_components.dart';
import 'package:hicom/controllers/api_controller.dart';
import 'package:hicom/pages/sample/add_project_page.dart';
import 'package:hicom/pages/sample/switch_lists.dart';
import 'package:hicom/pages/user_page.dart';
import 'package:hicom/resource/colors.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../companents/filds/text_large.dart';
import '../../companents/filds/text_small.dart';
import '../../companents/search_fild.dart';
import '../../controllers/get_controller.dart';

class SamplePage extends StatelessWidget {
  SamplePage({super.key});

  final GetController _getController = Get.put(GetController());
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _getData() {
    _refreshController.refreshCompleted();
    if (_getController.isRequest.isTrue) ApiController().getProjects();
  }

  @override
  Widget build(BuildContext context) {
    ApiController().login(_getController.getNumber(),_getController.getSession(),'50UvFayZ2w5u3O9B',false).then((_) => {
      _refreshController.requestRefresh(),
      Future.delayed(const Duration(milliseconds: 2500), () {
        _getData();
      })
    });
    return PopScope(
        canPop: false,
        onPopInvoked : (didPop){
          if (_getController.isSearch.value){
            _getController.isSearch.value = !_getController.isSearch.value;
            _getController.searchController.clear();
          } else {
            if (didPop) {
              return;
            }
            exit(0);
          }
        },
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                title: Obx(() => TextLarge(text: _getController.isSearch.value ? ''.tr : 'Loyihalar ro‘yxati', color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400)),
                leading: Obx(() => IconButton(icon: Icon(_getController.isSearch.value ? Icons.arrow_back : Icons.account_circle_outlined, size: Theme.of(context).iconTheme.fill), onPressed: () => {
                  if (_getController.isSearch.value){
                    _getController.isSearch.value = !_getController.isSearch.value,
                    _getController.searchController.clear()
                  } else {
                    Get.to(UserPage(), transition: Transition.fadeIn)}})),
                centerTitle: true,
                actions: [
                  Obx(() => _getController.isSearch.value
                      ? SearchFields(onChanged: (String value) {_getController.searchProject(value);})
                      : IconButton(icon: Icon(Icons.search, size: Theme.of(context).iconTheme.fill), onPressed: () => {_getController.isSearch.value = !_getController.isSearch.value})
                  )
                ]),
            body: SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                physics: const BouncingScrollPhysics(),
                header: CustomHeader(builder: (BuildContext context, RefreshStatus? mode) {return SizedBox(height: Get.height * 0.1);}),
                footer: CustomFooter(builder: (BuildContext context, LoadStatus? mode) {return SizedBox(height: Get.height * 0.1);}),
                onLoading: null,
                onRefresh: _getData,
                controller: _refreshController,
                child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Obx(() => _getController.searchProjectModel.value.admin != null && _getController.searchProjectModel.value.join!.isNotEmpty || _getController.searchProjectModel.value.join != null && _getController.searchProjectModel.value.admin!.isNotEmpty
                        ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (_getController.searchProjectModel.value.admin!.isNotEmpty)
                            for(var i = 0; i < _getController.searchProjectModel.value.admin!.length; i++)
                              InkWell(
                                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                                  onTap: () => {
                                    ApiController().getSwitchList(_getController.searchProjectModel.value.admin![i].pid),
                                    Get.to(SwitchList(name: _getController.searchProjectModel.value.admin![i].name.toString(), isAdmin: true), arguments: _getController.searchProjectModel.value.admin![i].pid)
                                  },
                                  onLongPress: () => {
                                    _getController.nameProjectController.text = _getController.searchProjectModel.value.admin![i].name.toString(),
                                    _getController.noteProjectController.text = _getController.searchProjectModel.value.admin![i].note.toString(),
                                    InstrumentComponents().bottomSheetEditName(context,_getController.searchProjectModel.value.admin![i].pid)
                                  },
                                  child: Card(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.04, vertical: Get.height * 0.01),
                                      elevation: 1,
                                      shadowColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
                                      child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                                margin: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
                                                child: Stack(
                                                    children: [
                                                      SvgPicture.asset('assets/svg_assets/folde.svg', width: Get.width * 0.06, height: Get.height * 0.06),
                                                      Positioned.fill(
                                                          child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                  children: [
                                                                    SvgPicture.asset('assets/svg_assets/user.svg', width: Get.width * 0.03, height: Get.height * 0.03),
                                                                    SizedBox(width: Get.width * 0.006),
                                                                  ],
                                                                ),
                                                                SizedBox(height: Get.height * 0.003),
                                                              ]
                                                          )
                                                      )
                                                    ]
                                                )
                                            ),
                                            Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(height: Get.height * 0.01),
                                                  Row(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        SizedBox(width: Get.width * 0.62, child: TextLarge(text: _getController.searchProjectModel.value.admin![i].name.toString(), color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400, maxLines: 1, overflow: TextOverflow.ellipsis)),
                                                        Container(
                                                            height: Get.height * 0.042,
                                                            width: Get.width * 0.1,
                                                            margin: EdgeInsets.only(right: Get.width * 0.02),
                                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(7), color: AppColors.grey.withOpacity(0.2)),
                                                            child: PopupMenuButton<String>(
                                                                icon: Icon(TablerIcons.dots, size: Get.height * 0.025),
                                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                                                                color: Theme.of(context).colorScheme.surface,
                                                                surfaceTintColor: Colors.transparent,
                                                                elevation: 0,
                                                                onSelected: (String value) {
                                                                  switch (value) {
                                                                    case 'edit':
                                                                      _getController.nameProjectController.text = _getController.searchProjectModel.value.admin![i].name.toString();
                                                                      _getController.noteProjectController.text = _getController.searchProjectModel.value.admin![i].note.toString();
                                                                      InstrumentComponents().bottomSheetEditName(context,_getController.searchProjectModel.value.admin![i].pid);
                                                                      break;
                                                                    case 'watchers':
                                                                      InstrumentComponents().bottomSheetUsers(context, _getController.searchProjectModel.value.admin![i].pid);
                                                                      ApiController().getProjectsUsers(_getController.searchProjectModel.value.admin![i].pid);
                                                                      break;
                                                                    case 'share':
                                                                      InstrumentComponents().bottomSheetShare(context, _getController.searchProjectModel.value.admin![i].pid);
                                                                      break;
                                                                    case 'delete':
                                                                      _getController.deleteTimer();
                                                                      InstrumentComponents().bottomSheetProjectDelete(context, _getController.searchProjectModel.value.admin![i].pid, _getController.searchProjectModel.value.admin![i].name.toString());
                                                                      break;
                                                                  }
                                                                },
                                                                itemBuilder: (BuildContext context) {
                                                                  return [
                                                                    PopupMenuItem(
                                                                        value: 'edit',
                                                                        child: Row(
                                                                          children: [
                                                                            Icon(Icons.edit, size: Get.width * 0.04),
                                                                            SizedBox(width: Get.width * 0.015),
                                                                            TextSmall(text: 'Tahrirlash', color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400, maxLines: 1, overflow: TextOverflow.ellipsis)
                                                                          ],
                                                                        )
                                                                    ),
                                                                    PopupMenuItem(
                                                                        value: 'watchers',
                                                                        child: Row(
                                                                          children: [
                                                                            Icon(Icons.person, size: Get.width * 0.04),
                                                                            SizedBox(width: Get.width * 0.015),
                                                                            TextSmall(text: 'Kuzatuvchilar', color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400, maxLines: 1, overflow: TextOverflow.ellipsis)
                                                                          ],
                                                                        )
                                                                    ),
                                                                    PopupMenuItem(
                                                                        value: 'share',
                                                                        child: Row(
                                                                          children: [
                                                                            Icon(Icons.share, size: Get.width * 0.04),
                                                                            SizedBox(width: Get.width * 0.015),
                                                                            TextSmall(text: 'Ulashish', color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400, maxLines: 1, overflow: TextOverflow.ellipsis)
                                                                          ],
                                                                        )
                                                                    ),
                                                                    const PopupMenuItem(
                                                                      height: 0,
                                                                      padding: EdgeInsets.all(0),
                                                                      value: 'watcher',
                                                                      child: Divider(),
                                                                    ),
                                                                    PopupMenuItem(
                                                                        value: 'delete',
                                                                        child: Row(
                                                                          children: [
                                                                            Icon(Icons.delete, size: Get.width * 0.04, color: Theme.of(context).colorScheme.error),
                                                                            SizedBox(width: Get.width * 0.015),
                                                                            TextSmall(text: 'O‘chirish', color: Theme.of(context).colorScheme.error, fontWeight: FontWeight.w400, maxLines: 1, overflow: TextOverflow.ellipsis)
                                                                          ],
                                                                        )
                                                                    )
                                                                  ];
                                                                }
                                                            )
                                                        )
                                                      ]
                                                  ),
                                                  SizedBox(width: Get.width * 0.7, child: TextSmall(text: _getController.searchProjectModel.value.admin![i].note.toString() == ''|| _getController.searchProjectModel.value.admin![i].note.toString() == ' ' ? 'Qo‘shimcha ma’lumotlar yo‘q' : _getController.searchProjectModel.value.admin![i].note.toString(), color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400,maxLines: 1,overflow: TextOverflow.ellipsis)),
                                                  Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        TextSmall(text: '${'Jami'.tr} ${_getController.searchProjectModel.value.admin![i].sc.toString()}', color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400),
                                                        Container(
                                                            width: 2,
                                                            height: Get.height * 0.025,
                                                            margin: EdgeInsets.symmetric(horizontal: Get.width * 0.01, vertical: Get.height * 0.01),
                                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5))
                                                        ),
                                                        TextSmall(text: '${'Yoniq'.tr} ${_getController.searchProjectModel.value.admin![i].lsc.toString()}', color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400),
                                                        Container(
                                                            width: 2,
                                                            height: Get.height * 0.025,
                                                            margin: EdgeInsets.symmetric(horizontal: Get.width * 0.01, vertical: Get.height * 0.01),
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(3),
                                                                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5)
                                                            )
                                                        ),
                                                        TextSmall(text: '${'Xato'.tr} ${_getController.searchProjectModel.value.admin![i].wsc.toString()}', color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400)
                                                      ]
                                                  )
                                                ]
                                            )
                                          ]
                                      )
                                  )
                              ),
                          if (_getController.searchProjectModel.value.join != null && _getController.searchProjectModel.value.join!.isNotEmpty)
                            for(var i = 0; i < _getController.searchProjectModel.value.join!.length; i++)
                              InkWell(
                                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                                  onTap: () => {
                                    ApiController().getSwitchList(_getController.searchProjectModel.value.join![i].pid),
                                    Get.to(SwitchList(name: _getController.searchProjectModel.value.join![i].name.toString(), isAdmin: false), arguments: _getController.searchProjectModel.value.join![i].pid)
                                  },
                                  child: Card(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.04, vertical: Get.height * 0.01),
                                      elevation: 1,
                                      shadowColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
                                      child: Center(
                                          child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Container(margin: EdgeInsets.symmetric(horizontal: Get.width * 0.02), child: SvgPicture.asset('assets/svg_assets/folde.svg', width: Get.width * 0.06, height: Get.height * 0.06)),
                                                Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      SizedBox(height: Get.height * 0.01),
                                                      SizedBox(width: Get.width * 0.7, child: TextLarge(text: _getController.searchProjectModel.value.join![i].name.toString(), color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400)),
                                                      SizedBox(width: Get.width * 0.7, child: TextSmall(text: _getController.searchProjectModel.value.join![i].note.toString() == '' || _getController.searchProjectModel.value.join![i].note.toString() == ' ' ? 'Qo‘shimcha ma’lumotlar yo‘q'.tr : _getController.searchProjectModel.value.join![i].note.toString(), color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400)),
                                                      Row(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            TextSmall(text: '${'Jami'.tr} ${_getController.searchProjectModel.value.join![i].sc.toString()}', color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400),
                                                            Container(
                                                                width: 2,
                                                                height: Get.height * 0.025,
                                                                margin: EdgeInsets.symmetric(horizontal: Get.width * 0.01, vertical: Get.height * 0.01),
                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5))
                                                            ),
                                                            TextSmall(text: '${'Yoniq'.tr} ${_getController.searchProjectModel.value.join![i].lsc.toString()}', color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400),
                                                            Container(
                                                                width: 2,
                                                                height: Get.height * 0.025,
                                                                margin: EdgeInsets.symmetric(horizontal: Get.width * 0.01, vertical: Get.height * 0.01),
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(3),
                                                                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5)
                                                                )
                                                            ),
                                                            TextSmall(text: '${'Xato'.tr} ${_getController.searchProjectModel.value.join![i].wsc.toString()}', color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400)
                                                          ]
                                                      )
                                                    ]
                                                )
                                              ]
                                          )
                                      )
                                  )
                              )
                        ])
                        : Column(children: [SizedBox(
                        height: Get.height* 0.9,
                        width: Get.width,
                        child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('assets/svg_assets/empty.svg', width: Get.width * 0.18, height: Get.height * 0.18),
                                  SizedBox(height: Get.height * 0.01),
                                  TextLarge(text: 'Faol loyihalar yo‘q', color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400),
                                  SizedBox(height: Get.height * 0.01),
                                  Padding(padding: EdgeInsets.only(left: Get.width * 0.05, right: Get.width * 0.05), child: TextSmall(text: 'Loyiha qo‘shish uchun pastki o‘ng burchakdagi qo‘shish tugmasini bosing.', color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400,textAlign: TextAlign.center))
                                ]
                            )
                        )
                    )])
                    )
                )
            ),
            floatingActionButton: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: Colors.blue,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              onPressed: () {
                Get.to(AddProjectPage());
              },
              child: Icon(Icons.add,color: AppColors.white,size: Theme.of(context).buttonTheme.height),
            )
        )
    );
  }
}
