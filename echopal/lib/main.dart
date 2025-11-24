import 'package:flutter/material.dart';
import 'config/theme.dart';
import 'widgets/bottom_nav_bar.dart';
import "router/app_router.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '英文学习助手',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainPage(), // 直接显示主页面（带底部导航栏）
    );
  }
}

/// 主页面 - 包含底部导航栏和页面切换功能
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  // 页面列表，对应底部导航栏的各个标签
  final List<Widget> _pages = [
    AppRouter.routes[AppRouter.home]!(context),
    const _PlaceholderPage(title: '对话练习', icon: Icons.chat, page: AppRouter[AppRouter.agentChat]),
    const _PlaceholderPage(title: '语法学习', icon: Icons.book, page: AppRouter[AppRouter.grammar]),
    const _PlaceholderPage(title: '发音练习', icon: Icons.record_voice_over, page: AppRouter[AppRouter.pronunciation]),
    const _PlaceholderPage(title: '设置', icon: Icons.settings, page: AppRouter[AppRouter.settings]),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}