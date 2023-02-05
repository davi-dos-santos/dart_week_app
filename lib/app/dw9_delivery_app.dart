import 'package:dart_week_app/app/core/ui/theme/theme_config.dart';
import 'package:dart_week_app/app/pages/home/home_router.dart';
import 'package:dart_week_app/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'core/provider/application_binding.dart';

class Dw9DeliveryApp extends StatelessWidget {
  const Dw9DeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        title: 'Dart Week',
        theme: ThemeConfig.Theme,
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => HomeRouter.page,
        },
      ),
    );
  }
}
