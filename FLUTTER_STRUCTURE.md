# 📁 Flutter 项目文件结构详解

本文档详细解释 Flutter 项目的文件结构和每个目录/文件的作用。

## 📂 项目根目录结构

```
echopal/
├── lib/                    # 📝 Dart 源代码目录（主要开发目录）
├── android/                # 🤖 Android 平台特定代码
├── ios/                    # 🍎 iOS 平台特定代码
├── web/                    # 🌐 Web 平台特定代码
├── windows/                # 🪟 Windows 桌面平台代码
├── linux/                  # 🐧 Linux 桌面平台代码
├── macos/                  # 🍎 macOS 桌面平台代码
├── test/                   # 🧪 测试代码
├── build/                  # 🏗️ 构建输出目录（自动生成，可忽略）
├── pubspec.yaml           # 📦 项目配置文件（依赖、资源等）
├── pubspec.lock           # 🔒 锁定依赖版本（自动生成）
├── analysis_options.yaml  # 🔍 代码分析配置
└── README.md              # 📖 项目说明文档
```

---

## 📝 核心目录详解

### 1. `lib/` - Dart 源代码目录 ⭐

**最重要的目录，你的主要代码都在这里！**

```
lib/
└── main.dart              # 应用入口文件
```

**作用：**
- 存放所有 Dart 源代码
- `main.dart` 是应用的入口点，包含 `main()` 函数
- 通常按功能组织子目录，例如：
  ```
  lib/
  ├── main.dart
  ├── models/          # 数据模型
  ├── views/           # UI 页面
  ├── widgets/         # 可复用组件
  ├── services/        # 业务逻辑服务
  └── utils/           # 工具类
  ```

**示例：**
```dart
// lib/main.dart
void main() {
  runApp(const MyApp());
}
```

---

### 2. `pubspec.yaml` - 项目配置文件 📦

**项目的"身份证"，定义项目信息和依赖**

**主要配置项：**

```yaml
name: echopal                    # 项目名称
description: "A new Flutter project."  # 项目描述
version: 1.0.0+1                 # 版本号（1.0.0是版本，+1是构建号）

environment:
  sdk: ^3.10.0                   # Dart SDK 版本要求

dependencies:                   # 生产环境依赖
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8       # iOS 风格图标

dev_dependencies:               # 开发环境依赖
  flutter_test:
    sdk: flutter
  flutter_lints: ^6.0.0         # 代码规范检查

flutter:
  uses-material-design: true     # 使用 Material Design 图标
  
  # 资源文件配置（图片、字体等）
  # assets:
  #   - images/logo.png
  #   - images/background.jpg
  
  # 字体配置
  # fonts:
  #   - family: CustomFont
  #     fonts:
  #       - asset: fonts/CustomFont-Regular.ttf
```

**常用命令：**
- `flutter pub get` - 安装依赖
- `flutter pub upgrade` - 升级依赖
- `flutter pub outdated` - 查看过期依赖

---

### 3. `android/` - Android 平台代码 🤖

**Android 原生代码和配置**

```
lib/
 ├── main.dart
 ├── app.dart                        # App入口
 ├── config/                         # 配置文件（如主题、常量）
 │     ├── theme.dart
 │     └── constants.dart
 ├── router/                         # 路由
 │     └── app_router.dart
 ├── pages/
 │     ├── home/
 │     │    ├── home_page.dart
 │     │    └── home_view_model.dart
 │     ├── daily_conversation/
 │     │    ├── daily_conversation_page.dart
 │     │    └── daily_conversation_view_model.dart
 │     ├── grammar/
 │     │    ├── grammar_page.dart
 │     │    └── grammar_view_model.dart
 │     ├── pronunciation/
 │     │    ├── pronunciation_page.dart
 │     │    └── pronunciation_view_model.dart
 │     ├── agent_chat/
 │     │    ├── agent_chat_page.dart
 │     │    └── agent_chat_view_model.dart
 │     └── settings/
 │          ├── settings_page.dart
 │          └── settings_view_model.dart
 ├── widgets/                        # 小组件
 │     ├── card_item.dart
 │     ├── section_title.dart
 │     └── audio_player.dart
 ├── services/                       # 调用本地 Ollama / Langchain
 │     ├── ollama_service.dart
 │     ├── agent_service.dart
 │     └── tts_service.dart          # 文本转语音
 └── utils/
       ├── time_utils.dart
       └── http.dart

```

**重要文件说明：**

- **`app/build.gradle.kts`** - Android 应用构建配置
  - 应用 ID、版本号
  - 最低 SDK 版本
  - 依赖库配置

- **`AndroidManifest.xml`** - Android 应用清单
  - 应用名称、图标
  - 权限声明
  - Activity 配置
  - 应用入口点

- **`MainActivity.kt`** - Android 主 Activity
  ```kotlin
  class MainActivity : FlutterActivity()
  ```
  - Flutter 应用的 Android 入口点
  - 通常不需要修改

**何时需要修改：**
- 添加 Android 权限（网络、相机、位置等）
- 配置应用图标和启动画面
- 集成原生 Android 功能
- 配置应用签名

---

### 4. `ios/` - iOS 平台代码 🍎

**iOS 原生代码和配置（macOS 专用）**

```
ios/
├── Runner/
│   ├── AppDelegate.swift       # iOS 应用委托
│   ├── Info.plist              # iOS 应用配置（权限、版本等）
│   └── Assets.xcassets/        # 资源文件（图标、启动图）
├── Runner.xcodeproj/           # Xcode 项目文件
└── Runner.xcworkspace/         # Xcode 工作空间
```

**重要文件说明：**

- **`AppDelegate.swift`** - iOS 应用委托
  - 应用生命周期管理
  - Flutter 引擎初始化

- **`Info.plist`** - iOS 应用配置
  - 应用名称、版本
  - 权限配置（相机、位置等）
  - URL Scheme 配置

**注意：** iOS 开发需要 macOS 和 Xcode

---

### 5. `web/` - Web 平台代码 🌐

**Web 平台特定配置**

```
web/
├── index.html              # Web 入口 HTML 文件
├── manifest.json          # Web 应用清单（PWA 配置）
└── icons/                 # Web 图标
    ├── Icon-192.png
    └── Icon-512.png
```

**重要文件说明：**

- **`index.html`** - Web 入口文件
  - 加载 Flutter Web 应用
  - 可以添加自定义 HTML/CSS/JS

- **`manifest.json`** - PWA 配置
  - 应用名称、图标
  - 主题颜色
  - 显示模式

---

### 6. `windows/` / `linux/` / `macos/` - 桌面平台代码 🖥️

**桌面平台原生代码**

```
windows/
├── runner/
│   ├── main.cpp            # Windows 入口点（C++）
│   └── flutter_window.cpp  # Flutter 窗口管理
└── CMakeLists.txt          # CMake 构建配置
```

**作用：**
- 桌面应用的窗口管理
- 系统集成（通知、文件选择器等）
- 原生功能调用

---

### 7. `test/` - 测试代码 🧪

**单元测试和集成测试**

```
test/
└── widget_test.dart        # Widget 测试示例
```

**测试类型：**
- **单元测试** - 测试单个函数/类
- **Widget 测试** - 测试 UI 组件
- **集成测试** - 测试完整应用流程

**运行测试：**
```bash
flutter test              # 运行所有测试
flutter test test/widget_test.dart  # 运行特定测试
```

---

### 8. `build/` - 构建输出目录 🏗️

**自动生成的构建产物（不要手动修改）**

```
build/
├── app/                   # 应用构建输出
│   └── outputs/          # APK、IPA 等安装包
└── ...                   # 其他构建缓存
```

**特点：**
- 自动生成，可忽略
- 通常添加到 `.gitignore`
- 运行 `flutter clean` 会删除此目录

---

### 9. `analysis_options.yaml` - 代码分析配置 🔍

**配置代码规范和静态分析规则**

```yaml
include: package:flutter_lints/flutter.yaml

linter:
  rules:
    # avoid_print: false      # 禁用 print 警告
    # prefer_single_quotes: true  # 启用单引号偏好
```

**作用：**
- 定义代码规范（Lint 规则）
- 配置静态分析器
- 在 IDE 中显示警告和建议

**常用命令：**
```bash
flutter analyze           # 分析代码
```

---

### 10. `pubspec.lock` - 依赖锁定文件 🔒

**锁定依赖的具体版本（自动生成）**

**作用：**
- 确保团队成员使用相同版本的依赖
- 保证构建的可重复性
- 自动生成，通常提交到 Git

**注意：** 不要手动修改此文件

---

## 🎯 文件组织最佳实践

### 推荐的 `lib/` 目录结构

```
lib/
├── main.dart                 # 应用入口
├── app.dart                  # 主应用 Widget
├── models/                   # 数据模型
│   ├── user.dart
│   └── product.dart
├── views/                    # 页面/视图
│   ├── home_page.dart
│   ├── login_page.dart
│   └── profile_page.dart
├── widgets/                  # 可复用组件
│   ├── custom_button.dart
│   └── custom_card.dart
├── services/                # 业务逻辑/服务
│   ├── api_service.dart
│   └── storage_service.dart
├── utils/                    # 工具类
│   ├── constants.dart
│   └── helpers.dart
└── theme/                    # 主题配置
    └── app_theme.dart
```

---

## 📋 重要文件速查表

| 文件/目录 | 作用 | 是否需要修改 |
|---------|------|------------|
| `lib/main.dart` | 应用入口 | ✅ 经常修改 |
| `pubspec.yaml` | 项目配置、依赖 | ✅ 经常修改 |
| `android/app/src/main/AndroidManifest.xml` | Android 配置 | ⚠️ 需要权限时修改 |
| `ios/Runner/Info.plist` | iOS 配置 | ⚠️ 需要权限时修改 |
| `web/index.html` | Web 入口 | ⚠️ 需要自定义时修改 |
| `analysis_options.yaml` | 代码规范 | ⚠️ 需要自定义规则时修改 |
| `build/` | 构建输出 | ❌ 自动生成，忽略 |
| `pubspec.lock` | 依赖锁定 | ❌ 自动生成 |

---

## 🚀 快速参考

### 添加依赖
1. 在 `pubspec.yaml` 的 `dependencies:` 下添加
2. 运行 `flutter pub get`

### 添加资源文件
1. 创建 `assets/` 目录
2. 在 `pubspec.yaml` 的 `flutter:` 下添加：
   ```yaml
   assets:
     - assets/images/logo.png
   ```
3. 运行 `flutter pub get`

### 添加自定义字体
1. 创建 `fonts/` 目录，放入字体文件
2. 在 `pubspec.yaml` 的 `flutter:` 下添加：
   ```yaml
   fonts:
     - family: CustomFont
       fonts:
         - asset: fonts/CustomFont-Regular.ttf
   ```
3. 运行 `flutter pub get`

---

## 📚 相关资源

- [Flutter 官方文档](https://docs.flutter.dev/)
- [Dart 语言指南](https://dart.dev/guides)
- [Flutter 包管理](https://pub.dev/)

---

**提示：** 作为初学者，主要关注 `lib/` 目录和 `pubspec.yaml` 文件即可！

