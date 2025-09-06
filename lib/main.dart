import 'package:elevate_ecommerce_app/core/constants/const_keys.dart';
import 'package:elevate_ecommerce_app/core/di/di.dart';
import 'package:elevate_ecommerce_app/core/provider/app_config_provider.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'core/app_theme.dart';
import 'core/router/app_router.dart';
import 'core/router/route_names.dart';
import 'my_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  final bool isRememberMe = await getRememberMe();
  final String local = await getLocal();
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppConfigProvider(),

      child: MyApp(isRememberMe: isRememberMe, local: local),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isRememberMe, required this.local});
  final bool isRememberMe;
  final String local;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppConfigProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'E-Commerce App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: isRememberMe ? RouteNames.home : RouteNames.login,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.delegate.supportedLocales,
          locale: Locale(local),
        );
      },
    );
  }
}

Future<bool> getRememberMe() async {
  final FlutterSecureStorage secureStorage = getIt.get<FlutterSecureStorage>();
  final String? rememberMeValue = await secureStorage.read(
    key: ConstKeys.keyRememberMe,
  );
  return rememberMeValue == "true";
}

Future<String> getLocal() async {
  final FlutterSecureStorage _secureStorage = getIt.get<FlutterSecureStorage>();
  final String local =
      await _secureStorage.read(key: ConstKeys.local) ??
      ConstKeys.kEnglishLanguage;

  return local;
}
