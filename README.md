<div align="center">
  <h1>CosmicNote (Tufte 横屏版)</h1>
  <p>一个专为长篇课程笔记、学术排版设计的高级 Typst 模板，结合了现代横屏美学与 Tufte 风格侧边栏。</p>
</div>

## 🌟 模板介绍

**CosmicNote** 是一款为极致排版体验而生的 Typst 笔记模板。它不仅提供了开箱即用的优雅视觉设计，还深度整合了大量现代化排版组件，让你可以像写 Markdown 一样轻松构建出包含精美侧边栏的学术级 PDF。

**核心特色：**
- 📐 **超宽横屏 (Landscape) & Tufte 风格侧边栏**：默认采用 29.7cm × 21cm 横向画幅（A4 翻转），拥有高达 12.2cm 的超宽侧边栏空间。彻底解放排版，让插图、旁注（Margin Note）、代码块不再局促。页眉装饰线优雅地横跨整个版面。
- 🎨 **高级色彩美学**：摒弃了高饱和度原色，默认使用“幽灵灰 (Geistergrau)”护眼背景与“冷钢蓝 (Steel Blue)”主题色，配套的定理盒子呈现出低调的高级感。
- 📦 **All-in-One 宏包集成**：通过 `index.typ` 一键导入多个强大的外部宏包。
  - 引用了 `@preview/theorion` 的精美提示框组件 (`quote-box`, `tip-box`, `note-box`, `warning-box` 等)。
  - 集成了 `@preview/tablem` 支持快速渲染 Markdown 格式表格。
  - 集成了 `@preview/cmarker` 与 `@preview/mitex` 原生支持直接嵌入并渲染 Markdown 文件与复杂 LaTeX 公式。
- 🔄 **完美的生态兼容性**：完美兼容 Tufte 风格的自定义语法（如 `#tufted.margin-note` 和 `#tufted.full-width`，以及伪装的 `#html.hr()`），并且实现了 **0 报错、0 警告**，确保在 VS Code 的 Tinymist 插件中拥有丝滑的实时预览体验。
- 🔤 **原生支持高品质开源字体**：内置并默认推荐使用霞鹜文楷 (LXGW Bright) 和 Linux Libertine 字体组合。

## 🚀 快速开始

### 前置要求
- [Typst](https://github.com/typst/typst) CLI (建议版本 0.12.0+)
- 推荐使用 VS Code 编辑器，并安装 [Tinymist](https://marketplace.visualstudio.com/items?itemName=mgt19937.typst-preview) 插件进行实时预览。

### 推荐字体安装
为了达到最佳的零警告渲染效果，建议在系统中安装以下免费开源静态字体：
1. **[LXGW Bright (霞鹜文楷/炫光)](https://github.com/lxgw/LxgwBright)** - 中文主字体
2. **[Linux Libertine G](https://linuxlibertine.org/)** - 英文主字体

### 项目结构
```text
CosmicNote/
├── main.typ          # 项目主入口文件，配置文档元数据与引入章节
├── template.typ      # 核心排版引擎，控制所有样式和默认参数
├── tufted.typ        # Tufte 风格侧边栏的排版计算逻辑 (绝对定位算法)
├── index.typ         # 统一导出网关 (导出 CosmicNote 组件与所有集成宏包)
├── html.typ          # PDF 端的伪 HTML 组件兼容层
├── refs.bib          # 参考文献文件
└── content/          # 演示内容与具体笔记目录
    ├── 01-introduction.typ
    ├── 02-typography.typ
    ├── 03-components.typ
    └── 04-showcase.typ  # 终极语法兼容速览与样例
```

### 编写内容
在 `main.typ` 中填写您的文档名称和作者信息，随后直接 `#include` 您的章节文件即可：
```typst
#include "content/01-introduction.typ"
```

在你的子文件中，只需在开头导入 `index.typ`，即可解锁全部高级语法：
```typst
#import "../index.typ": *

= 我的第一章

正文内容...
#tufted.margin-note[这是一个悬挂在右侧超大空白处的旁注，会自动计算绝对坐标完美对齐！]

#tufted.full-width[
  这是一个跨越正文和侧边栏的超宽内容区域。用于展示超大表格或图片。
]

#note-box[
  这里直接调用了 Theorion 宏包的提示框组件！
]

#tablem[
  | *Name* | *Location* | *Height* | *Score* |
  | :----: | :--------: | :------: | :-----: |
  | John   | Second St. | 180 cm   | 5       |
]
```

## 🛠️ 高级配置

我们在 `template.typ` 中暴露了高度灵活的页面配置接口。默认提供超宽横排版式。
如果您不喜欢横屏或希望微调，随时可以在 `main.typ` 的 `#show: template.with(...)` 中重写配置参数：

```typst
#show: template.with(
  paper-size: "a4",
  flipped: false,                     // 恢复竖屏 A4
  page-margin: (x: 2.5cm, y: 2.5cm),  // 恢复传统对称边距
  // ... 其他配置
)
```

## 🙏 鸣谢 (Acknowledgements)

本模板的诞生离不开开源社区的众多优秀项目：

- **🎉 特别感谢 [Yousa-Mirage/Tufted-Blog-Template](https://github.com/Yousa-Mirage/Tufted-Blog-Template)**：感谢 Yousa-Mirage 老师出色的 Tufte 网页博客模板设计！本 CosmicNote 模板的 Tufte 侧边栏交互理念、极其丰富的内容块语法（旁注、全宽环境、`theorion` 定理框集成、Markdown 嵌入等）均深受该项目启发，并致力于实现两套环境之间代码级的高度兼容，让同一套代码能够轻松渲染出精美的博客网页和优雅的 PDF 文档。
- **[SimpleNote](https://github.com/a-kkiri/SimpleNote)** & **[jsk-lecnotes](https://github.com/jskherman/jsk-lecnotes)**：CosmicNote 最早的底层排版结构和部分视觉组件思路来源于这两个优秀的开源 Typst 笔记模板。
- **[OrangeX4](https://github.com/OrangeX4)**：感谢大佬开发的 `theorion` 定理包与 `tablem` Markdown 表格包，极大地丰富了 Typst 的排版生态。

## 📜 许可证

本项目开源，您可以自由地使用本模板编写您的个人笔记、出版物或进行二次开发。