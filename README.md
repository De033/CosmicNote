---
tags:
  - 模板/课程笔记
  - 技术文档/排版
  - 软件/版本管理
  - 排版/typst
  - 文档模板
  - 工具/vscode-插件
---

<div align="center">
  <h1>CosmicNote (Tufte 横屏版)</h1>
  <p>一个专为长篇课程笔记、学术排版设计的高级 Typst 模板，结合了现代横屏美学与 Tufte 风格侧边栏。</p>
</div>

## 🌟 模板介绍

**CosmicNote** 是一款为极致排版体验而生的 Typst 笔记模板。本项目最初修改自 [SimpleNote](https://github.com/a-kkiri/SimpleNote) 和 [jsk-lecnotes](https://github.com/jskherman/jsk-lecnotes)，并在其基础上进行了视觉与架构的重构。

**核心特色：**
- 📐 **超宽横屏 (Landscape) & Tufte 风格侧边栏**：默认采用 29.7cm × 21cm 横向画幅，拥有高达 12.2cm 的超宽侧边栏空间。彻底解放排版，让插图、旁注（Margin Note）、代码块不再局促。页眉装饰线优雅地横跨整个版面。
- 🎨 **高级色彩美学**：摒弃了高饱和度原色，默认使用“幽灵灰 (Geistergrau)”护眼背景与“冷钢蓝 (Steel Blue)”主题色，配套的定理盒子呈现出低调的高级感。
- 📦 **零依赖跨项目兼容**：完美兼容 Tufte-style 的语法（如 `#tufted.margin-note` 和 `#tufted.full-width`）。
- 🔤 **原生支持高品质开源字体**：内置并默认推荐使用霞鹜文楷 (LXGW Bright) 和 Linux Libertine 字体组合，杜绝了变量字体引起的编译警告。

## 🚀 快速开始

### 前置要求
- [Typst](https://github.com/typst/typst) CLI (建议版本 0.14.0+)
- 推荐使用 VS Code 编辑器，并安装 [Tinymist](https://marketplace.visualstudio.com/items?itemName=mgt19937.typst-preview) 插件进行实时预览。

### 推荐字体安装
为了达到最佳的零警告渲染效果，建议在系统中安装以下免费开源字体：
1. **[LXGW Bright (霞鹜文楷/炫光)](https://github.com/lxgw/LxgwBright)** - 中文主字体
2. **[Linux Libertine G](https://linuxlibertine.org/)** - 英文主字体

### 文件结构
```text
CosmicNote/
├── main.typ          # 项目主入口文件，配置文档元数据与引入章节
├── template.typ      # 核心排版引擎，控制所有样式和默认参数
├── tufted.typ        # Tufte 风格侧边栏的排版计算逻辑
├── index.typ         # 兼容性环境的统一导出网关
├── refs.bib          # 参考文献文件
└── content/          # 所有的具体笔记/章节文件
```

### 编写内容
在 `main.typ` 中填写您的课程名称和作者信息，随后直接 `#include` 您的章节文件即可：
```typst
#include "content/chapter1.typ"
```

如果您需要在子文件中使用旁注或全宽排版，只需在子文件头部导入 `index.typ`：
```typst
#import "../index.typ": *

正文内容...
#tufted.margin-note[这是一个悬挂在右侧超大空白处的旁注，会自动计算绝对坐标完美对齐！]

#tufted.full-width[
  这是一个跨越正文和侧边栏的超宽内容区域。
]
```

## 🛠️ 高级配置 (自定义页面)

我们在 `template.typ` 中暴露了高度灵活的页面配置接口。默认提供超宽横排版式。

如果您不喜欢横屏或希望微调，随时可以在 `main.typ` 中重写配置参数：

```typst
#show: template.with(
  // 恢复竖屏 A4
  paper-size: "a4",
  flipped: false,
  // 恢复传统对称边距
  page-margin: (x: 2.5cm, y: 2.5cm),
  // ... 其他配置
)
```

## 📜 许可证

本项目开源，您可以自由地使用本模板编写您的个人笔记、出版物或进行二次开发。