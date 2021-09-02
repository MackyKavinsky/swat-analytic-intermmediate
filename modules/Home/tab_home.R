library(shinydashboard)

tab_home_ui <- function(id) {
  ns <- shiny::NS(id)
  
  tabItem(
    tabName = "welcome",
    fluidRow(
      box(title = "Welcome to the SWAT Analytics Basic Dashboard",
          solidHeader = TRUE,
          width = 12,
          status = "primary",
          
          column(6, div(img(src = "test1.jpg", width = "80%"), style = "text-align:center; margin-top: 15px;") ),
          column(6, br(),
                 #h5(p("This application can helps in exploring the dataset to get the results. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. ")),
                 #br(),
                 h4(p("The functionality available:")),
                 HTML('<p><ul><li>Import Data</li><li>Data Transformation</li><li>Data Visualization</li></ul></p>'),
                 br(),
                 #h5(p("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")),
                 br(),
                 h4("This dashboard was built with RShiny by RStudio",
                    img(src = "https://www.rstudio.com/wp-content/uploads/2014/04/shiny.png", height = "25px"),
                    #"  by  ",
                    img(src = "https://www.rstudio.com/wp-content/uploads/2014/07/RStudio-Logo-Blue-Gray.png", height = "25px"))
          )
          
      ) #end of box
    )
    
    #fluidRow(
      
     # box(
      #  title = "Manuals to use the Dashboard",
      # solidHeader = TRUE,
      #  width = 6,
      #  status = "primary",
      #  h5(p("The manuals on how to use the dashboard will be available on the HELP tab. There will be guide on how to use the SWAT Analytics Basic Dashboard on the HELP menu.")),
      #  HTML('<p>For more information on the Dashboard, please visit the link below:<br/> <a href = "https://shiny.rstudio.com/reference/shiny/" >RShiny Dashboard by RStudio</a></p>')
        
      #),
      
      #box(
      #  title = "Author",
      #  solidHeader = TRUE,
      #  width = 6,
      #  status = "primary",
      #  h5(p("This dashboard is made by Statworks Group. Due to the nature of this wide-ranging audience, the dashboard provides explanations for how the data used are calculated and/or reported to provide necessary context for interpretation.")),
      #  HTML('<p>For more information on the Statworks Group, please visit the link below:<br/> <a href = "https://www.statwks.com/" >&copy; Statworks Group</a></p>')
      #)
      
    ) 
    
    
  
}

tab_home <- function(
  input, output, session, .values
) {
  
  ns <- session$ns
  
  shiny::observeEvent(input$help_getting_started, {
    .values$help$open("getting_started")
  })
  
  shiny::observeEvent(input$nav_data, {
    .values$navbar$open("data")
  })
  
  shiny::observeEvent(input$nav_transformation, {
    .values$navbar$open("transformation")
  })
  
  shiny::observeEvent(input$nav_import_csv, {
    .values$navbar$open("import_csv")
  })
  
  shiny::observeEvent(input$nav_import_rds, {
    .values$navbar$open("import_rds")
  })
  
  shiny::callModule(
    module = explorer,
    id = "id_explorer",
    .values = .values,
    .root_node_r = shiny::reactive(.values$tree$get_root_node()),
    .explorer_classes = .values$explorer_classes,
    addable_r = shiny::reactive("__group__"),
    visible_r = shiny::reactive(c("__group__", "dataset")),
    .label_list = shinyExplorer::label_explorer(
      add_group = "New folder"
    )
  )
}