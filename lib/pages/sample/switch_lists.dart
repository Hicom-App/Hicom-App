import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:hicom/companents/filds/text_large.dart';
import 'package:hicom/companents/filds/text_small.dart';
import 'package:hicom/pages/sample/switch_detail.dart';
import 'package:hicom/resource/colors.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../companents/instrument/instrument_components.dart';
import '../../companents/sample/port_items.dart';
import '../../companents/sample/port_items_16.dart';
import '../../companents/search_fild.dart';
import '../../controllers/api_controller.dart';
import '../../controllers/get_controller.dart';
import 'add_switch_page.dart';

class SwitchList extends StatelessWidget {
  final String name;
  final bool isAdmin;
  SwitchList({super.key, required this.name, required this.isAdmin});
  final GetController _getController = Get.put(GetController());
  final RefreshController refreshController = RefreshController(initialRefresh: false);

  void _onLoading() {
    refreshController.loadComplete();
  }

  void _getData() {
    refreshController.refreshCompleted();
    var argument = Get.arguments;
    ApiController().getSwitchList(argument);
  }

  @override
  Widget build(BuildContext context) {
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
            Get.back();
          }
        },
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                title: Obx(() => TextLarge(text: _getController.isSearch.value ? ''.tr : 'Qurilmalar ro‘yxati'.tr, color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400)),
                leading: Obx(() => IconButton(icon: Icon(_getController.isSearch.value ? Icons.arrow_back : Icons.arrow_back,  size: Theme.of(context).iconTheme.fill), onPressed: () => {
                  if (_getController.isSearch.value){
                    _getController.isSearch.value = !_getController.isSearch.value,
                    _getController.searchController.clear()
                  }
                  else Get.back()
                })),
                centerTitle: true,
                actions: [
                  Obx(() => _getController.isSearch.value
                      ? SearchFields(onChanged: (String value) {_getController.searchSwitch(value);})
                      : IconButton(icon: Icon(Icons.search, size: Theme.of(context).iconTheme.fill), onPressed: () => {_getController.isSearch.value = !_getController.isSearch.value}))
                ]),
            body: SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                physics: const BouncingScrollPhysics(),
                header: CustomHeader(builder: (BuildContext context, RefreshStatus? mode) {return SizedBox(height: Get.height * 0.1);}),
                footer: CustomFooter(builder: (BuildContext context, LoadStatus? mode) {return SizedBox(height: Get.height * 0.1);}),
                onLoading: _onLoading,
                onRefresh: _getData,
                controller: refreshController,
                child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Obx(() => _getController.searchProjectModel.value.admin != null || _getController.searchProjectModel.value.join != null
                        ? Column(
                        children: [
                          if (_getController.switchListModel.value.offline != null)
                            ListView.builder(
                                itemCount: _getController.switchListModel.value.offline!.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                                      onTap: () => InstrumentComponents().showToast(Get.context!, 'Diqqat!', 'Qurilma o`chiq'.tr, true, 3),
                                      child: Card(
                                          margin: EdgeInsets.only(left: Get.width * 0.03, right: Get.width * 0.03, top: Get.height * 0.01),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                          elevation: 1,
                                          color: Theme.of(context).colorScheme.surface,
                                          child: Padding(
                                              padding: EdgeInsets.only(left: Get.width * 0.03, right: Get.width * 0.03, bottom: Get.height * 0.01),
                                              child: Column(
                                                children: [
                                                  Row(
                                                      children: [
                                                        TextSmall(text: _getController.switchListModel.value.offline![index].name.toString(), color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400),
                                                        const Spacer(),
                                                        Icon(TablerIcons.circle_filled, color: Theme.of(context).colorScheme.error, size: Get.width * 0.025),
                                                        PopupMenuButton<String>(
                                                            icon: Icon(TablerIcons.dots, size: Theme.of(context).buttonTheme.height),
                                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                                            color: Theme.of(context).colorScheme.surface,
                                                            surfaceTintColor: Colors.transparent,
                                                            elevation: 4,
                                                            onSelected: (String value) {
                                                              switch (value) {
                                                                case 'edit':
                                                                  if(isAdmin){
                                                                    _getController.nameProjectController.text = _getController.switchListModel.value.offline![index].name.toString();
                                                                    _getController.noteProjectController.text = _getController.switchListModel.value.offline![index].note.toString();
                                                                    InstrumentComponents().bottomSwitchEditName(context,Get.arguments,_getController.switchListModel.value.offline![index].sn, index,false);
                                                                  } else {
                                                                    InstrumentComponents().showToast(Get.context!, 'Xatolik', 'Sizda bunday huquq mavjud emas!'.tr, true, 3);
                                                                  }
                                                                  break;
                                                                case 'delete':
                                                                  if (isAdmin) {
                                                                    _getController.deleteTimer();
                                                                    InstrumentComponents().bottomSheetDeviceDelete(context, Get.arguments,_getController.switchListModel.value.offline![index].sn, _getController.switchListModel.value.offline![index].name);
                                                                  } else {
                                                                    InstrumentComponents().showToast(Get.context!, 'Xatolik', 'Sizda bunday huquq mavjud emas!'.tr, true, 3);
                                                                  }
                                                                  break;
                                                              }
                                                            },
                                                            itemBuilder: (BuildContext context) {
                                                              return [
                                                                PopupMenuItem(
                                                                    height: Get.height * 0.03,
                                                                    value: 'edit',
                                                                    child: Row(
                                                                      children: [
                                                                        Icon(Icons.edit, size: Get.width * 0.04),
                                                                        SizedBox(width: Get.width * 0.015),
                                                                        TextSmall(text: 'Tahrirlash', color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400)
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
                                                                    height: Get.height * 0.03,
                                                                    value: 'delete',
                                                                    child: Row(
                                                                      children: [
                                                                        Icon(Icons.delete, size: Get.width * 0.04, color: Theme.of(context).colorScheme.error),
                                                                        SizedBox(width: Get.width * 0.015),
                                                                        TextSmall(text: 'O‘chirish', color: Theme.of(context).colorScheme.error, fontWeight: FontWeight.w400)
                                                                      ],
                                                                    )
                                                                )
                                                              ];
                                                            }
                                                        )
                                                      ]
                                                  ),
                                                  if (_getController.switchListModel.value.offline![index].sn != null &&_getController.typeFromSerialNumber(_getController.switchListModel.value.offline![index].sn.toString()) == 7 || _getController.typeFromSerialNumber(_getController.switchListModel.value.offline![index].sn.toString()) == 8)
                                                    PortItems16(
                                                        data: _getController.getPortMap(_getController.typeFromSerialNumber(_getController.switchListModel.value.offline![index].sn.toString())),
                                                        ports: _getController.portModification([],_getController.typeFromSerialNumber(_getController.switchListModel.value.offline![index].sn.toString())),
                                                        portsIcons: _getController.getPortTypeIcons(_getController.typeFromSerialNumber(_getController.switchListModel.value.offline![index].sn.toString()))
                                                    )
                                                  else
                                                    PortItems(
                                                        data: _getController.getPortMap(_getController.typeFromSerialNumber(_getController.switchListModel.value.offline![index].sn.toString())),
                                                        ports:_getController.portModification([],_getController.typeFromSerialNumber(_getController.switchListModel.value.offline![index].sn.toString())),
                                                        portsIcons: _getController.getPortTypeIcons(_getController.typeFromSerialNumber(_getController.switchListModel.value.offline![index].sn.toString()))
                                                    ),
                                                  Row(
                                                    children: [
                                                      TextSmall(text: '${'MAC'.tr} ${_getController.switchListModel.value.offline![index].mac}', color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400,fontSize: Get.textTheme.bodySmall!.fontSize),
                                                      const Spacer(),
                                                      TextSmall(text: _getController.maskString(_getController.switchListModel.value.offline![index].sn.toString()), color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400,fontSize: Get.textTheme.bodySmall!.fontSize)
                                                    ]
                                                  )
                                                ]
                                              )
                                          )
                                      )
                                  );
                                }),
                          if (_getController.switchListModel.value.online != null)
                            ListView.builder(
                                itemCount: _getController.switchListModel.value.online!.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                                      onTap: () => {_getController.clearSwitchDetailModel(), Get.to(SwitchDetailPage(sn: _getController.switchListModel.value.online![index].sn, title: _getController.switchListModel.value.online![index].name, pidId: Get.arguments))},
                                      child: Card(
                                          margin: EdgeInsets.only(left: Get.width * 0.03, right: Get.width * 0.03, top: Get.height * 0.01),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                          elevation: 1,
                                          color: Theme.of(context).colorScheme.surface,
                                          child: Padding(
                                              padding: EdgeInsets.only(left: Get.width * 0.03, right: Get.width * 0.03, bottom: Get.height * 0.01),
                                              child: Column(
                                                  children: [
                                                    Row(
                                                        children: [
                                                          TextSmall(text: _getController.switchListModel.value.online![index].name.toString(), color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400),
                                                          const Spacer(),
                                                          Icon(TablerIcons.circle_filled, color: AppColors.green, size: Get.width * 0.025),
                                                          if (isAdmin)
                                                            PopupMenuButton<String>(
                                                              icon: Icon(TablerIcons.dots, size: Theme.of(context).buttonTheme.height),
                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                                              color: Theme.of(context).colorScheme.surface,
                                                              surfaceTintColor: Colors.transparent,
                                                              shadowColor: Colors.transparent,
                                                              elevation: 4,
                                                              onSelected: (String value) {
                                                                switch (value) {
                                                                  case 'edit':
                                                                    if (isAdmin) {
                                                                      _getController.nameProjectController.text = _getController.switchListModel.value.online![index].name.toString();
                                                                      _getController.noteProjectController.text = _getController.switchListModel.value.online![index].note.toString();
                                                                      InstrumentComponents().bottomSwitchEditName(context, Get.arguments, _getController.switchListModel.value.online![index].sn, index, false);
                                                                    } else {
                                                                      InstrumentComponents().showToast(Get.context!, 'Xatolik', 'Sizda bunday huquq mavjud emas!'.tr, true, 3);
                                                                    }
                                                                    break;
                                                                  case 'delete':
                                                                    if (isAdmin) {
                                                                      _getController.deleteTimer();
                                                                      InstrumentComponents().bottomSheetDeviceDelete(context, Get.arguments,_getController.switchListModel.value.online![index].sn, _getController.switchListModel.value.online![index].name);
                                                                    } else {
                                                                      InstrumentComponents().showToast(Get.context!, 'Xatolik', 'Sizda bunday huquq mavjud emas!'.tr, true, 3);
                                                                    }
                                                                    break;
                                                                }
                                                              },
                                                              itemBuilder: (BuildContext context) {
                                                                return [
                                                                  PopupMenuItem(
                                                                      height: Get.height * 0.03,
                                                                      value: 'edit',
                                                                      child: Row(
                                                                        children: [
                                                                          Icon(Icons.edit, size: Get.width * 0.04),
                                                                          SizedBox(width: Get.width * 0.015),
                                                                          TextSmall(text: 'Tahrirlash', color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400)
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
                                                                      height: Get.height * 0.03,
                                                                      value: 'delete',
                                                                      child: Row(
                                                                        children: [
                                                                          Icon(Icons.delete, size: Get.width * 0.04, color: Theme.of(context).colorScheme.error),
                                                                          SizedBox(width: Get.width * 0.015),
                                                                          TextSmall(text: 'O‘chirish', color: Theme.of(context).colorScheme.error, fontWeight: FontWeight.w400)
                                                                        ],
                                                                      )
                                                                  )
                                                                ];
                                                              }
                                                          )
                                                        ]
                                                    ),
                                                    if (_getController.typeFromSerialNumber(_getController.switchListModel.value.online![index].sn.toString()) == 7 || _getController.typeFromSerialNumber(_getController.switchListModel.value.online![index].sn.toString()) == 8)
                                                      PortItems16(
                                                          data: _getController.getPortMap(_getController.typeFromSerialNumber(_getController.switchListModel.value.online![index].sn.toString())),
                                                          ports: _getController.getPortType(_getController.switchListModel.value.online![index].link,_getController.switchListModel.value.online![index].snr,_getController.typeFromSerialNumber(_getController.switchListModel.value.online![index].sn.toString())),
                                                          portsIcons: _getController.getPortTypeIcons(_getController.typeFromSerialNumber(_getController.switchListModel.value.online![index].sn.toString()))
                                                      )
                                                    else
                                                      PortItems(
                                                          data: _getController.getPortMap(_getController.typeFromSerialNumber(_getController.switchListModel.value.online![index].sn.toString())),
                                                          ports: _getController.getPortType(_getController.switchListModel.value.online![index].link,_getController.switchListModel.value.online![index].snr,_getController.typeFromSerialNumber(_getController.switchListModel.value.online![index].sn.toString())),
                                                          portsIcons: _getController.getPortTypeIcons(_getController.typeFromSerialNumber(_getController.switchListModel.value.online![index].sn.toString()))
                                                      ),
                                                    Row(
                                                        children: [
                                                          TextSmall(text: '${'MAC'.tr} ${_getController.switchListModel.value.online![index].mac}', color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400,fontSize: Get.textTheme.bodySmall!.fontSize),
                                                          const Spacer(),
                                                          TextSmall(text: _getController.maskString(_getController.switchListModel.value.online![index].sn.toString()), color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400,fontSize: Get.textTheme.bodySmall!.fontSize)
                                                        ]
                                                    )
                                                  ]
                                              )
                                          )
                                      )
                                  );
                                }
                            )
                        ]
                    ) : Column(children: [
                      SizedBox(
                          height: Get.height* 0.9,
                          width: Get.width,
                          child: Center(child: TextLarge(text: 'Ma’lumotlar topilmadi'.tr, color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400))
                      )
                    ]))
                )
            ),
            floatingActionButton: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: Colors.blue,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              onPressed: () {
                _getController.nameProjectController.text = name;
                Get.to(AddSwitchPage(), arguments: Get.arguments);
              },
              child: Icon(Icons.add,color: AppColors.white,size: Theme.of(context).buttonTheme.height)
            )
        )
    );
  }
}