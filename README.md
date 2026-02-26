# ⚡ PhonoArk.Android（音标方舟 · 原生版）

> 基于 **Kotlin + Jetpack Compose** 原生构建的 Android IPA 音标学习应用。

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Kotlin](https://img.shields.io/badge/Kotlin-2.1-7F52FF.svg)](https://kotlinlang.org/)
[![Jetpack Compose](https://img.shields.io/badge/Compose-BOM%202024.12-4285F4.svg)](https://developer.android.com/jetpack/compose)
[![Min SDK](https://img.shields.io/badge/minSdk-26-brightgreen.svg)]()

本项目是 [PhonoArk](https://github.com/kukisama/PhonoArk)（.NET + Avalonia 跨平台版）的 **Android 原生重写**，使用 Kotlin 与 Jetpack Compose 从零构建，专注于 Android 平台的极致体验。

---

## 🏎️ 为什么用原生？

| 维度 | Kotlin 原生 (本项目) | .NET + Avalonia 跨平台 |
| --- | --- | --- |
| **启动速度** | AOT 编译 + 无运行时桥接，冷启动更快 | 需加载 Mono/.NET 运行时 |
| **内存占用** | Compose 运行时轻量，与系统共享 ART | 额外携带跨平台框架开销 |
| **包体积** | APK ≈ 5–8 MB（不含语音包） | 需打包 .NET 运行时 + Avalonia 框架 |
| **系统集成** | 直接调用 Android API，TTS / MediaPlayer / 权限无缝衔接 | 通过平台抽象层间接调用 |
| **动画 & 手势** | Compose 原生动画系统，60 fps 无卡顿 | 依赖 Avalonia 渲染管线 |
| **依赖生态** | Hilt / Room / Navigation — Android Jetpack 一等公民 | 需适配 .NET 生态中的 Android 绑定 |

> 简而言之：**同样的功能，原生版更快、更小、更省电。**

---

## ✨ 功能概览

| 模块 | 说明 |
| --- | --- |
| 🗂️ IPA 音标图表 | 元音 / 双元音 / 辅音分组 Card 展示，点击即播发音，选中查看详情与示例单词 |
| 🔊 多口音发音 | US-Jenny 真人录音优先 → GenAm 美式 TTS → RP 英式 TTS，三种口音自由切换 |
| 📝 听音辨词测试 | 可配题数与范围（全部 / 仅收藏），四选一即时反馈，1.2 秒自动跳转，round-robin 出题去重 |
| 📊 历史与错题 | 分页加载考试记录、逐题回顾、平均分统计、按音标维度错误频次分析、仅错题筛选 |
| ⭐ 收藏管理 | 单个音标收藏 / 取消，按类型批量收藏，一键清空，收藏已合并至 IPA 首页 |
| 🩺 语音诊断 | 输出平台信息、TTS 引擎、可用语音列表、音量状态 |
| ⚙️ 设置 | 默认口音、音量、题目数量、深色模式、界面语言（中 / 英） |

---

## 🧱 技术架构

```text
app/src/main/java/com/phonoark/
├── data/
│   ├── model/          # Phoneme、ExampleWord、ExamResult 等数据模型
│   ├── local/           # Room 数据库（考试记录、收藏持久化）
│   └── repository/      # PhonemeRepository、AudioRepository
├── di/                  # Hilt 依赖注入模块
├── ui/
│   ├── ipachart/        # IPA 图表页（ViewModel + Composable）
│   ├── exam/            # 听音辨词测试
│   ├── history/         # 历史记录与错题
│   ├── settings/        # 设置页
│   ├── navigation/      # 底部导航（IPA / Exam / History / Settings）
│   └── theme/           # Material 3 主题与颜色
├── MainActivity.kt
├── SplashActivity.kt
└── PhonoArkApplication.kt
```

**技术栈一览：**
- **语言**：Kotlin 2.1
- **UI**：Jetpack Compose + Material 3
- **DI**：Hilt (Dagger)
- **数据库**：Room
- **导航**：Navigation Compose
- **构建**：Gradle 8.11 + KSP
- **最低版本**：Android 8.0 (API 26)，Target SDK 35

---

## 🔊 语音包机制

- 真人发音采用 **US-Jenny** 录音包（WAV 格式，约 291 个音频文件）
- 构建时由 Gradle `extractVoicePack` 任务自动从 `US-Jenny.zip` 解压到 `assets/`
- 播放优先级：**真人录音 WAV → 系统 TTS 回退**
- 语音包资产在 `.gitignore` 中排除（~37 MB），构建时自动生成

---

## 🚀 快速开始

### 使用发行包

前往 [Releases](../../releases) 下载 `PhonoArk-android-arm64.apk`，直接安装即可。

### 从源码构建

```bash
git clone https://github.com/kukisama/KotlinPhonoArk.git
cd KotlinPhonoArk

# 确保已安装 JDK 17 和 Android SDK
./gradlew assembleDebug

# APK 输出位置
# app/build/outputs/apk/debug/app-debug.apk
```

---

## 🧭 页面导航

底部导航栏包含 4 个入口：

1. **国际音标** — IPA Chart 交互图表 + 收藏管理
2. **练习测试** — 听音辨词四选一
3. **历史记录** — 考试回顾与错题分析
4. **设置** — 口音 / 音量 / 外观 / 语言

---

## 📚 相关文档

- 跨平台版本：[PhonoArk (.NET + Avalonia)](https://github.com/kukisama/PhonoArk)

---

## 📝 许可证

本项目基于 [MIT 许可证](LICENSE) 开源。
