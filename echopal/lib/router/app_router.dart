import 'package:flutter/material.dart';
import "../main.dart";
import "../pages/home/home_page.dart";
import "../pages/agent_chat/index.dart";
import "../pages/daily_conversation/index.dart";
import "../pages/grammar/index.dart";
import "../pages/pronunciation/index.dart";
import "../pages/settings/index.dart";

/// 应用路由配置
///
/// 作用：
/// 1. 统一管理应用中的所有页面路由
/// 2. 定义路由名称和对应的页面
/// 3. 配置路由跳转的动画和参数传递
/// 4. 提供类型安全的路由导航方法
class AppRouter {
  // 路由名称常量
  static const String home = '/';
  static const String agentChat = '/agent-chat';
  static const String dailyConversation = '/daily-conversation';
  static const String grammar = '/grammar';
  static const String pronunciation = '/pronunciation';
  static const String settings = '/settings';

  /// 路由配置 Map
  /// MaterialApp 会根据这个配置进行页面跳转
  static Map<String, WidgetBuilder> get routes {
    return {
      // 首页路由
      home: (context) => const HomePage(),

      // AI 对话页面路由
      agentChat: (context) => const AgentChatPage(),

      // 日常对话页面路由
      dailyConversation: (context) => const DailyConversationPage(),

      // 语法学习页面路由
      grammar: (context) => const GrammarPage(),

      // 发音练习页面路由
      pronunciation: (context) => const PronunciationPage(),

      // 设置页面路由
      settings: (context) => const SettingsPage(),
    };
  }

  /// 路由生成器（用于处理动态路由和参数传递）
  ///
  /// 当路由表中找不到对应路由时，会调用此方法
  /// 可以用于处理带参数的路由，如：/user/:id
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    // 可以根据 settings.name 和 settings.arguments 动态生成路由
    switch (settings.name) {
      case "home":
      case "/":
        {
          return MaterialPageRoute(builder: (_) => const MainPage());
        }
    }

    // 如果找不到路由，返回 404 页面
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('页面未找到')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.grey),
              const SizedBox(height: 16),
              Text(
                '页面未找到：${settings.name}',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 路由跳转方法（便捷方法）
  ///
  /// 提供类型安全的路由导航方法
  /// 使用示例：
  /// AppRouter.push(context, AppRouter.home);
  /// AppRouter.pushNamed(context, AppRouter.agentChat);

  /// 跳转到指定路由（带参数）
  static Future<T?> push<T extends Object?>(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.pushNamed<T>(context, routeName, arguments: arguments);
  }

  /// 替换当前路由
  static Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    BuildContext context,
    String routeName, {
    Object? arguments,
    TO? result,
  }) {
    return Navigator.pushReplacementNamed<T, TO>(
      context,
      routeName,
      arguments: arguments,
      result: result,
    );
  }

  /// 跳转并清除所有之前的路由
  static Future<T?> pushAndRemoveUntil<T extends Object?>(
    BuildContext context,
    String routeName, {
    Object? arguments,
    bool Function(Route<dynamic>)? predicate,
  }) {
    return Navigator.pushNamedAndRemoveUntil<T>(
      context,
      routeName,
      predicate ?? (route) => false, // 清除所有路由
      arguments: arguments,
    );
  }

  /// 返回上一页
  static void pop<T extends Object?>(BuildContext context, [T? result]) {
    Navigator.pop<T>(context, result);
  }

  /// 返回指定页面
  static void popUntil(BuildContext context, String routeName) {
    Navigator.popUntil(context, ModalRoute.withName(routeName));
  }
}
