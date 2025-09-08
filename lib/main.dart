import 'package:elevate_ecommerce_app/core/constants/const_keys.dart';
import 'package:elevate_ecommerce_app/core/di/di.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'core/app_theme.dart';
import 'core/router/app_router.dart';
import 'core/router/route_names.dart';
import 'my_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  final bool isRememberMe = await getRememberMe();
  runApp(MyApp(isRememberMe: isRememberMe));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isRememberMe});
  final bool isRememberMe;
  @override
  Widget build(BuildContext context) {
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
          // initialRoute: isRememberMe ? RouteNames.home : RouteNames.login,
          initialRoute: RouteNames.savedAddress,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.delegate.supportedLocales,
          locale: const Locale("en"),
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
