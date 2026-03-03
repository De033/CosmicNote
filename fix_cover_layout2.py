import re

with open("template.typ", "r", encoding="utf-8") as f:
    content = f.read()

old_code = """  //------------------------------------------------------------------
  pad(right: -9.7cm, top: 15%)[
    #align(right)[
      #text(36pt, weight: "bold")[#title]
      
      #v(3.5em)
      
      #if description != none {
        text(size: 16pt, style: "italic")[#description]
      }
      
      #v(0.5em)
      
      #if authors.len() > 0 {"""

new_code = """  //------------------------------------------------------------------
  pad(right: -9.7cm, top: 15%)[
    #align(right)[
      #text(36pt, weight: "bold")[#title]
      
      #v(0.5em)
      
      #if description != none {
        text(size: 16pt, style: "italic")[#description]
      }
    ]
  ]
  
  #v(1fr)
  
  pad(right: -9.7cm, bottom: 10%)[
    #align(right)[
      #if authors.len() > 0 {"""

if old_code in content:
    content = content.replace(old_code, new_code)
    with open("template.typ", "w", encoding="utf-8") as f:
        f.write(content)
    print("Success")
else:
    print("Pattern not found")

