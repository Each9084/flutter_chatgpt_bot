# ChatGPT Bot 🤖

<p align="right">
  <img src="https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png" alt="Flutter Icon" width="100" style="margin-right: 20px;"/>
  <img src="https://upload.wikimedia.org/wikipedia/commons/0/04/ChatGPT_logo.svg" alt="ChatGPT Icon" width="100"/>
</p>



欢迎使用 **ChatGPT Bot** —— 一个基于 Flutter 的移动应用，集成了 OpenAI GPT 模型，提供实时聊天功能。通过该应用，您可以与 ChatGPT 进行互动，获得 AI 生成的实时回答，享受流畅直观的使用体验。



该项目已完成基本的框架构建,采用最新`chat_gpt_sdk 3.1.2`,所有API Reference均来自OpenAI提供.

各位可以直接clone此项目上手以添加其他内容.



## 📱安卓Demo在以下位置:

`chatgpt_bot\apkDemo`

根据您构建的 APK 文件，Android 设备会根据其 CPU 架构来选择合适的 APK。以下是每种 APK 文件对应的架构：

1. **app-armeabi-v7a-release.apk**：适用于 ARMv7 架构的设备（32 位）。
2. **app-arm64-v8a-release.apk**：适用于 ARM64 架构的设备（64 位）。
3. **app-x86_64-release.apk**：适用于 x86_64 架构的设备（主要用于模拟器和某些特定的 Intel 处理器设备）。

**选择 APK：**

- 如果您的目标设备是 **ARM 设备**，大多数 Android 设备（如三星、华为等）都使用 ARM 架构，您应该选择 **app-armeabi-v7a-release.apk**（对于 32 位设备）或者 **app-arm64-v8a-release.apk**（对于 64 位设备）。现代 Android 设备大多是 64 位架构，所以推荐选择 `app-arm64-v8a-release.apk`。
- 如果您在 **模拟器** 上运行，或者设备使用 **x86 架构**，那么应该选择 **app-x86_64-release.apk**。



## 🚀 功能

- **实时聊天**：与 OpenAI GPT 模型实时对话,本案例采用ChatGpt-4o-mini

- **成熟的 框架**：简单易用的界面，严格按照OpenAPI建立的结构,实现顺畅的交互体验。
- **跨平台支持**：使用 Flutter 开发，支持 Android,IOS,Windows客户端,Web应用.

<img src="./apkDemo/demostration.gif" width="200" />




# 未来计划

由于本人为学生,课业繁重,且有多个项目需要开发维护,未来将尽力推进项目,完善更多框架和功能.

**ChatGPT Bot** 项目未来将朝着以下方向发展和改进：



### 🚀 1. 支持更多平台

- **iOS 支持**：目前该应用只支持 Android 平台。计划未来将扩展到 iOS，确保在两个主流平台上都能提供一致的用户体验,目前最大的阻碍是我没有MacBook:cry:.
- **Web 支持**：将应用转为 Web 版本，让更多用户能够通过浏览器访问 ChatGPT Bot。<span style="color: red;">(低优先级,我正在迁移云端数据)</span> 

- **客户端支持**: 构建Window友好的客户端<span style="color: red;"> (低优先级,我从未开发过)</span> 

### 🧠 2. 增强 AI 模型功能

- **多模型支持**：目前 ChatGPT 仅支持ChatGpt-4o mini，未来将扩展多模型支持，以满足不同用户的需求。
- **对话上下文跟踪**：实现更智能的对话上下文跟踪，让 ChatGPT 更加了解用户的历史对话，提高回复的相关性和准确性。
- **添加文档传输功能**: 可以分析文档内容,但似乎Claude更善于此,我正在阅读anthropic的API指南<span style="color: green;"> (高优先级,应该不久后就会见面)</span> 

### 🛠️ 3. 优化用户体验

- **UI 改进**：持续优化应用的用户界面和交互体验，目前只是矿建,满足基本功能。
- **消息管理**：实现更丰富的消息管理功能，如删除、编辑或标记消息，提升用户的灵活性和自由度。
- **动态主题支持**：根据系统设置或用户偏好，实现夜间模式和自动主题切换功能。

### 🔒 4. 增强安全性

- **数据加密**：增强与 OpenAI API 的通信加密，保护用户数据的安全性。
- **隐私保护**：明确告知用户数据的使用方式，并采取措施保证其隐私得到妥善保护。

### 📈 5. 数据分析与统计

- **对话质量分析**：通过对话分析，持续改进线程问题，提升响应速度。

### 🤝 6. 社区与开源

- **开源化**：计划将项目部分或全部开源，鼓励开发者社区的贡献，推动项目的进一步发展。
- **用户反馈收集**：定期收集用户的反馈和建议，改进应用并解决用户提出的问题。

### 📱 7. 移动设备优化

- **支持更多设备**：除了智能手机外，计划优化 ChatGPT Bot 以适配各种智能设备，如平板、智能手表等。
- **性能优化**：对应用进行性能优化，确保在不同的设备上都能流畅运行，提升应用的稳定性和响应速度。

### 🔮 8. 扩展功能

- **语音输入与输出**：未来计划加入语音识别和语音合成功能，使用户可以通过语音与 ChatGPT 进行互动。
- **定制化 AI 聊天机器人**：提供更多定制化选项，让用户能够创建符合个人需求的聊天机器人模型。



## 🏗️ 项目结构

项目结构如下：

chatgpt_bot/ 

├── android/ # Android 特定的配置文件和资源   
	├── assets/ # 应用资源，例如图像、图标等   
├── ios/ # iOS 特定的配置文件和资源   
├── lib/ # Flutter 应用代码   
	│ ├── models/ # 包含消息模型，例如 MessageModel   
	│ ├── services/ # 处理与 OpenAI API 的通信   
	│ ├── main.dart # 应用入口和 UI   
├── test/ # 测试文件   
├── pubspec.yaml # 项目的依赖和元数据   
└── README.md # 项目的文档  



## 💻 环境要求

- **Flutter SDK**: 3.0 或更高版本(空安全)。
- **Android Studio**（或 Visual Studio Code）用于开发和调试。
- **OpenAI API 密钥**：从 [OpenAI 平台](https://platform.openai.com/) 获取 API 密钥。



## 📦 安装步骤

### 1. 克隆仓库

首先，克隆该项目到本地机器：
```bash
git clone https://github.com/your-username/chatgpt_bot.git
cd chatgpt_bot
```

### 2. 配置 OpenAI API 密钥

- 前往 [OpenAI](https://platform.openai.com/) 获取您的 API 密钥。
- 在 `lib/services/openai_service.dart` 文件中，设置您的 API 密钥：

```dart
final openAI = OpenAI(apiKey: "your-api-key-here");
```

### 3. 安装依赖

运行以下命令来安装项目所需的所有依赖：

```dart
flutter pub get
```

### 4. 在 Android 设备上运行

运行以下命令启动应用：

```dart
flutter run
```

### 5. 打包 APK（发布版）

要打包发布版的 APK（并按 ABI 拆分），运行：

```dart
flutter build apk --split-per-abi
```



## 🛠️ 常见问题

### 1. **API 密钥配置**

确保您已在 `lib/services/openai_service.dart` 文件中正确配置了 OpenAI API 密钥：

```dart
final openAI = OpenAI(apiKey: "your-api-key-here");
```

### 2. **构建错误**

如果在构建 APK 时遇到问题，可以运行以下命令进行清理和重新构建：

```dart
flutter clean
flutter pub get
flutter build apk --split-per-abi
```

### 3. **查看日志**

您可以使用以下命令查看详细的日志：

```dart
flutter logs
```

## 🌟 贡献

如果您想为该项目做贡献，欢迎 fork 仓库并提交 Pull Request。我们非常欢迎任何类型的贡献，包括修复 bug、功能增强或建议！

### 贡献步骤：

1. Fork 该仓库。
2. 创建一个新分支（`git checkout -b feature-branch`）。
3. 提交您的更改（`git commit -am 'Add feature'`）。
4. 推送分支（`git push origin feature-branch`）。
5. 提交 Pull Request。
