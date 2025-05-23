#import "./style.typ": *

// 设置图表
#let _set_figure(body) ={
    // 设置前缀
    show figure.where(kind: image): set figure(supplement: [图])
    show figure.where(kind: image): set figure(gap: 1.65em)
    show figure.where(kind: table): set figure(supplement: [表])

    show figure.where(kind: table): set figure.caption(position: top)

    // 使用正确的编号与图表标题字体及分隔符
    show figure.caption: set text(font: 字体.黑体)
    set figure.caption(separator: "　")

    set math.equation(supplement: [公式])

    body
}
