shinyapps_module_UI<-function(id){
  ns<-NS(id)
  project_dataset<-readxl::read_xlsx("./project_details_dataset.xlsx")
  
  fluidPage(
    fluidRow(
      
      lapply(project_dataset$Project_Name, function(i) {
        
        input_dataset <<- project_dataset %>% filter(grepl(paste0("^",i,"$"), Project_Name))
        
        box(
          title = 
            
            
            fluidRow(
              column(width = 9,
                     tags$strong("Project Name : "),
                     (input_dataset$Project_Name)
              ),
              tags$hr(),
              column(width = 9,
                     tags$strong("Domain : "),
                     (input_dataset$domain)),
              tags$hr(),
              column(width = 9,
                     tags$strong("Guide : "),
                     (input_dataset$project_guide)
                     
              )),
          
          
          width = 4,
          collapsible = FALSE,
          actionButton(ns(paste0("view_details", i)), "More Details",style="color: #fff; background-color: #337ab7")
          
        )
      })  
    )
  )
}

shinyapps_module_Server<-function(id,dataset,input_value){

  moduleServer(id, function(input, output, session) {
    project_dataset<-readxl::read_xlsx("./project_details_dataset.xlsx")
    ns<-NS(id)
    
    vals <- reactiveValues()
    observeEvent(project_dataset$Project_Name, {
      
      lapply(project_dataset$Project_Name, function(i) {
        
        input_dataset_more <- project_dataset %>% filter(grepl(paste0("^",i,"$"), Project_Name))
        # browser()
        observeEvent(input[[paste0("view_details", i)]], {
          showModal(
            modalDialog(
              size="xl",
              easyClose = TRUE,
              footer = tagList(bs4Dash::actionButton(ns("popupclose_button"), "Close")),
              htmlOutput(ns("frame"))
            )
          )  
        })
      })
    })
    
    loadframe <- reactive({ 
      paste0("https://sivakumari.shinyapps.io/EDA_Task/?_ga=2.111035205.1366983647.1677234604-956529713.1676446793")
      
      })
    output$frame <- renderUI({
      tags$iframe(src=loadframe(), height=600, width=1094)
    })
    observeEvent(input$popupclose_button,{
      removeModal()
    })      
    
  })
  }
