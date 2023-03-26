
# Load all libraries     

library(bs4Dash)
library(shiny)
library(shinyWidgets)


# Source files of modules
source("R/login_page.R")
source("R/Shinyapps_module.R")


ui<- fluidPage(
    tags$div(class = "header_class",
             tags$h1("Shiny web App Architecture")),
    tags$hr(),
    includeCSS("www/main.css"),  # Include the css file
    
    useBs4Dash(), # use bs4 to have a single page layout
    
   
    # UI of the upload dataset fileinput widget
    
    fluidPage(
        shinyapps_module_UI("shinyapps_label")
    )) # End of the fluid row
    

server <- function(input, output, session) {

}

shinyApp(ui, server)

# End of the shiny application
