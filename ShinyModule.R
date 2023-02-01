library("shiny")
library("shinydashboard")

## to display messages to the user in the log file of the App in MoveApps one can use the function from the src/common/logger.R file: logger.fatal(), logger.error(), logger.warn(), logger.info(), logger.debug(), logger.trace() ##

shinyModuleUserInterface <- function(id, label, year) {
  ns <- NS(id) ## all IDs of UI functions need to be wrapped in ns()

  tagList(
    dashboardPage(
      dashboardHeader(title = paste("Add your user interface", year)),
      dashboardSidebar(uiOutput(ns("Sidebar"))), 
      dashboardBody(uiOutput(ns("TabUI")))
    )
  )
}

shinyModule <- function(input, output, session, data, year) { ## The parameter "data" is reserved for the data object passed on from the previous app
  ns <- session$ns ## all IDs of UI functions need to be wrapped in ns()
  current <- reactiveVal(data)

  return(reactive({ current() }))
}
