#import "../utils/style.typ": *
#import "../utils/indent.typ": *

#let main-matter(content) = {
  // Set headings
  set heading(numbering: (..nums) => {
    nums.pos().map(str).join(".") + "　"
  })

  show heading.where(level: 1): it => {
    set align(center)
    set text(weight: "bold", font: 字体.黑体, size: 字号.小二)
    set block(spacing: 1.5em)
    it
  }

  show heading.where(level: 2): it => {
    set text(weight: "bold", font: 字体.黑体, size: 字号.四号)
    set block(above: 1.5em, below: 1.5em)
    it
  }

  set page(
    header: {
      set text(
        font: 字体.宋体,
        size: 字号.五号,
        baseline: 8pt,
        spacing: 6pt
      )
      set align(center)
      [武 汉 大 学 本 科 毕 业 论 文 （ 设 计 ）]
      line(length: 100%, stroke: 0.7pt)
    counter(footnote).update(0)
    },

    footer: {
      set align(center)
      text(
        font: 字体.宋体,
        size: 字号.五号,
        counter(page).display("1")
      )
    }
  )
  counter(page).update(1)
  set text(
    font: 字体.宋体,
    size: 字号.小四
  )
  set par(
    first-line-indent: 2em,
    leading: 1.5em
  )

  show table.cell: set par(leading: 0.5em)

  // distance between two par
  // reference: https://github.com/typst/typst/issues/686#issuecomment-1811330876
  show par: set block(spacing: 1.5em)

  // magic to fix the issue of no indentation in the first line of the first paragraph
  show heading: it => {
    set text(weight: "bold", font: 字体.黑体, size: 字号.小四)
    set block(above: 1.5em, below: 1.5em)
    it
  } + fake-par

  content
}