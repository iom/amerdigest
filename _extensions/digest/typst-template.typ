
// Colors
#let color-dark = rgb("#0033A0")
#let color-main = rgb("#4068B8")
#let color-subtle = rgb("#8099D0")
#let color-fade = rgb("#B3C2E3")
#let color-number = rgb("#ADC9F2")
#let color-stroke = rgb("#CEDEF7")
#let color-light = rgb("#f4f8fd")

// Styles
#let font-family = "Gill Sans Nova"
#let fontsize = 7pt
#let fontsize-med = 8.5pt
#let fontsize-big = 18pt
#let fontsize-small = 6pt
#let b(body) = text(weight: "bold", fill: color-dark)[#body]

// Constants
#let product-title = "Mobility in the Americas Digest"
#let date-dmy = datetime.today().display(
  "[day padding:none] [month repr:long] [year]"
)
#let date-ymd = datetime.today().display(
  "[year], [month repr:long] [day padding:none]"
)

// Images
#let logo-path = "./inst/gdi-logo-white/GDILOGO.png"

// Section header

#let header(name: none, note: "") = {
  set rect(height: 100%, outset: 1pt, fill: color-dark)

  grid(
    columns: (auto, 1fr),
    rows: (.4cm, .025cm),

    rect(width: auto, inset: 2pt)[
      #text(
        weight: "bold",
        size: fontsize-med,
        fill: white,
        baseline: 1pt
      )[#upper(name)]
    ],
    rect(fill: none, stroke: none)[
      #text(
        style: "italic",
        size: fontsize,
        fill: color-main,
        baseline: -3pt
      )[#note]
    ],
    grid.cell(colspan: 2, rect(width: 100%))
  )
}

#let chartitle(title) = {
  set text(weight: "bold", size: fontsize-med)
  align(center)[#title]
}

// Caption formatting

#let caption(body, ncol: 2) = {
  set text(size: fontsize, fill: color-main)
  set par(leading: .5em)
  set box(
    width: 100%, 
    fill: color-light,
    inset: .8em,
    stroke: (top: 1.5pt + color-stroke, rest: none)
  )

  box[#columns(ncol, gutter: 2.5em)[#body]]
}

// Template proper

#let article(
  title: none,
  iso: none,
  version: none,
  logo: logo-path,
  doc
) = {

  set par(justify: true)
  set text(
    font: font-family,
    size: fontsize,
    fill: color-subtle
  )

  set page(
    paper: "a4",
    margin: (x: 2cm, y: 2cm),
    numbering: "1",

    // Header shows product name, country, and date
    header: context { 
      if(counter(page).get().at(0) > 1) [
        #set align(center)
        #set text(fill: color-subtle)
        #grid(
          rows: 1.5cm,
          columns: (auto, 1fr, auto),
          text[#upper(product-title) | #date-dmy],
          none,
          text[#upper(title)],
        )
      ] else [
        none
      ]
    },

    // Footer shows explanation of value distribution icons
    footer: context [
      #set align(center)
      #set text(fill: color-subtle)

      #counter(page).display("1")
    ]
  )

  // Header styling

  show heading.where(level: 1): it => [
    #set text(size: fontsize-med, baseline: 1pt, weight: "bold", fill: white)
    #set align(left)
    #set block(above: 1em)
    #set rect(height: 100%, outset: 1pt, fill: color-dark)

    #pad(bottom: 5pt)[
      #grid(
        rows: (.4cm, .025cm),
        columns: (auto, 1fr),

        rect(width: auto, inset: 2pt)[#text[#upper(it.body)]],
        none,
        grid.cell(colspan: 2, rect(width: 100%))
      )
    ]
  ]

  show heading.where(level: 2): it => [
    #set text(size: fontsize-med, baseline: 1pt, weight: "bold", fill: white)
    #set align(left)
    #set rect(width: auto, height: .4cm, inset: 2pt, outset: 1pt, fill: color-dark)
    #pad(bottom: 3pt)[#rect[#text[#upper(it.body)]]]
  ]

  // Hero banner

  place(left + top, dx: -2cm, dy: -2cm)[
    #rect(
      fill: color-dark,
      width: 21cm,
      height: 3.5cm,
    )
  ]

  place(left + top, dx: -.75cm, dy: -.75cm, float: true,
    grid(
      rows: (1.65cm),
      columns: (14.75cm, 4.25cm),
      row-gutter: .25cm,
   
      block(inset: 7pt)[

        #let product = block[
          #set text(size: 1.2em, tracking: .5pt, fill: color-fade)
          #upper(product-title) | #date-dmy
        ]

        #let country = block[
          #set text(tracking: .5pt, size: fontsize-big, weight: "bold", fill: white)
          #upper(title)
        ]

        #let citation = block[
          #set text(fill: color-fade)
          Cite as: International Organization for Migration, Global Data Institute. #date-ymd #text(style: "italic")[#product-title: #title.]
        ]

        #product
        #country
        #citation
      ],

      block[
        #image(logo, width: 4.25cm)
      ]
    )
  )

  // About and contents boxes

  let figure = text(style: "italic", fill: color-subtle)[→ Figure]
  let figures = text(style: "italic", fill: color-subtle)[→ Figures]
  let nbox(body) = {
    set text(size: .65em, weight: "bold", fill: white)
    box(
      fill: color-number, 
      inset: (x: 1.5pt, y: .7pt),
      outset: (y: 1.5pt)
    )[#body]
  }

  grid(
    columns: (35%, 1%, 1fr),

    block(fill: color-light, inset: 1.1em)[

      == ABOUT
      
      #block[
        #pad(bottom: 3pt)[
          #set text(size: fontsize-med, fill: color-dark)
          #set par(leading: .5em)
            
          The #text(weight: "bold")[Mobility in the Americas Digest] is....

          Data disclaimers...
        ]
      ]
    ],

    none,

    block(inset: .8em)[

      == CONTENTS
      
      #pad(bottom: 3pt)[
        #block[
          #set text(size: fontsize, fill: color-main)
          #set par(leading: .5em)
          #set block(spacing: 1em)

          #b[Heading]

          - Bullet point #figures #nbox[1] #nbox[2]
        ]
      ]
    ]
  )
  
  // Body of document

  doc

  // Fine print information

  block(above: 3em)[
    #set par(leading: .5em, justify: true)
    #set text(size: fontsize-small, fill: color-subtle)

     This Digest was prepared by ... of the International Organization for Migration (IOM) using the publishing system Quarto. Charts and captions were generated using R and layouting was done using Typst. For questions and suggestions, contact ... #text(size: .75em, fill: color-fade)[v. #version]
  ]
}
