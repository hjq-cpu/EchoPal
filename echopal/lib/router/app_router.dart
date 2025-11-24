import 'package:flutter/material.dart';
import "../pages/home/home_page.dart";

/// 应用路由配置
///
/// 作用：
/// 1. 统一管理应用中的所有页面路由
/// 2. 定义路由名称和对应的页面
/// 3. 配置路由跳转的动画和参数传递
/// 4. 提供类型安全的路由导航方法
class AppRouter {
  // 路由名称常量
  // 使用常量可以避免拼写错误，便于维护
  static const String home = '/'; // 首页
  static const String agentChat = '/agent-chat'; // AI 对话页面
  static const String dailyConversation = '/daily-conversation'; // 日常对话
  static const String grammar = '/grammar'; // 语法学习
  static const String pronunciation = '/pronunciation'; // 发音练习
  static const String settings = '/settings'; // 设置页面

  /// 路由表配置
  ///
  /// 定义路由名称与页面的映射关系
  /// MaterialApp 会根据这个配置进行页面跳转
  static Map<String, WidgetBuilder> get routes {
    return {
      // 首页路由
      home: (context) {
        // TODO: 导入并返回实际的首页组件
        // return const HomePage();
        return const Scaffold(body: Center(child: Text('首页')));
      },

      // AI 对话页面路由
      agentChat: (context) {
        // TODO: 导入并返回实际的 AI 对话页面组件
        // return const AgentChatPage();
        return const Scaffold(body: Center(child: Text('对话练习')));
      },

      // 日常对话页面路由
      dailyConversation: (context) {
        // TODO: 导入并返回实际的日常对话页面组件
        // return const DailyConversationPage();
        return const Scaffold(body: Center(child: Text('日常对话')));
      },

      // 语法学习页面路由
      grammar: (context) {
        // TODO: 导入并返回实际的语法学习页面组件
        // return const GrammarPage();
        return const Scaffold(body: Center(child: Text('语法学习')));
      },

      // 发音练习页面路由
      pronunciation: (context) {
        // TODO: 导入并返回实际的发音练习页面组件
        // return const PronunciationPage();
        return const Scaffold(body: Center(child: Text('发音练习')));
      },

      // 设置页面路由
      settings: (context) {
        // TODO: 导入并返回实际的设置页面组件
        // return const SettingsPage();
        return const Scaffold(body: Center(child: Text('设置')));
      },
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
        {
          return MaterialPageRoute(builder: (_) => const HomePage());
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
