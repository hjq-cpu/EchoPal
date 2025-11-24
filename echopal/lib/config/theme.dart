// 导入 Flutter Material 设计库，包含主题相关的所有组件和样式
import 'package:flutter/material.dart';

/// 应用主题配置类
/// 统一管理应用的浅色和深色主题
class AppTheme {
  /// 浅色主题配置
  /// 使用 static final：只创建一次，性能更好，避免重复创建
  static final ThemeData lightTheme = ThemeData(
    // 启用 Material 3 设计规范（最新版本）
    // Material 3 提供更现代的设计和更好的颜色系统
    useMaterial3: true,
    // 颜色方案配置
    // Material 3 中，所有颜色通过 ColorScheme 统一管理
    colorScheme: ColorScheme.fromSeed(
      // 种子颜色：系统会根据这个颜色自动生成完整的配色方案
      // 例如：从紫色生成主色、强调色、背景色等
      seedColor: Colors.deepPurple,
      // 主色：应用的主要品牌颜色，用于按钮、链接等关键元素
      // 0xFF6200EE 是深紫色的十六进制值
      primary: Color(0xFF6200EE),
      // 主色上的文字颜色：确保在主色背景上的文字清晰可读
      // 通常是白色或浅色，与主色形成对比
      onPrimary: Colors.white,
      // 亮度模式：控制整个颜色方案的亮度
      // Brightness.light 表示浅色主题（亮背景，暗文字）
      brightness: Brightness.light,
    ),
    // 应用栏（AppBar）主题配置
    // AppBar 是应用顶部的导航栏
    appBarTheme: const AppBarTheme(
      // 阴影高度：0 表示无阴影，扁平化设计
      // 数值越大，阴影越明显
      elevation: 0,
      // 背景颜色：AppBar 的背景色
      // 浅色主题使用白色背景
      backgroundColor: Colors.white,
      // 前景颜色：AppBar 上的文字和图标颜色
      // 浅色主题使用黑色文字
      foregroundColor: Colors.black,
    ),
    // 文本主题配置
    // 定义应用中各种文本的默认样式
    textTheme: TextTheme(
      // 大标题样式：用于页面主标题
      // fontSize: 24 表示字体大小 24
      // fontWeight: FontWeight.bold 表示粗体
      headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      // 正文中等样式：用于普通正文内容
      // fontSize: 16 是常用的正文大小
      bodyMedium: TextStyle(fontSize: 16),
    ),
    // 卡片主题配置
    // Card 组件是用于展示内容的容器
    cardTheme: CardThemeData(
      // 形状：定义卡片的边框形状
      // RoundedRectangleBorder 表示圆角矩形
      // BorderRadius.circular(16) 表示圆角半径为 16 像素
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      // 阴影高度：卡片浮起的视觉效果
      // elevation: 2 表示轻微的阴影，让卡片有层次感
      elevation: 2,
    ),
  );

  /// 深色主题配置
  /// 使用 static final：只创建一次，性能更好，避免重复创建
  static final ThemeData darkTheme = ThemeData(
    // 启用 Material 3 设计规范（最新版本）
    useMaterial3: true,
    // 颜色方案配置（深色模式）
    colorScheme: ColorScheme.fromSeed(
      // 种子颜色：与浅色主题相同，但会根据 brightness 自动调整
      seedColor: Colors.deepPurple,
      // 主色：深色主题下的主色（通常比浅色主题更亮）
      primary: Color(0xFF6200EE),
      // 主色上的文字颜色：深色主题下通常也是白色
      onPrimary: Colors.white,
      // 亮度模式：Brightness.dark 表示深色主题（暗背景，亮文字）
      // 系统会根据此自动调整所有颜色的亮度
      brightness: Brightness.dark,
    ),
    // 应用栏主题配置（深色模式）
    appBarTheme: const AppBarTheme(
      // 阴影高度：0 表示无阴影
      elevation: 0,
      // 背景颜色：深色主题使用黑色背景
      backgroundColor: Colors.black,
      // 前景颜色：深色主题使用白色文字和图标
      foregroundColor: Colors.white,
    ),
    // 文本主题配置（深色模式）
    // 文本样式与浅色主题相同，但颜色会自动适配
    textTheme: TextTheme(
      // 大标题样式：与浅色主题相同
      headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      // 正文样式：与浅色主题相同
      bodyMedium: TextStyle(fontSize: 16),
    ),
    // 卡片主题配置（深色模式）
    cardTheme: CardThemeData(
      // 形状：与浅色主题相同，圆角矩形
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      // 阴影高度：与浅色主题相同
      elevation: 2,
    ),
  );
}
