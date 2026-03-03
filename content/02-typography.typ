#import "../index.typ": *

= 文本与排版

== 基础格式

你可以使用 Typst 的标准语法对文本进行标记，包括 *粗体*、_斜体_ 或是 #highlight[高亮文本]。
对于特殊的名词，也可以使用行内代码的格式，比如 `Ctrl + C`。

列表同样非常简单：

- 无序列表项 1
- 无序列表项 2
  - 嵌套的子列表
    #tufted.margin-note[
      *列表中的旁注*：即使在嵌套的列表中调用旁注，底层也会通过 `context` 的坐标换算，将其准确、笔直地锚定在页面的绝对侧边栏位置，绝不偏移。
    ]
  - 嵌套的子列表 2

== 代码排版

代码块默认使用等宽字体，支持语法高亮，并且带有优雅的背景色与行号。

#figure(
```python
def fibonacci(n):
    if n <= 1:
        return n
    return fibonacci(n-1) + fibonacci(n-2)

print("Fibonacci of 10 is", fibonacci(10))
```,
caption: [简单的 Python 代码示例]
) <python-example>

== 数学公式

数学公式的渲染也是学术笔记的重中之重。行内公式使用单侧 `$` 符号，例如：由勾股定理可知 $a^2 + b^2 = c^2$。

行间公式只需在两侧添加空格，它会自动居中并生成编号：

$ integral.triple_(Omega) \(frac(partial P, partial x) + frac(partial Q, partial y) + frac(partial R, partial z)\) d v = integral.surf_(Sigma) P d y d z + Q d z d x + R d x d y $<gauss>

@gauss 就是著名的 *高斯公式 (Gauss's Divergence Theorem)*，它建立了体积分与曲面积分之间的深刻联系。

== 引用块

我们重新设计了原生的引用块，使它带有一道锐利的左侧“生命线”，并且背景融入了整体的灰调之中：

#quote-box[
  *引自《Typst 官方文档》：*
  Typst 是一款为现代排版而生的全新标记语言，它比 LaTeX 更容易学习，比 Markdown 更加强大。由于它使用 Rust 编写，编译速度更是快到令人发指。
]
