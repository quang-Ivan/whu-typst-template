#let pool = ("①", "②", "③", "④", "⑤", "⑥", "⑦", "⑧", "⑨", "⑩",
"⑪", "⑫", "⑬", "⑭", "⑮", "⑯", "⑰", "⑱", "⑲", "⑳",
"㉑", "㉒", "㉓", "㉔", "㉕", "㉖", "㉗", "㉘", "㉙", "㉚",
"㉛", "㉜", "㉝", "㉞", "㉟", "㊱", "㊲", "㊳", "㊴", "㊵",
"㊶", "㊷", "㊸", "㊹", "㊺", "㊻", "㊼", "㊽", "㊾", "㊿") 

#let convert-circled(
  number
) = {
  pool.at(number - 1)
}
