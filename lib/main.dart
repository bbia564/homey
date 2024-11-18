import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_restoratives/db_restorative/db_home.dart';
import 'package:home_restoratives/pages/home_add/home_add_binding.dart';
import 'package:home_restoratives/pages/home_add/home_add_view.dart';
import 'package:home_restoratives/pages/home_first/home_first_binding.dart';
import 'package:home_restoratives/pages/home_first/home_first_view.dart';
import 'package:home_restoratives/pages/home_second/home_second_binding.dart';
import 'package:home_restoratives/pages/home_second/home_second_view.dart';
import 'package:home_restoratives/pages/home_tab/home_tab_binding.dart';
import 'package:home_restoratives/pages/home_tab/home_tab_view.dart';


Color primaryColor = const Color(0xff26a4d3);
Color bgColor = const Color(0xffeff2f4);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBHome().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Raps,
      initialRoute: '/homeTab',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Raps = [
  GetPage(name: '/homeTab', page: () => HomeTabPage(), binding: HomeTabBinding()),
  GetPage(name: '/homeAdd', page: () => HomeAddPage(), binding: HomeAddBinding()),
  GetPage(name: '/homeSecond', page: () => HomeSecondPage(), binding: HomeSecondBinding()),
  GetPage(name: '/homeFirst', page: () => const HomeFirstPage(), binding: HomeFirstBinding()),
];