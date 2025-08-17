import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/app_theme.dart';
import 'core/router/app_router.dart';
import 'core/router/route_names.dart';
import 'my_bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Online Exam',
          debugShowCheckedModeBanner: false,
          darkTheme: AppTheme.lightTheme,
          themeMode: ThemeMode.dark,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: RouteNames.login,
        );
      },
    );
  }
}
