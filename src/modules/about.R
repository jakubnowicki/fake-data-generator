import("shiny")
import("shiny.fluent")

export("ui")

ui <- function(id) {
  ns <- NS(id)

  Stack(
    Separator("Fake Data Generator"),
    p("Fake Data Generator is an application that enables creating dummy data (in the shape of a data frame).
    User can design structure by specifying columns and size, all using YAML editor, with live data preview.
    Configuration, dummy data and generator itself can be easily downloaded.
    You can check the application code here: ", Link(
      href = "https://github.com/jakubnowicki/fake-data-generator",
      target = "_blank",
      "jakubnowicki/fake-data-generator"
    )),
    p("
    Under the hood, this application uses fixtuRes package and can be treated as its showcase.
    "),
    Separator("fixtuRes package"),
    p(
      "fixtuRes package provides a set of tools that allow generating random mock data for testing or to use during development."
    ),
    p(
      "For installation instructions and detailed documentation check this link: ",
      Link(
        href = "https://jakubnowicki.github.io/fixtuRes/",
        target = "_blank",
        "jakubnowicki/fixtuRes"
      )
    ),
    Separator("About me"),
    p(
      "My name is Jakub and I'm an R Shiny developer working at ",
      Link(
        href = "https://appsilon.com/",
        target = "_blank",
        "Appsilon"
      ),
      ". I'm also a paleontologist focused on Cambian trilobites."
    ),
    p(
      "You can find me on ",
      Link(
        href = "https://twitter.com/q_nowicki",
        target = "_blank",
        "Twitter"
      ),
      ", ",
      Link(
        href = "https://github.com/jakubnowicki",
        target = "_blank",
        "GitHub"
      ),
      ", ",
      Link(
        href = "https://www.linkedin.com/in/jakub-nowicki",
        target = "_blank",
        "LinkedIn"
      ),
      " and ",
      Link(
        href = "https://www.researchgate.net/profile/Jakub_Nowicki",
        target = "_blank",
        "ResearchGate."
      )
    )
  )
}
