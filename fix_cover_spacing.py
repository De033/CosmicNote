import re

with open("template.typ", "r", encoding="utf-8") as f:
    content = f.read()

old_code = """      #text(36pt, weight: "bold")[#title]
      
      #v(0.5em)
      
      #if description != none {
        text(size: 16pt, style: "italic")[#description]
      }
      
      #v(2em)
      
      #if authors.len() > 0 {"""

new_code = """      #text(36pt, weight: "bold")[#title]
      
      #v(3.5em)
      
      #if description != none {
        text(size: 16pt, style: "italic")[#description]
      }
      
      #v(0.5em)
      
      #if authors.len() > 0 {"""

if old_code in content:
    content = content.replace(old_code, new_code)
    with open("template.typ", "w", encoding="utf-8") as f:
        f.write(content)
    print("Success")
else:
    print("Pattern not found")

