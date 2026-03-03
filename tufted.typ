// 兼容 de033 博客项目中的 tufted-lib
// 这个文件作为 PDF 环境下的替代实现，能够正确将 Tufte 风格的旁注放入侧边栏

#let margin-note(content) = context {
  // 使用 context 获取当前绝对位置，并推算到右侧边距中
  // 页面总宽 29.7cm，左边距 2.5cm，右边距 12.2cm
  // 正文宽度 = 29.7 - 2.5 - 12.2 = 15cm
  // 正文右边缘绝对 X 坐标为 2.5 + 15 = 17.5cm
  // 旁注放置在 18cm 处（距离正文0.5cm），留给旁注的宽度为 10cm
  let pos = here().position()
  let target-x = 18cm
  place(
    dx: target-x - pos.x,
    dy: 0.1em, // 微调垂直对齐
    box(
      width: 10cm,
      text(size: 9pt, fill: rgb("#7F8C8D"), content)
    )
  )
}

// 全宽内容，跨越正文和边栏
#let full-width(content) = context {
  let pos = here().position()
  let target-x = 2.5cm
  // 全宽内容占据正文加边栏区域 (向右延伸 11.2cm)
  pad(left: target-x - pos.x, right: -11.2cm, content)
}
