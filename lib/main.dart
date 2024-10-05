import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:login_manual/ui/route/route_splash.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'const/value/colors.dart';
import 'const/value/text_style.dart';

// com.appdoggaebi.englishQuiz
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

/*  await Future.wait([
    Firebase.initializeApp(*//*options: DefaultFirebaseOptions.currentPlatform*//*),
    initializeDateFormatting(),
  ]);*/

  KakaoSdk.init(
    nativeAppKey: '038ffa3bffb29bfd81e91c495d4abb41',
    javaScriptAppKey: '27640348533ab98be31a2731354e6b65',
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          navigatorObservers: [RouteObserver()],
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Pretendard',
            scaffoldBackgroundColor: colorWhite,
            appBarTheme: const AppBarTheme(
              backgroundColor: colorWhite,
              shadowColor: null,
              scrolledUnderElevation: 0,
              foregroundColor: colorGray900,
              elevation: 0,
              centerTitle: true,
              titleTextStyle: TS.s18w600(colorGray900),
              iconTheme: IconThemeData(color: colorGray900),
            ),
          ),
          home: const RouteSplash(),
        );
      },
    );
  }
}
