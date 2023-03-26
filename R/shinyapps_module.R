shinyapps_module_UI<-function(id){
  ns<-NS(id)
  fluidPage(
    fluidRow(
      
      lapply(1:3, function(i) {
        

        box(
          title = 
            
            
            fluidRow(
              
              column(width = 9,
                     tags$strong("Project Name : "),
                     ("Project-1")
              ),
              tags$hr(),
              column(width = 9,
                     tags$strong("Domain : "),
                     "project-2"),
              tags$hr(),
              column(width = 9,
                     tags$strong("Guide : "),
                     ("project-3")
                     
              )),
          
          
          width = 4,
          collapsible = FALSE,
          actionButton(paste0("view_details"), "More Details",style="color: #fff; background-color: #337ab7")
          
        )
      })  
    )
  )
}

shinyapps_module_Server<-function(id,dataset,input_value){

  moduleServer(id, function(input, output, session) {

    vals <- reactiveValues()
  })
  }
