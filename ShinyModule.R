library("shiny")
library("shinydashboard")

# to display messages to the user in the log file of the App in MoveApps
# one can use the function from the logger.R file:
# logger.fatal(), logger.error(), logger.warn(), logger.info(), logger.debug(), logger.trace()

shinyModuleUserInterface <- function(id, label) {
  # all IDs of UI functions need to be wrapped in ns()
  ns <- NS(id) 
  # showcase to access a file ('auxiliary files') that is 
  # a) provided by the app-developer and 
  # b) can be overridden by the workflow user.
  fileName <- paste0(getAppFilePath("yourLocalFileSettingId"), "sample.txt")
  tagList(
    dashboardPage(
      dashboardHeader(title = paste("MoveApps R-Shiny Dashboard SDK")),
      dashboardSidebar(uiOutput(ns("Sidebar"))), 
      dashboardBody(
        fluidRow(
          box(
            title = "Local App File", 
            readChar(fileName, file.info(fileName)$size)
          )
        ),
        uiOutput(ns("TabUI"))
      )
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
