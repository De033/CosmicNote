import re

with open("template.typ", "r", encoding="utf-8") as f:
    content = f.read()

# Find the part between `//------------------------------------------------------------------` and `pagebreak()`
start_marker = "  //------------------------------------------------------------------\n"
end_marker = "  pagebreak()\n"

start_idx = content.find(start_marker)
end_idx = content.find(end_marker, start_idx)

new_cover_code = """  //------------------------------------------------------------------
  pad(right: -9.7cm, top: 15%)[
    #align(right)[
      #text(36pt, weight: "bold")[#title]
      
      #v(0.5em)
      
      #if description != none {
        text(size: 16pt, style: "italic")[#description]
      }
      
      #v(2em)
      
      #if authors.len() > 0 {
        box(inset: (y: 10pt), {
          authors.map(author => {
            text(16pt, weight: "semibold")[
              #if "homepage" in author {
                [#link(author.homepage)[#author.name]]
              } else { author.name }]
            if "affiliations" in author {
              super(author.affiliations)
            }
            if "github" in author {
              link(author.github, box(height: 1.1em, baseline: 13.5%)[#image(bytes(githubSvg))])
            }
          }).join(", ", last: {
            if authors.len() > 2 {
              ", and"
            } else {
              " and"
            }
          })
        })
      }
      
      #v(-2pt, weak: true)
      
      #if affiliations.len() > 0 {
        box(inset: (bottom: 10pt), {
          affiliations.map(affiliation => {
            text(12pt)[
              #super(affiliation.id)#h(1pt)#affiliation.name
            ]
          }).join(", ")
        })
      }

      #if date != none {
        text(12pt, date)
      }
    ]
  ]
  
"""

new_content = content[:start_idx] + new_cover_code + content[end_idx:]

with open("template.typ", "w", encoding="utf-8") as f:
    f.write(new_content)
