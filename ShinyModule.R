library("shiny")
library("shinydashboard")

# to display messages to the user in the log file of the App in MoveApps
# one can use the function from the logger.R file:
# logger.info(). Available levels are error(), warn(), info(), debug(), trace()

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

# The parameter "data" is reserved for the data object passed on from the previous app
shinyModule <- function(input, output, session, data, year) {
  # all IDs of UI functions need to be wrapped in ns()
  ns <- session$ns
  current <- reactiveVal(data)

  # if data are not modified, the unmodified input data must be returned
  return(reactive({ current() }))
}
