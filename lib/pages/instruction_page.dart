import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hicom/companents/filds/text_large.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../controllers/get_controller.dart';

class InstructionPage extends StatelessWidget {
  InstructionPage({super.key});

  late final WebViewController _controller;
  final GetController _getController = Get.put(GetController());

  @override
  Widget build(BuildContext context) {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://hicom.uz/doc/privacy_policy.html')) {
              return NavigationDecision.prevent;
            }else{
              return NavigationDecision.navigate;
            }
          }
        ),
      )
      ..loadRequest(Uri.parse('https://hicom.uz/doc/privacy_policy.html'));

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,surfaceTintColor: Colors.transparent,
          title: TextLarge(text: 'Foydalanish yo‘riqnomasi'.tr, color: Theme.of(context).colorScheme.onSurface, fontSize: Theme.of(context).textTheme.titleLarge!.fontSize, fontWeight: FontWeight.w400),
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.arrow_back, size: Theme.of(context).iconTheme.fill), onPressed: () => Get.back())
      ),
      body: SafeArea(
        child: Center(
          child: WebViewWidget(controller: _controller)
        )
      )
    );
  }
}