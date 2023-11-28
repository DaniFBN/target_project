import 'package:flutter/material.dart';

import 'core/shared/services/url_launch/url_launch_service.dart';
import 'core/shared/themes/app_theme.dart';
import 'pages/home/home_page.dart';
import 'pages/home/home_store.dart';
import 'pages/login_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      initialRoute: '/',
      routes: {
        '/': (_) => const LoginPage(urlLaunchService: UrlLaunchService()),
        '/home': (_) => HomePage(homeStore: HomeStore()),
      },
    );
  }
}
