import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Utilities/firebase_operation.dart';
import 'Utilities/git_it.dart';
import 'Utilities/helper.dart';
import 'Utilities/router_config.dart';
import 'package:provider/provider.dart';
import 'Utilities/theme_helper.dart';
import 'core/Font/font_provider.dart';
import 'core/Language/app_languages.dart';
import 'core/Language/locales.dart';
import 'core/Loading/loading_provider.dart';
import 'core/Theme/theme_provider.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FireBaseOperations.init();
  Helper.startFlexibleUpdate();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.top
  ]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await GitIt.initGitIt();

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AppLanguage>(create: (_) => AppLanguage()),
          ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
          ChangeNotifierProvider<FontProvider>(create: (_) => FontProvider()),
          ChangeNotifierProvider<LoadingProvider>(create: (_) => LoadingProvider()),
        ],
        child: const EntryPoint(),
      )
  );
}


class EntryPoint extends StatelessWidget {
  const EntryPoint({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    GoRouterConfig.router.addListener(() => LoadingProvider.removeLoading()); // very important

    final appLan = Provider.of<AppLanguage>(context);
    final appTheme = Provider.of<ThemeProvider>(context);
    appLan.fetchLocale(context);
    appTheme.fetchTheme();
    return ScreenUtilInit(
      designSize: const Size(375,812),
      builder:(_,__)=> MaterialApp.router(
        scrollBehavior: MyCustomScrollBehavior(),
        routerConfig: GoRouterConfig.router,
        debugShowCheckedModeBanner: false,
        title: 'App Name',
        locale: Locale(appLan.appLang.name),
        theme: appTheme.appThemeMode!.copyWith(
          scaffoldBackgroundColor: ThemeClass.of(context).background,
          primaryColor: ThemeClass.of(context).primaryColor,
        ),
        supportedLocales: Languages.values.map((e) => Locale(e.name)).toList(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
          DefaultMaterialLocalizations.delegate
        ],
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
