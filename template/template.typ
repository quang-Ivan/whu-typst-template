#import "utils/style.typ": *
#import "utils/indent.typ": *

// font size is referenced from https://zhuanlan.zhihu.com/p/504550803

#let equation_num(_) = {
  locate(loc => {
    let chapt = counter(heading).at(loc).at(0)
    let c = counter("equation-chapter" + str(chapt))
    let n = c.at(loc).at(0)
    "(" + str(chapt) + "-" + str(n + 1) + ")"
  })
}

#let table_num(_) = {
  locate(loc => {
    let chapt = counter(heading).at(loc).at(0)
    let c = counter("table-chapter" + str(chapt))
    let n = c.at(loc).at(0)
    str(chapt) + "-" + str(n + 1)
  })
}

#let image_num(_) = {
  locate(loc => {
    let chapt = counter(heading).at(loc).at(0)
    let c = counter("image-chapter" + str(chapt))
    let n = c.at(loc).at(0)
    str(chapt) + "." + str(n + 1) + "　"
  })
}

#show figure.caption: it => {
  set text(
    font: 字体.宋体,
    size: 字号.五号,
    weight: "bold"
  )
  it
}

#let equation(equation, caption: "") = {
  figure(
    equation,
    caption: figure.caption(
      position: right,
      separator: [],
      caption
    ),
    supplement: [公式],
    numbering: equation_num,
    kind: "equation",
  )
}

#let tbl(tbl, caption: "") = {
  figure(
    tbl,
    caption: figure.caption(
      position: top,
      separator: [],
      caption
    ),
    supplement: [表],
    numbering: table_num,
    kind: "table",
  )
}

#let img(img, caption: "") = {
  figure(
    img,
    caption: figure.caption(
      separator: [],
      caption
    ),
    supplement: [图],
    numbering: image_num,
    kind: "image",
  )
}

// 三线表
#let tlt_header(content) = {
  set align(center)
  rect(
    width: 100%,
    stroke: (bottom: 1pt),
    [#content],
  )
}

#let tlt_cell(content) = {
  set align(center)
  rect(
    width: 100%,
    stroke: none,
    [#content]
  )
}

#let tlt_row(r) = {
  (..r.map(tlt_cell).flatten())
}

#let three_line_table(values) = {
  rect(
    stroke: (bottom: 1pt, top: 1pt),
    inset: 0pt,
    outset: 0pt,
    grid(
      columns: (auto),
      rows: (auto),
      // table title
      grid(
        columns: values.at(0).len(),
        ..values.at(0).map(tlt_header).flatten()
      ),

      grid(
        columns: values.at(0).len(),
        ..values.slice(1).map(tlt_row).flatten()
      ),
    )
  )
}

#let cover(
  title: "",
  auther: "",
  id: "",
  major: "",
  school: "",
  mentor: "",
  date: ""
) = {
  align(center)[
    #v(62pt)

    #let logo = "./assets/whu.png"
    #image(logo, width: 33%, height: 10%, fit: "contain")

    #text(
      size: 字号.二号,
      font: 字体.宋体,
      weight: "bold"
    )[本科毕业论文（设计）]

    #v(59pt)

    #text(
      size: 字号.一号,
      font: 字体.楷体,
      title
    )

    #v(86pt)

    #let info_block(content) = {
      text(
        font: 字体.宋体,
        size: 字号.四号,
        content
      )
    }
    #grid(
      columns: (70pt, 150pt),
      rows: (32pt, 32pt),
      info_block("姓　　名："),
      info_block(auther),
      info_block("学　　号："),
      info_block(id),
      info_block("专　　业："),
      info_block(major),
      info_block("学　　院："),
      info_block(school),
      info_block("指导教师："),
      info_block(mentor)
    )

    #v(91pt)

    #text(
      font: 字体.宋体,
      size: 字号.四号,
      spacing: 150%,
      date
    )
  ]
}


#let declaration(
  auther_signature_path: "",
  mentor_signature_path: ""
) = {

  let signature_block() = {
    let text_block(margin_top, content) = {
      text(
        font: 字体.宋体,
        size: 字号.小四,
      )[
        #v(margin_top)
        #content
      ]
    }

    align(right)[
      #grid(
        columns: (60pt, 72pt, 84pt, 72pt),
        rows: (20pt),
        text_block(8pt, "作者签名："),
        image(auther_signature_path, fit: "contain"),
        text_block(8pt, "指导老师签名："),
        image(mentor_signature_path, fit: "contain"),
      )
      #grid(
        columns: (60pt, 228pt),
        text_block(0pt, "日　　期："),
        grid.cell(
          text_block(0pt, "　　　　　年　　月　　日"),
          align: left
        )
      )
    ]
  }


  align(center)[
    #text(
      font: 字体.黑体,
      size: 字号.小二
    )[原创性声明]
  ]

  v(30pt)
  text(
    font: 字体.宋体,
    size: 字号.小四
  )[
    #set par(leading: 1.25em, first-line-indent: 2em)
    本人郑重声明：所呈交的论文（设计），是本人在指导教师的指导下，严格按照学校和学院有关规定完成的。除文中已经标明引用的内容外，本论文（设计）不包含任何其他个人或集体已发表及撰写的研究成果。对本论文（设计）做出贡献的个人和集体，均已在文中以明确方式标明。本人承诺在论文（设计）工作过程中没有伪造数据等行为。若在本论文（设计）中有侵犯任何方面知识产权的行为，由本人承担相应的法律责任。
  ]

  v(38pt)
  signature_block()

  v(66pt)
  align(center)[
    #text(
      font: 字体.黑体,
      size: 字号.小二
    )[版权使用授权书]
  ]

  v(35pt)
  text(
    font: 字体.宋体,
    size: 字号.小四
  )[
    #set par(leading: 1.25em, first-line-indent: 2em)
    本人完全了解武汉大学有权保留并向有关部门或机构送交本论文（设计）的复印件和电子版，允许本论文（设计）被查阅和借阅。本人授权武汉大学将本论文的全部或部分内容编入有关数据进行检索和传播，可以采用影印、缩印或扫描等复制手段保存和汇编本论文（设计）。
  ]

  v(38pt)
  signature_block()
}


#let abstract(
  abstract_zh: [],
  abstract_en: [],
  keywords_zh: (),
  keywords_en: ()
) = {
  set heading(level: 1, numbering: none)
  show <_abstract_zh_>: {
    align(center)[
      #v(5pt)
      #text(
        font: 字体.黑体,
        size: 字号.小二,
        weight: "regular"
      )[摘　　要]
    ]
  }
  [= 摘要 <_abstract_zh_>]

  v(5pt)

  par(
    leading: 1.5em,
    first-line-indent: 2em
  )[
    #text(
      font: 字体.宋体,
      size: 字号.小四,
      abstract_zh
    )
  ]
  v(5pt)
  text(
    font: 字体.宋体,
    size: 字号.小四,
    weight: "bold"
  )[关键词：]
  text(
    font: 字体.宋体,
    size: 字号.小四,
  )[#keywords_zh.join("；")]

  pagebreak()

  set heading(level: 1, numbering: none)
  show <_abstract_en_>: {
    align(center)[
      #v(5pt)
      #text(
        font: 字体.宋体,
        size: 字号.小二,
        weight: "bold"
      )[ABSTRACT]
    ]
  }
  [= ABSTRACT <_abstract_en_>]

  v(5pt)

  par(
    leading: 1.5em,
    first-line-indent: 2em
  )[
    #text(
      font: 字体.宋体,
      size: 字号.小四,
      abstract_en
    )
  ]
  v(5pt)
  text(
    font: 字体.宋体,
    size: 字号.小四,
    weight: "bold"
  )[Keywords: ]
  text(
    font: 字体.宋体,
    size: 字号.小四,
  )[#keywords_en.join(";")]
}

#let outline() = {
  align(center)[
    #text(
      font: 字体.黑体,
      size: 字号.小二
    )[目　　录]
  ]

  set par(
    first-line-indent: 0em,
    leading: 1.25em
  )

  set text(
    font: 字体.宋体,
    size: 字号.四号,
  )

  locate(loc => {
    let elements = query(heading.where(outlined: true), loc)
    for el in elements {
      if el.level >= 4 {continue}

      let before_toc = query(heading.where(outlined: true).before(loc), loc).find((one) => {one.body == el.body}) != none
      let page_num = if before_toc {
        numbering("I", counter(page).at(el.location()).first())
      } else {
        counter(page).at(el.location()).first()
      }

      link(el.location())[#{
        // acknoledgement has no numbering
        let chapt_num = if el.numbering != none {
          numbering(el.numbering, ..counter(heading).at(el.location()))
        } else {none}

        if el.level == 1 {
          set text(weight: "bold")
          if chapt_num == none {} else {
            text(
              font: 字体.宋体,
              size: 字号.小四,
              (el.level - 1) * "　" +  chapt_num
            )
            " "
          }
          el.body
        } else {
          text(
            font: 字体.宋体,
            size: 字号.小四,
            (el.level - 1) * "　" +  chapt_num
          )
          " "
          el.body
        }
      }]

      // fill with ......
      box(width: 1fr, h(0.5em) + box(width: 1fr, repeat[.]) + h(0.5em))
      [#page_num]
      linebreak()
    }
  })
}

#let project(
  title: "",
  auther: "",
  id: "",
  major: "",
  school: "",
  mentor: "",
  date: "",

  auther_signature_path: "./assets/blank.png",
  mentor_signature_path: "./assets/blank.png",

  abstract_zh: [],
  abstract_en: [],
  keywords_zh: (),
  keywords_en: (),

  content
) = {
  cover(
    title: title,
    auther: auther,
    id: id,
    major: major,
    school: school,
    mentor: mentor,
    date: date
  )
  pagebreak()

  set page(margin: (x: 90pt, y: 82pt))

  declaration(
    auther_signature_path: auther_signature_path,
    mentor_signature_path: mentor_signature_path
  )
  pagebreak()

  set page(
    footer: {
      set align(center)

      text(
        font: 字体.宋体,
        size: 字号.五号,
        counter(page).display("I")
      )
    }
  )
  counter(page).update(1)

  abstract(
    abstract_zh: abstract_zh,
    abstract_en: abstract_en,
    keywords_zh: keywords_zh,
    keywords_en: keywords_en
  )
  pagebreak()

  outline()

  pagebreak()

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