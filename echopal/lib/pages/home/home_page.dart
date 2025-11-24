import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../config/theme.dart';
import '../../router/app_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: AppTheme.lightTheme,
      routes: AppRouter.routes,
      onGenerateRoute: AppRouter.generateRoute,
      home: Scaffold(body: Center(child: Text('首页'))),
    );
  }
}